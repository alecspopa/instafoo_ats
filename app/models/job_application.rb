class JobApplication < ApplicationRecord
  belongs_to :job
  has_one :status, class_name: "JobApplication::EventMapping", dependent: :destroy
  has_many :events, class_name: "JobApplication::Event", dependent: :destroy

  validates :candidate_name, presence: true

  def interview_date
    return nil if status.type != "JobApplication::Event::Interview"

    status.interview_date
  end

  def notes
    events.filter { _1.type == "JobApplication::Event::Note" }
  end
end
