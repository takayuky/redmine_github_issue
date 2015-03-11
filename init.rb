require "redmine"

require_dependency 'redmine_github_issue/hooks'
require_dependency 'redmine_github_issue/project_patch'
require_dependency 'redmine_github_issue/issue_patch'

Redmine::Plugin.register :redmine_github_issue do
  name 'Redmine Github Issue'
  author 'Takayuki Sakai'
  description 'Plugin which makes a github issue automatically on creating a new redmine ticket'
  version '0.0.1'
  url 'https://github.com/TakayukiSakai/redmine_github_issue'
  author_url 'https://github.com/TakayukiSakai'

  permission :github_repos, { :github_repos => [:index_in_project] }, :public => true
  menu :project_menu, :github_repos, { controller: 'github_repos', action: 'index_in_project' }, caption: 'GitHub'
end
