# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    # sequence(:code) { |n| "#{sprintf("%3d", n)}XXX" }
    sequence(:code) { |n| "00#{n}XXX" }
    name "Project Name"
  end
end
