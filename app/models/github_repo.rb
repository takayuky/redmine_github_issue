class GithubRepo < ActiveRecord::Base
  unloadable

  belongs_to :project
  has_many :issues

  attr_accessible :project_id, :name, :owner, :user, :pass
  validates :project_id, presence: true
  validates :name, presence: true
  validates :owner, presence: true
end
