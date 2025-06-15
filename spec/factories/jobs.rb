FactoryBot.define do
  factory :job do
    title { "Developer" }
    description { "Great developer job" }

    trait :activated do
      after(:create) do |job|
        create(:job_event_activated, job: job)
      end
    end

    trait :deactivated do
      after(:create) do |job|
        create(:job_event_deactivated, job: job)
      end
    end
  end
end
