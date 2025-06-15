FactoryBot.define do
  factory :job_application do
    job
    candidate_name { "John Doe" }
  end
end
