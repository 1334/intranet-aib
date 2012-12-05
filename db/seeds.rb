# encoding: UTF-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require_relative '../lib/db_import'

# AiB::DBImport.new.insert_data!

[:housing, :facilities, :urbanism, :landscape].each do |category|
  Category.create(name: category)
end
