require_dependency 'issue_import'

module IssueImportWithIdPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :build_object , :id
    end
  end

  module InstanceMethods
  def build_object_with_id(row)
    issue = build_object_without_id(row)
    if issue_id = row_value(row, 'issue_id')
       issue.id = issue_id
       # to avoid exception in case of duplicate id force error  by removing traker_id
       # to do manage right message
       if Issue.find_by_id(issue_id) : nil
          issue.tracker_id = nil
       end
    end
    issue 
  end 
end
IssueImport.send(:include, IssueImportWithIdPatch)

