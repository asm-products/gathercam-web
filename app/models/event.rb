class Event < ActiveRecord::Base
  belongs_to :user
  has_many :medias

  def to_param
    slug
  end
end
