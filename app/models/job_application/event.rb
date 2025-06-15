class JobApplication::Event < ApplicationRecord
  validates :type, presence: true
end
