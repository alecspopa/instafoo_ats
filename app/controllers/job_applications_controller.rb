class JobApplicationsController < ApplicationController
  # GET /job_applications.json
  def index
    @job_applications = JobApplication
      .includes(:job_application_events)
      .includes(current_event: :job_application_event)
      .includes(job: [ current_event: :job_event ])
      .where.not(job: { current_event: { job_events: { type: "Job::Event::Deactivated" } } })
  end
end
