require 'rails_helper'

RSpec.describe Job::Event::Activated, type: :model do
  describe "creation" do
    context "with valid attributes" do
      it "creates a job event successfully" do
        expect { described_class.create }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)
      end
    end
  end
end
