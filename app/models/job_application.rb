class JobApplication < ApplicationRecord
  belongs_to :job
  has_many :events, class_name: "JobApplication::Event", dependent: :destroy

  validates :candidate_name, presence: true
end
