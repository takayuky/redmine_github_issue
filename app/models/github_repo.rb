class GithubRepo < ActiveRecord::Base
  unloadable
  attr_accessible :project_id, :name, :owner, :user, :pass

  belongs_to :project
end
