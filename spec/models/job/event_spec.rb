require 'rails_helper'

RSpec.describe Job::Event, type: :model do
  describe "creation" do
    it "cannot be instantiated directly" do
      expect { described_class.create }.not_to change { described_class.count }
    end
  end
end
