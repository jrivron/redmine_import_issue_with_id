require 'issue_import_patch'

Redmine::Plugin.register :redmine_import_issue_with_id do
  name 'Import issue with id plugin'
  author 'jerome rivron'
  description 'This is a redmine plugin to import issue to redmine including id'
  version '0.0.1'
  url 'http://github.com/jrivron'
  author_url 'http://github.com/jrivron'
end
