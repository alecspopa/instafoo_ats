json.extract! job, :id, :title, :status
json.hired_candidates_count job.hired_candidates.count
json.rejected_candidates_count job.rejected_candidates.count
json.ongoing_candidates_count job.ongoing_candidates.count
