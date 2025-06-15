class Job < ApplicationRecord
  has_one :current_event, class_name: "Job::EventMapping", dependent: :destroy
  has_many :job_events, class_name: "Job::Event", dependent: :destroy
  has_many :job_applications, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  def status
    return "activated" if current_event&.type == "Job::Event::Activated"

    "deactivated"
  end
end
