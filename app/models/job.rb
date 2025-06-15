class Job < ApplicationRecord
  has_one :current_event, class_name: "Job::EventMapping", dependent: :destroy
  has_many :job_events, class_name: "Job::Event", dependent: :destroy
  has_many :job_applications, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  def status
    return "activated" if current_event&.job_event&.type == "Job::Event::Activated"

    "deactivated"
  end

  def hired_candidates
    job_applications.filter { _1.status == "hired" }
  end

  def rejected_candidates
    job_applications.filter { _1.status == "rejected" }
  end

  def ongoing_candidates
    job_applications.filter { _1.status == "interview" || _1.status == "applied" }
  end
end
