class GithubRepo < ActiveRecord::Base
  unloadable

  belongs_to :project
end
