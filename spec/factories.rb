FactoryGirl.define do
  factory :project do
    sequence(:code) { |n| "%03dXXX" % n }
    sequence(:name) { |n| "Project #{n}" }
  end
end
