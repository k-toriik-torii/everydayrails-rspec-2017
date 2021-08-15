FactoryBot.define do
  factory :note do
    message "My important note."
    association :project
    user { project.owner }
  end

  # trait :with_attachment do
  #   attachment { File.new("#{Rails.root}/spec/files/attachment.jpg") }
  # end
end
