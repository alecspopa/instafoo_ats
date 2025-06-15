class JobApplication::Event::Hired < JobApplication::Event
  store_accessor :data, :hire_date

  validates :hire_date, presence: true
  validate :hire_date_is_a_date

  private

  def hire_date_is_a_date
    return if hire_date.is_a?(Date)

    errors.add(:hire_date, "must be a valid date")
  end
end
