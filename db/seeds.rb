# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

job_software_engineer = Job.create(title: "Software Engineer", description: "Develop and maintain software applications.")
job_sales = Job.create(title: "Sales", description: "Manage sales and customer relationships.")

Job::Event::Activated.create(job: job_software_engineer)
Job::Event::Activated.create(job: job_sales)
Job::Event::Deactivated.create(job: job_sales)

job_application_1 = JobApplication.create(candidate_name: "John Doe", job: job_software_engineer)
job_application_2 = JobApplication.create(candidate_name: "Jane Smith", job: job_software_engineer)
_job_application_3 = JobApplication.create(candidate_name: "Alice Johnson", job: job_sales)

JobApplication::Event::Interview.create(job_application: job_application_1, interview_date: Date.current + 1.week)
JobApplication::Event::Interview.create(job_application: job_application_2, interview_date: Date.current - 1.week)
JobApplication::Event::Note.create(job_application: job_application_2, content: "Candidate has strong technical skills.")
JobApplication::Event::Hired.create(job_application: job_application_2, hire_date: Date.current)
