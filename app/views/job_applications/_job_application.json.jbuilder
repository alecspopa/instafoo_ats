json.extract! job_application, :id, :candidate_name, :status, :interview_date
json.notes_count job_application.notes.count

json.job do
  json.id job_application.job.id
  json.title job_application.job.title
end
