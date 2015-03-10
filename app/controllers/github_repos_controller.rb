class GithubReposController < ApplicationController
  unloadable

  def new_in_project
    @project = Project.find(params[:id])
    @github_repo = @project.github_repos.build
  end

  def create
    @github_repo = GithubRepo.new(github_repo_params)
    if @github_repo.save
      redirect_to index_github_repos_path(@github_repo.project)
    else
      render :action => 'new_in_project'
    end
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
    @github_repo = GithubRepo.find(params[:id])
    @github_repo.update(github_repo_params)
    redirect_to index_github_repos_path(@github_repo.project)
  end

  def destroy
    @github_repo = GithubRepo.find(params[:id])
    @project = @github_repo.project
    @github_repo.destroy
    redirect_to index_github_repos_path(@project)
  end

  private
    def github_repo_params
      params.require(:github_repo).permit(:project_id, :name, :owner, :user, :pass)
    end
end
