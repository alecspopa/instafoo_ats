class CreateJobEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :job_events do |t|
      t.string :type

      t.timestamps
    end
  end
end
