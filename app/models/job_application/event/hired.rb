class JobApplication::Event::Hired < ApplicationRecord
  store_accessor :data, :hire_date

  validates :hire_date, presence: true
end
