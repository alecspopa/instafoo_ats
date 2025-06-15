class JobApplication < ApplicationRecord
  belongs_to :job
  has_one :current_event, class_name: "JobApplication::EventMapping", dependent: :destroy
  has_many :job_application_events, class_name: "JobApplication::Event", dependent: :destroy

  validates :candidate_name, presence: true

  def status
    return "hired" if current_event&.job_application_event&.type == "JobApplication::Event::Hired"
    return "interview" if current_event&.job_application_event&.type == "JobApplication::Event::Interview"
    return "rejected" if current_event&.job_application_event&.type == "JobApplication::Event::Rejected"

    # Note event does not affect the status.
    # If we have 0 or a few Note events the status is still "applied".
    "applied"
  end

  def interview_date
    return unless current_event&.job_application_event&.type == "JobApplication::Event::Interview"

    current_event&.job_application_event&.interview_date
  end

  def notes
    job_application_events.filter { _1.type == "JobApplication::Event::Note" }
  end
end
