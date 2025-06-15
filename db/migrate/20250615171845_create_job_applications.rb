class CreateJobApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applications do |t|
      t.string :candidate_name

      t.timestamps
    end
  end
end
