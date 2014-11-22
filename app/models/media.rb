class Media < ActiveRecord::Base
  validates :event_id, :social_id, :media_url, presence: true
end
