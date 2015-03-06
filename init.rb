require "redmine"
require "project"

require_dependency 'redmine_github_issue/hooks'

module ProjectPatch
  def self.included(base)
    # Same as typing in the class
    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      has_many :github_repos
    end
  end
end

Redmine::Plugin.register :redmine_github_issue do
  name 'Redmine Github Issue'
  author 'Takayuki Sakai'
  description 'Plugin which makes a github issue automatically on creating a new redmine ticket'
  version '0.0.1'
  url 'https://github.com/TakayukiSakai/redmine_github_issue'
  author_url 'https://github.com/TakayukiSakai'

  GITHUB_CONFIG = YAML.load_file("#{Rails.root.to_s}/plugins/redmine_github_issue/config/github.yml")
end

Project.send(:include, ProjectPatch)
