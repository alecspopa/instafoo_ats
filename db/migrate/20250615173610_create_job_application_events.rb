class CreateJobApplicationEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :job_application_events do |t|
      t.string :type
      t.jsonb :data, default: {}

      t.timestamps
    end
  end
end
