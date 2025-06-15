class AddJobIdToJobApplication < ActiveRecord::Migration[8.0]
  def change
    add_reference :job_applications, :job, null: false, foreign_key: true
  end
end
