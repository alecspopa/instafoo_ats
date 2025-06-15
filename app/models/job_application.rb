class JobApplication < ApplicationRecord
  validates :candidate_name, presence: true
end
