require 'db_import'

namespace :aib do
  desc "insert data form legacy db"
  task :insert_data => :environment do
    Project.delete_all
    AiB::DBImport.new.insert_data!
  end
end
