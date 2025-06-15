require 'rails_helper'

RSpec.describe JobApplication::Event::Note, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:content) { "candidate note" }

      it "creates a job_application event successfully" do
        expect { described_class.create(content: content) }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)
        expect(last_record.content).to eq(content)
      end
    end

    context "with invalid attributes" do
      context "when content is missing" do
        it "does not create a job_application event" do
          expect { described_class.create }.not_to change { described_class.count }
        end
      end
    end
  end
end
