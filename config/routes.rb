# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :github_repos, except: ['new', 'index', 'show']
get 'projects/:id/github_repos/new', to: 'github_repos#new_in_project', as: 'new_github_repo'
get 'projects/:id/github_repos', to: 'github_repos#index_in_project', as: 'index_github_repos'
