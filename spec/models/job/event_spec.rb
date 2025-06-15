require 'rails_helper'

RSpec.describe Job::Event, type: :model do
  describe "creation" do
    let(:job) { create(:job) }

    it "cannot be instantiated directly" do
      expect { described_class.create(job: job) }.not_to change { described_class.count }
    end
  end
end
