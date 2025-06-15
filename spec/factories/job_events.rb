FactoryBot.define do
  factory :job_event_activated, class: Job::Event::Activated do
    job
  end

  factory :job_event_deactivated, class: Job::Event::Deactivated do
    job
  end
end
