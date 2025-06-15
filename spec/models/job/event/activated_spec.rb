require 'rails_helper'

RSpec.describe Job::Event::Activated, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:job) { create(:job) }

      it "creates a job event successfully" do
        expect { described_class.create(job: job) }.to change { described_class.count }.by(1).and \
          change { Job::EventMapping.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)

        last_event_mapping = Job::EventMapping.last
        expect(last_event_mapping.job_id).to eq(job.id)
        expect(last_event_mapping.job_event_id).to eq(last_record.id)
      end
    end

    context "when another event for job exists" do
      let(:job) { create(:job) }
      let!(:other_job_event) { create(:job_event_deactivated, job: job) }

      it "creates a job event successfully" do
        expect { described_class.create(job: job) }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)

        last_event_mapping = Job::EventMapping.last
        expect(last_event_mapping.job_id).to eq(job.id)
        expect(last_event_mapping.job_event_id).to eq(last_record.id)
      end

      it "updates the existing job event mapping" do
        expect { described_class.create(job: job) }.to change { Job::EventMapping.last.job_event_id }.from(other_job_event.id)
      end

      it "does not create a new job event mapping" do
        expect { described_class.create(job: job) }.not_to change { Job::EventMapping.count }.from(1)
      end
    end

    context "with invalid attributes" do
      context "when job is missing" do
        it "does not create a job event" do
          expect { described_class.create }.not_to change { described_class.count }
        end
      end
    end
  end
end
