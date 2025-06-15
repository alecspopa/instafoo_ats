class JobApplication::Event < ApplicationRecord
  # Prevent creation of base class JobApplication::Event
  def initialize
    raise "JobApplication::Event cannot be initialized" if self.class == JobApplication::Event
  end
end
