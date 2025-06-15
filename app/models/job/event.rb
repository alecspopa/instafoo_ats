class Job::Event < ApplicationRecord
  belongs_to :job, inverse_of: :job_events
  has_one :job_event_mapping, class_name: "Job::EventMapping", foreign_key: "job_event_id"

  validates :type, presence: true

  # I use a before_commit callback here because I want to update the mapping in the same transaction.
  # This does not guarantee that the mapping will be created / updated because the before_commit can be skipped.
  # A more reliable solution would be to use DB triggers as long as the trigger logic is very simple,
  #   because we also don't want to split the application logic in between Rails and the database.
  # I have worked with https://github.com/jenseng/hair_trigger in the past and in production I would recommend using this,
  #   however for the purpose of this exercise I will keep it simple and use a before_commit callback.
  before_commit :upsert_mapping

  private

  def upsert_mapping
    Job::EventMapping
      .upsert(
        {
          job_id: job.id,
          job_event_id: self.id
        }, unique_by: :job_id
      )
  end
end
