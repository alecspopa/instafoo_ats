require 'rails_helper'

RSpec.describe "JobApplications", type: :request do
  describe "GET /index" do
    let!(:job_activated_no_applications) { create(:job, :activated) }
    let!(:job_deactivated_no_applications) { create(:job, :deactivated) }

    let!(:job_activated_with_applications) { create(:job, :activated) }
    let!(:job_application_hired) { create(:job_application, :hired, job: job_activated_with_applications) }
    let!(:job_application_note) { create(:job_application, :interview, job: job_activated_with_applications) }

    let!(:job_deactivated_with_applications) { create(:job, :deactivated) }
    let!(:job_application_interview) { create(:job_application, :note, job: job_deactivated_with_applications) }
    let!(:job_application_rejected) { create(:job_application, :rejected, job: job_deactivated_with_applications) }

    it "returns http success" do
      get job_application_index_url

      expect(response).to be_successful
      response_json = JSON.parse(response.body, symbolize_names: true)
      expect(response_json).to eq(
        [
          {
            id: job_application_hired.id,
            candidate_name: job_application_hired.candidate_name,
            status: job_application_hired.status,
            notes: job_application_hired.notes,
            interview_date: job_application_hired.interview_date,
            job: {
              id: job_application_hired.job.id,
              title: job_application_hired.job.title,
            }
          },
          {
            id: job_application_interview.id,
            candidate_name: job_application_interview.candidate_name,
            status: job_application_interview.status,
            notes: job_application_interview.notes,
            interview_date: job_application_interview.interview_date,
            job: {
              id: job_application_interview.job.id,
              title: job_application_interview.job.title,
            }
          }
        ]
      )
    end
  end
end
