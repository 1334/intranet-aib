# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all
(1..20).each do |n|
  Project.create!(code: "#{"%03d" % n}XXX", name: "Sample project #{n}", description: "Description for sample project #{n}")
end
