class JobsController < ApplicationController
  # GET /jobs.json
  def index
    @jobs = Job
      .includes(current_event: :job_event)
      .includes(job_applications: [ current_event: :job_application_event ])
  end
end
