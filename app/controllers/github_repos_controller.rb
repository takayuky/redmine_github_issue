class GithubReposController < ApplicationController
  unloadable

  def new_in_project
    @project = Project.find(params[:id])
    @github_repo = @project.github_repos.build
  end

  def create
  end

  def index_in_project
    @project = Project.find(params[:id])
    @github_repos = @project.github_repos
    render template: 'github_repos/index'
  end

  def edit
    @github_repo = GithubRepo.find(params[:id])
    @project = @github_repo.project
  end

  def update
  end

  def destroy
  end

  private
    def github_repo_params
      params.require(:github_repo).permit(:project_id, :name, :owner, :user, :pass)
    end
end
