# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 86) do

  create_table "companies", :force => true do |t|
    t.column "name",          :string,   :limit => 200, :default => "", :null => false
    t.column "contact_email", :string,   :limit => 200
    t.column "contact_name",  :string,   :limit => 200
    t.column "created_at",    :datetime
    t.column "updated_at",    :datetime
    t.column "subdomain",     :string,                  :default => "", :null => false
  end

  add_index "companies", ["name"], :name => "name", :unique => true
  add_index "companies", ["subdomain"], :name => "companies_subdomain_index", :unique => true

  create_table "customers", :force => true do |t|
    t.column "company_id",    :integer,                 :default => 0,  :null => false
    t.column "name",          :string,   :limit => 200, :default => "", :null => false
    t.column "contact_email", :string,   :limit => 200
    t.column "contact_name",  :string,   :limit => 200
    t.column "created_at",    :datetime
    t.column "updated_at",    :datetime
    t.column "css",           :text
    t.column "binary_id",     :integer
  end

  add_index "customers", ["company_id", "name"], :name => "customers_company_id_index"

  create_table "dependencies", :id => false, :force => true do |t|
    t.column "task_id",       :integer
    t.column "dependency_id", :integer
  end

  add_index "dependencies", ["task_id"], :name => "dependencies_task_id_index"
  add_index "dependencies", ["dependency_id"], :name => "dependencies_dependency_id_index"

  create_table "forums", :force => true do |t|
    t.column "company_id",       :integer
    t.column "project_id",       :integer
    t.column "name",             :string
    t.column "description",      :string
    t.column "topics_count",     :integer, :default => 0
    t.column "posts_count",      :integer, :default => 0
    t.column "position",         :integer
    t.column "description_html", :text
  end

  add_index "forums", ["company_id"], :name => "index_forums_on_company_id"

  create_table "generated_reports", :force => true do |t|
    t.column "company_id", :integer
    t.column "user_id",    :integer
    t.column "filename",   :string
    t.column "report",     :text
    t.column "created_at", :datetime
  end

  create_table "ical_entries", :force => true do |t|
    t.column "task_id",     :integer
    t.column "work_log_id", :integer
    t.column "body",        :text
  end

  add_index "ical_entries", ["task_id"], :name => "index_ical_entries_on_task_id"
  add_index "ical_entries", ["work_log_id"], :name => "index_ical_entries_on_work_log_id"

  create_table "logged_exceptions", :force => true do |t|
    t.column "exception_class", :string
    t.column "controller_name", :string
    t.column "action_name",     :string
    t.column "message",         :string
    t.column "backtrace",       :text
    t.column "environment",     :text
    t.column "request",         :text
    t.column "created_at",      :datetime
  end

  create_table "milestones", :force => true do |t|
    t.column "company_id",   :integer
    t.column "project_id",   :integer
    t.column "user_id",      :integer
    t.column "name",         :string
    t.column "description",  :text
    t.column "due_at",       :datetime
    t.column "position",     :integer
    t.column "completed_at", :datetime
  end

  add_index "milestones", ["company_id"], :name => "milestones_company_id_index"
  add_index "milestones", ["project_id"], :name => "milestones_project_id_index"

  create_table "moderatorships", :force => true do |t|
    t.column "forum_id", :integer
    t.column "user_id",  :integer
  end

  add_index "moderatorships", ["forum_id"], :name => "index_moderatorships_on_forum_id"

  create_table "monitorships", :force => true do |t|
    t.column "topic_id", :integer
    t.column "user_id",  :integer
    t.column "active",   :boolean, :default => true
  end

  create_table "news_items", :force => true do |t|
    t.column "created_at", :datetime
    t.column "body",       :text
  end

  create_table "notifications", :force => true do |t|
    t.column "task_id", :integer
    t.column "user_id", :integer
  end

  create_table "pages", :force => true do |t|
    t.column "name",       :string,   :limit => 200, :default => "", :null => false
    t.column "body",       :text
    t.column "company_id", :integer,                 :default => 0,  :null => false
    t.column "user_id",    :integer,                 :default => 0,  :null => false
    t.column "project_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "position",   :integer
  end

  add_index "pages", ["company_id"], :name => "pages_company_id_index"

  create_table "posts", :force => true do |t|
    t.column "user_id",    :integer
    t.column "topic_id",   :integer
    t.column "body",       :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "forum_id",   :integer
    t.column "body_html",  :text
  end

  add_index "posts", ["forum_id", "created_at"], :name => "index_posts_on_forum_id"
  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id"

  create_table "project_files", :force => true do |t|
    t.column "company_id",        :integer,                 :default => 0,                          :null => false
    t.column "project_id",        :integer,                 :default => 0,                          :null => false
    t.column "customer_id",       :integer,                 :default => 0,                          :null => false
    t.column "name",              :string,   :limit => 200, :default => "",                         :null => false
    t.column "binary_id",         :integer,                 :default => 0,                          :null => false
    t.column "file_type",         :integer,                 :default => 0,                          :null => false
    t.column "created_at",        :datetime,                                                        :null => false
    t.column "updated_at",        :datetime,                                                        :null => false
    t.column "filename",          :string,   :limit => 200, :default => "",                         :null => false
    t.column "thumbnail_id",      :integer
    t.column "file_size",         :integer
    t.column "task_id",           :integer
    t.column "mime_type",         :string,                  :default => "application/octet-stream"
    t.column "project_folder_id", :integer
  end

  add_index "project_files", ["company_id"], :name => "project_files_company_id_index"

  create_table "project_folders", :force => true do |t|
    t.column "name",       :string
    t.column "project_id", :integer
    t.column "parent_id",  :integer
    t.column "created_at", :datetime
    t.column "company_id", :integer
  end

  add_index "project_folders", ["project_id"], :name => "index_project_folders_on_project_id"

  create_table "project_permissions", :force => true do |t|
    t.column "company_id",     :integer
    t.column "project_id",     :integer
    t.column "user_id",        :integer
    t.column "created_at",     :datetime
    t.column "can_comment",    :boolean,  :default => false
    t.column "can_work",       :boolean,  :default => false
    t.column "can_report",     :boolean,  :default => false
    t.column "can_create",     :boolean,  :default => false
    t.column "can_edit",       :boolean,  :default => false
    t.column "can_reassign",   :boolean,  :default => false
    t.column "can_prioritize", :boolean,  :default => false
    t.column "can_close",      :boolean,  :default => false
    t.column "can_grant",      :boolean,  :default => false
    t.column "can_milestone",  :boolean,  :default => false
  end

  add_index "project_permissions", ["project_id"], :name => "project_permissions_project_id_index"
  add_index "project_permissions", ["user_id"], :name => "project_permissions_user_id_index"

  create_table "projects", :force => true do |t|
    t.column "name",         :string,   :limit => 200, :default => "", :null => false
    t.column "user_id",      :integer,                 :default => 0,  :null => false
    t.column "company_id",   :integer,                 :default => 0,  :null => false
    t.column "customer_id",  :integer,                 :default => 0,  :null => false
    t.column "created_at",   :datetime
    t.column "updated_at",   :datetime
    t.column "completed_at", :datetime
  end

  add_index "projects", ["company_id"], :name => "projects_company_id_index"
  add_index "projects", ["customer_id"], :name => "projects_customer_id_index"

  create_table "scm_changesets", :force => true do |t|
    t.column "company_id",     :integer
    t.column "project_id",     :integer
    t.column "user_id",        :integer
    t.column "scm_project_id", :integer
    t.column "author",         :string
    t.column "changeset_num",  :integer
    t.column "commit_date",    :datetime
    t.column "changeset_rev",  :string
    t.column "message",        :text
  end

  add_index "scm_changesets", ["commit_date"], :name => "scm_changesets_commit_date_index"
  add_index "scm_changesets", ["author"], :name => "scm_changesets_author_index"

  create_table "scm_files", :force => true do |t|
    t.column "project_id",  :integer
    t.column "company_id",  :integer
    t.column "name",        :text
    t.column "path",        :text
    t.column "state",       :string
    t.column "commit_date", :datetime
  end

  add_index "scm_files", ["project_id"], :name => "scm_files_project_id_index"

  create_table "scm_projects", :force => true do |t|
    t.column "project_id",       :integer
    t.column "company_id",       :integer
    t.column "scm_type",         :string
    t.column "last_commit_date", :datetime
    t.column "last_update",      :datetime
    t.column "last_checkout",    :datetime
    t.column "module",           :text
    t.column "location",         :text
  end

  create_table "scm_revisions", :force => true do |t|
    t.column "company_id",       :integer
    t.column "project_id",       :integer
    t.column "user_id",          :integer
    t.column "scm_changeset_id", :integer
    t.column "scm_file_id",      :integer
    t.column "revision",         :string
    t.column "author",           :string
    t.column "commit_date",      :datetime
    t.column "state",            :string
  end

  add_index "scm_revisions", ["scm_changeset_id"], :name => "scm_revisions_scm_changeset_id_index"
  add_index "scm_revisions", ["scm_file_id"], :name => "scm_revisions_scm_file_id_index"

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data",       :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "sessions_session_id_index"

  create_table "sheets", :force => true do |t|
    t.column "user_id",    :integer,  :default => 0, :null => false
    t.column "task_id",    :integer,  :default => 0, :null => false
    t.column "project_id", :integer,  :default => 0, :null => false
    t.column "created_at", :datetime
    t.column "body",       :text
  end

  create_table "shouts", :force => true do |t|
    t.column "company_id", :integer
    t.column "user_id",    :integer
    t.column "created_at", :datetime
    t.column "body",       :text
  end

  add_index "shouts", ["created_at"], :name => "shouts_created_at_index"
  add_index "shouts", ["company_id"], :name => "shouts_company_id_index"

  create_table "tags", :force => true do |t|
    t.column "company_id", :integer
    t.column "name",       :string
  end

  create_table "task_owners", :force => true do |t|
    t.column "user_id", :integer
    t.column "task_id", :integer
  end

  add_index "task_owners", ["user_id"], :name => "task_owners_user_id_index"
  add_index "task_owners", ["task_id"], :name => "task_owners_task_id_index"

  create_table "task_tags", :id => false, :force => true do |t|
    t.column "tag_id",  :integer
    t.column "task_id", :integer
  end

  add_index "task_tags", ["tag_id"], :name => "task_tags_tag_id_index"
  add_index "task_tags", ["task_id"], :name => "task_tags_task_id_index"

  create_table "tasks", :force => true do |t|
    t.column "name",          :string,   :limit => 200, :default => "", :null => false
    t.column "project_id",    :integer,                 :default => 0,  :null => false
    t.column "position",      :integer,                 :default => 0,  :null => false
    t.column "created_at",    :datetime,                                :null => false
    t.column "due_at",        :datetime
    t.column "updated_at",    :datetime,                                :null => false
    t.column "completed_at",  :datetime
    t.column "duration",      :integer,                 :default => 1
    t.column "hidden",        :integer,                 :default => 0
    t.column "milestone_id",  :integer
    t.column "description",   :text
    t.column "company_id",    :integer
    t.column "priority",      :integer,                 :default => 0
    t.column "updated_by_id", :integer
    t.column "severity_id",   :integer,                 :default => 0
    t.column "type_id",       :integer,                 :default => 0
    t.column "task_num",      :integer,                 :default => 0
    t.column "status",        :integer,                 :default => 0
    t.column "requested_by",  :string
    t.column "creator_id",    :integer
    t.column "notify_emails", :string
    t.column "repeat",        :string
    t.column "hide_until",    :datetime
  end

  add_index "tasks", ["project_id", "milestone_id"], :name => "tasks_project_id_index"
  add_index "tasks", ["company_id"], :name => "tasks_company_id_index"

  create_table "topics", :force => true do |t|
    t.column "forum_id",     :integer
    t.column "user_id",      :integer
    t.column "title",        :string
    t.column "created_at",   :datetime
    t.column "updated_at",   :datetime
    t.column "hits",         :integer,  :default => 0
    t.column "sticky",       :integer,  :default => 0
    t.column "posts_count",  :integer,  :default => 0
    t.column "replied_at",   :datetime
    t.column "locked",       :boolean,  :default => false
    t.column "replied_by",   :integer
    t.column "last_post_id", :integer
  end

  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"
  add_index "topics", ["forum_id", "sticky", "replied_at"], :name => "index_topics_on_sticky_and_replied_at"
  add_index "topics", ["forum_id", "replied_at"], :name => "index_topics_on_forum_id_and_replied_at"

  create_table "users", :force => true do |t|
    t.column "name",                   :string,   :limit => 200, :default => "",      :null => false
    t.column "username",               :string,   :limit => 200, :default => "",      :null => false
    t.column "password",               :string,   :limit => 200, :default => "",      :null => false
    t.column "company_id",             :integer,                 :default => 0,       :null => false
    t.column "created_at",             :datetime
    t.column "updated_at",             :datetime
    t.column "email",                  :string,   :limit => 200
    t.column "last_login_at",          :datetime
    t.column "admin",                  :integer,                 :default => 0
    t.column "time_zone",              :string
    t.column "option_tracktime",       :integer
    t.column "option_externalclients", :integer
    t.column "option_showcalendar",    :integer
    t.column "option_tooltips",        :integer
    t.column "seen_news_id",           :integer,                 :default => 0
    t.column "last_project_id",        :integer
    t.column "last_seen_at",           :datetime
    t.column "last_ping_at",           :datetime
    t.column "last_milestone_id",      :integer
    t.column "last_filter",            :integer
    t.column "date_format",            :string
    t.column "time_format",            :string
    t.column "send_notifications",     :integer,                 :default => 1
    t.column "receive_notifications",  :integer,                 :default => 1
    t.column "uuid",                   :string
    t.column "seen_welcome",           :integer,                 :default => 0
    t.column "locale",                 :string,                  :default => "en_US"
    t.column "duration_format",        :integer,                 :default => 0
    t.column "workday_duration",       :integer,                 :default => 480
    t.column "posts_count",            :integer,                 :default => 0
    t.column "newsletter",             :integer,                 :default => 1
    t.column "option_avatars",         :integer,                 :default => 1
  end

  add_index "users", ["uuid"], :name => "users_uuid_index"
  add_index "users", ["username"], :name => "users_username_index"
  add_index "users", ["company_id"], :name => "users_company_id_index"
  add_index "users", ["last_seen_at"], :name => "index_users_on_last_seen_at"

  create_table "views", :force => true do |t|
    t.column "name",                :string
    t.column "company_id",          :integer
    t.column "user_id",             :integer
    t.column "shared",              :integer, :default => 0
    t.column "auto_group",          :integer, :default => 0
    t.column "filter_customer_id",  :integer, :default => 0
    t.column "filter_project_id",   :integer, :default => 0
    t.column "filter_milestone_id", :integer, :default => 0
    t.column "filter_user_id",      :integer, :default => 0
    t.column "filter_tags",         :string,  :default => ""
    t.column "filter_status",       :integer, :default => 0
    t.column "filter_type_id",      :integer, :default => 0
    t.column "hide_dependencies",   :integer
    t.column "sort",                :integer, :default => 0
  end

  add_index "views", ["company_id"], :name => "views_company_id_index"

  create_table "wiki_pages", :force => true do |t|
    t.column "company_id", :integer
    t.column "project_id", :integer
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "name",       :string
    t.column "locked_at",  :datetime
    t.column "locked_by",  :integer
  end

  add_index "wiki_pages", ["company_id"], :name => "wiki_pages_company_id_index"

  create_table "wiki_references", :force => true do |t|
    t.column "wiki_page_id",    :integer
    t.column "referenced_name", :string
    t.column "created_at",      :datetime
    t.column "updated_at",      :datetime
  end

  create_table "wiki_revisions", :force => true do |t|
    t.column "wiki_page_id", :integer
    t.column "created_at",   :datetime
    t.column "updated_at",   :datetime
    t.column "body",         :text
    t.column "user_id",      :integer
  end

  add_index "wiki_revisions", ["wiki_page_id"], :name => "wiki_revisions_wiki_page_id_index"

  create_table "work_logs", :force => true do |t|
    t.column "user_id",          :integer,  :default => 0, :null => false
    t.column "task_id",          :integer
    t.column "project_id",       :integer,  :default => 0, :null => false
    t.column "company_id",       :integer,  :default => 0, :null => false
    t.column "customer_id",      :integer,  :default => 0, :null => false
    t.column "started_at",       :datetime,                :null => false
    t.column "duration",         :integer,  :default => 0, :null => false
    t.column "body",             :text
    t.column "log_type",         :integer,  :default => 0
    t.column "scm_changeset_id", :integer
  end

  add_index "work_logs", ["user_id"], :name => "work_logs_user_id"
  add_index "work_logs", ["user_id", "task_id"], :name => "work_logs_user_id_index"
  add_index "work_logs", ["task_id", "log_type"], :name => "work_logs_task_id_index"
  add_index "work_logs", ["company_id"], :name => "work_logs_company_id_index"
  add_index "work_logs", ["project_id"], :name => "work_logs_project_id_index"
  add_index "work_logs", ["customer_id"], :name => "work_logs_customer_id_index"

end
