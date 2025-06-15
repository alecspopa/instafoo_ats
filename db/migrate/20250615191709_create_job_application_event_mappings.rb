class CreateJobApplicationEventMappings < ActiveRecord::Migration[8.0]
  def change
    create_table :job_application_event_mappings do |t|
      t.references :job_application, null: false, foreign_key: true, index: { unique: true }
      t.references :job_application_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
