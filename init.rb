require "redmine"

require_dependency 'auto_github_issue/hooks'

Redmine::Plugin.register :auto_github_issue do
  name 'Auto Github Issue Creator'
  author 'Takayuki Sakai'
  description 'Plugin which makes a github issue automatically on creating a new redmine ticket'
  version '0.0.1'
  url 'https://github.com/TakayukiSakai/auto_github_issue'
  author_url 'https://github.com/TakayukiSakai'

  GITHUB_CONFIG = YAML.load_file("#{Rails.root.to_s}/plugins/auto_github_issue/config/github.yml")
end
