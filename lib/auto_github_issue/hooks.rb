module AutoGithubIssue
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_after_save(context={ })
      issue = context[:issue]
      request = context[:request]
      issue.description = "this issue's url is #{request.protocol}#{request.domain}/issues/#{issue.id}\n\n#{issue.description}"
      issue.save
    end
  end
end