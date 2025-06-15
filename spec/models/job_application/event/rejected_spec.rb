require 'rails_helper'

RSpec.describe JobApplication::Event::Rejected, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:job_application) { create(:job_application) }

      it "creates a job_application event successfully" do
        expect { described_class.create(job_application: job_application) }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)
      end
    end

    context "when another event for job application exists" do
      let(:job_application) { create(:job_application) }
      let!(:other_job_application_event) { create(:job_application_event_note, job_application: job_application) }

      it "creates a job_application event successfully" do
        expect { described_class.create(job_application: job_application) }.to \
          change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)

        last_event_mapping = JobApplication::EventMapping.last
        expect(last_event_mapping.job_application_id).to eq(job_application.id)
        expect(last_event_mapping.job_application_event_id).to eq(last_record.id)
      end

      it "updates the existing job_application event mapping" do
        expect { described_class.create(job_application: job_application) }.to \
          change { JobApplication::EventMapping.last.job_application_event_id }.from(other_job_application_event.id)
      end

      it "does not create a new job_application event mapping" do
        expect { described_class.create(job_application: job_application) }.not_to \
          change { JobApplication::EventMapping.count }.from(1)
      end
    end

    context "with invalid attributes" do
      context "when job_application is missing" do
        it "does not create a job_application event" do
          expect { described_class.create }.not_to change { described_class.count }
        end
      end
    end
  end
end
