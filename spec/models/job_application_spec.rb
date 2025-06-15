require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:job) { create(:job) }
      let(:candidate_name) { "Jane Doe" }

      it "creates a job application successfully" do
        expect { described_class.create(job: job, candidate_name: candidate_name) }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record).to be_present
        expect(last_record.candidate_name).to eq(candidate_name)
      end
    end

    context "with invalid attributes" do
      context "when job is missing" do
        let(:candidate_name) { "John Doe" }

        it "does not create a job application" do
          expect { described_class.create(candidate_name: candidate_name) }.not_to change { described_class.count }
        end
      end

      context "when candidate_name is missing" do
        let(:job) { create(:job) }

        it "does not create a job application" do
          expect { described_class.create(job: job, candidate_name: nil) }.not_to change { described_class.count }
        end
      end
    end
  end
end
