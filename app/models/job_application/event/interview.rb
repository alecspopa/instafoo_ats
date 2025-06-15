class JobApplication::Event::Interview < JobApplication::Event
  store_accessor :data, :interview_date

  validates :interview_date, presence: true
  validate :interview_date_is_a_date

  private

  def interview_date_is_a_date
    return if interview_date.is_a?(Date)

    errors.add(:interview_date, "must be a valid date")
  end
end
