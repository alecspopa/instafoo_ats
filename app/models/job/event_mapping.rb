class Job::EventMapping < ApplicationRecord
  belongs_to :job
  belongs_to :job_event, class_name: "Job::Event"
end
