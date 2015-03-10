class GithubRepo < ActiveRecord::Base
  unloadable
  attr_accessible :project_id, :name, :owner, :user, :pass

  belongs_to :project
  has_many :issues
end
