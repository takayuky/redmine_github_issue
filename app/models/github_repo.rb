class GithubRepo < ActiveRecord::Base
  unloadable

  belongs_to :project
  has_many :issues

  attr_accessible :project_id, :name, :owner, :user, :pass
  validates :project_id, presence: true
  validates :name, presence: true
  validates :owner, presence: true

  validate :github_auth?

  def github_auth?
    uri = URI.parse("https://api.github.com")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new("/repos/#{owner}/#{name}")
    request.basic_auth(user, pass)

    response = https.request(request)
    unless response.code == "200"
      errors.add(:data, "seems to be wrong. We couldn't access to the github repository")
    end
  end
end
