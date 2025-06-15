class JobApplication::Event::Interview < ApplicationRecord
  store_accessor :data, :interview_date

  validates :interview_date, presence: true
end
