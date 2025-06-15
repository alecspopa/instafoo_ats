require 'rails_helper'

RSpec.describe JobApplication::Event::Interview, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:interview_date) { Date.current }

      it "creates a job_application event successfully" do
        expect { described_class.create(interview_date: interview_date) }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)
      end
    end

    context "with invalid attributes" do
      context "when interview_date is missing" do
        it "does not create a job_application event" do
          expect { described_class.create }.not_to change { described_class.count }
        end
      end

      context "when interview_date is not a date" do
        let(:interview_date) { "not-a-date" }

        it "does not create a job_application event" do
          expect { described_class.create(interview_date: interview_date) }.not_to change { described_class.count }
        end
      end
    end
  end
end
