class JobApplication::EventMapping < ApplicationRecord
  belongs_to :job_application
  belongs_to :job_application_event, class_name: "JobApplication::Event"
end
