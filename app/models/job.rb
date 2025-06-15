class Job < ApplicationRecord
  has_many :job_applications, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
