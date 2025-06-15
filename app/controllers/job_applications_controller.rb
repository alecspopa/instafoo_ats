class JobApplicationsController < ApplicationController
  # GET /job_applications
  def index
    @job_applications = JobApplication
      .includes(:current_event, :job_application_events, job: [ current_event: :job_event ])
      .where.not(job: { current_event: { job_events: { type: "Job::Event::Deactivated" } } })
  end
end
