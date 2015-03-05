module AutoGithubIssue
  class Hooks < Redmine::Hook::ViewListener
    def controller_issues_new_before_save(context={ })
      context[:issue].description = "Auto-created github issue url will be shown here!!\n\n#{context[:issue].description}"
    end
  end
end