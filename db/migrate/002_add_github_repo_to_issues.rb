class AddGithubRepoToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :github_repo_id, :integer
  end
end
