require 'rails_helper'

RSpec.describe JobApplication::Event::Hired, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:job_application) { create(:job_application) }
      let(:hire_date) { Date.current }

      it "creates a job_application event successfully" do
        expect { described_class.create(job_application: job_application, hire_date: hire_date) }.to \
          change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)
        expect(last_record.hire_date).to eq(hire_date.to_s)
      end
    end

    context "when another event for job application exists" do
      let(:job_application) { create(:job_application) }
      let(:hire_date) { Date.current }
      let!(:other_job_application_event) { create(:job_application_event_interview, job_application: job_application) }

      it "creates a job_application event successfully" do
        expect { described_class.create(job_application: job_application, hire_date: hire_date) }.to \
          change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record.type).to eq(described_class.name)
        expect(last_record.hire_date).to eq(hire_date.to_s)

        last_event_mapping = JobApplication::EventMapping.last
        expect(last_event_mapping.job_application_id).to eq(job_application.id)
        expect(last_event_mapping.job_application_event_id).to eq(last_record.id)
      end

      it "updates the existing job_application event mapping" do
        expect { described_class.create(job_application: job_application, hire_date: hire_date) }.to \
          change { JobApplication::EventMapping.last.job_application_event_id }.from(other_job_application_event.id)
      end

      it "does not create a new job_application event mapping" do
        expect { described_class.create(job_application: job_application, hire_date: hire_date) }.not_to \
          change { JobApplication::EventMapping.count }.from(1)
      end
    end

    context "with invalid attributes" do
      context "when job_application is missing" do
        let(:hire_date) { Date.current }

        it "does not create a job_application event" do
          expect { described_class.create(hire_date: hire_date) }.not_to change { described_class.count }
        end
      end

      context "when hire_date is missing" do
        let(:job_application) { create(:job_application) }

        it "does not create a job_application event" do
          expect { described_class.create(job_application: job_application) }.not_to change { described_class.count }
        end
      end

      context "when hire_date is not a date" do
        let(:job_application) { create(:job_application) }
        let(:hire_date) { "not-a-date" }

        it "does not create a job_application event" do
          expect { described_class.create(job_application: job_application, hire_date: hire_date) }.not_to change { described_class.count }
        end
      end
    end
  end
end
