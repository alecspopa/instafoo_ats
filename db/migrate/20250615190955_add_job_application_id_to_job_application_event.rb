class AddJobApplicationIdToJobApplicationEvent < ActiveRecord::Migration[8.0]
  def change
    add_reference :job_application_events, :job_application, null: false, foreign_key: true
  end
end
