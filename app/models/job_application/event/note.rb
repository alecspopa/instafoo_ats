class JobApplication::Event::Note < ApplicationRecord
  store_accessor :data, :content

  validates :content, presence: true
end
