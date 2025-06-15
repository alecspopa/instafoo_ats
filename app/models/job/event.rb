class Job::Event < ApplicationRecord
  # Prevent creation of base class Job::Event
  def initialize
    raise "Job::Event cannot be initialized" if self.class == Job::Event
  end
end
