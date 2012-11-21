# encoding: UTF-8 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all
1.upto(20).each do |n|
  I18n.locale = :ca
  p=Project.create!(code: "#{"%03d" % n}XXX", name: "Projecte d'exemple número #{n}", description: "Description for sample project #{n}")
  I18n.locale = :en
  p.name = "Sample project #{n}"
  p.save
end

Participant.delete_all
["BCN, SLP", "Estudi PSP Arquitectura", "Juan Azulay"].each do |n|
  Participant.create!(name: n)
end
