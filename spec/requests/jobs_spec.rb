require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /index" do
    let!(:job_activated_no_applications) { create(:job, :activated) }
    let!(:job_deactivated_no_applications) { create(:job, :deactivated) }

    let!(:job_activated_with_applications) { create(:job, :activated) }
    let!(:job_application_hired) { create(:job_application, :hired, job: job_activated_with_applications, candidate_name: "Bob Dylan") }
    let!(:job_application_interview) { create(:job_application, :interview, job: job_activated_with_applications, candidate_name: "Elvis Presley") }
    let!(:job_application_event_note) { create(:job_application_event_note, job_application: job_application_interview) }

    let!(:job_deactivated_with_applications) { create(:job, :deactivated) }
    let!(:job_application_note) { create(:job_application, :note, job: job_deactivated_with_applications, candidate_name: "James Brown") }
    let!(:job_application_rejected) { create(:job_application, :rejected, job: job_deactivated_with_applications, candidate_name: "Marvin Gaye") }

     it "returns http success" do
      get jobs_url, as: :json

      expect(response).to be_successful
      response_json = JSON.parse(response.body, symbolize_names: true)
      expect(response_json).to include(
        {
          id: job_activated_no_applications.id,
          title: job_activated_no_applications.title,
          status: "activated",
          hired_candidates_count: 0,
          rejected_candidates_count: 0,
          ongoing_candidates_count: 0
        },
        {
          id: job_deactivated_no_applications.id,
          title: job_deactivated_no_applications.title,
          status: "deactivated",
          hired_candidates_count: 0,
          rejected_candidates_count: 0,
          ongoing_candidates_count: 0
        },
        {
          id: job_activated_with_applications.id,
          title: job_activated_with_applications.title,
          status: "activated",
          hired_candidates_count: 1,
          rejected_candidates_count: 0,
          ongoing_candidates_count: 1
        },
        {
          id: job_deactivated_with_applications.id,
          title: job_deactivated_with_applications.title,
          status: "deactivated",
          hired_candidates_count: 0,
          rejected_candidates_count: 1,
          ongoing_candidates_count: 1
        }
      )
    end
  end
end
