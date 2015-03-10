require_dependency 'issue'

class Issue
  belongs_to :github_repo
  attr_accessible :github_repo_id
  safe_attributes :github_repo_id
end
