class CreateGithubRepos < ActiveRecord::Migration
  def change
    create_table :github_repos do |t|
      t.integer :project_id, null: false

      t.string :name, null: false
      t.string :owner, null: false
      t.string :user, null: false
      t.string :pass, null: false

      t.timestamps null: true
    end
  end
end
