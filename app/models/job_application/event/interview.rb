class JobApplication::Event::Interview < JobApplication::Event
  store_accessor :data, :interview_date

  validates :interview_date, presence: true
end
