FactoryBot.define do
  factory :job_application_event_hired, class: JobApplication::Event::Hired do
    job_application
    hire_date { Date.today }
  end

  factory :job_application_event_interview, class: JobApplication::Event::Interview do
    job_application
    interview_date { Date.today }
  end

  factory :job_application_event_note, class: JobApplication::Event::Note do
    job_application
    content { "Candidate note" }
  end

  factory :job_application_event_rejected, class: JobApplication::Event::Rejected do
    job_application
  end
end
