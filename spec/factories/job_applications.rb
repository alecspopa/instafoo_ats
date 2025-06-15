FactoryBot.define do
  factory :job_application do
    job
    candidate_name { "John Doe" }

    trait :hired do
      after(:create) do |job_application|
        create(:job_application_event_hired, job_application: job_application)
      end
    end

    trait :interview do
      after(:create) do |job_application|
        create(:job_application_event_interview, job_application: job_application)
      end
    end

    trait :note do
      after(:create) do |job_application|
        create(:job_application_event_note, job_application: job_application)
      end
    end

    trait :rejected do
      after(:create) do |job_application|
        create(:job_application_event_rejected, job_application: job_application)
      end
    end
  end
end
