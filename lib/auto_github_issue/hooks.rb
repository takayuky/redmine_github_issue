module AutoGithubIssue
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_after_save(context={ })
      issue = context[:issue]

      uri = URI.parse("https://api.github.com")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new("/repos/#{GITHUB_CONFIG['repository_owner']}/#{GITHUB_CONFIG['repository']}/issues")
      request.basic_auth(GITHUB_CONFIG['username'], GITHUB_CONFIG['password'])
      request.body = {
        title: issue.subject,
        body: "This issue is associated with [this Redmine ticket](#{context[:request].protocol}#{context[:request].domain}/issues/#{issue.id})\n\n#{issue.description}."
      }.to_json

      response = https.request(request)

      issue.description = "#{JSON.parse(response.body)['html_url']}\n\n#{issue.description}"
      issue.save
    end
  end
end