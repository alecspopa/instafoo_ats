FactoryBot.define do
  factory :job_application_event_hired, class: JobApplication::Event::Hired do
    hire_date { Date.today }
  end

  factory :job_application_event_interview, class: JobApplication::Event::Interview do
    interview_date { Date.today }
  end

  factory :job_application_event_note, class: JobApplication::Event::Note do
    content { "Candidate note" }
  end

  factory :job_application_event_rejected, class: JobApplication::Event::Rejected do
  end
end
