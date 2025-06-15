class AddJobIdToJobEvent < ActiveRecord::Migration[8.0]
  def change
    add_reference :job_events, :job, null: false, foreign_key: true
  end
end
