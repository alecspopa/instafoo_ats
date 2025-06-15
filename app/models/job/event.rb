class Job::Event < ApplicationRecord
  validates :type, presence: true
end
