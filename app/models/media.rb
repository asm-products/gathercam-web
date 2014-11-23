class Media < ActiveRecord::Base
  belongs_to :event

  validates :event_id, :media_url, presence: true
end
