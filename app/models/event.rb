class Event < ActiveRecord::Base
  belongs_to :user

  def to_param
    slug
  end
end
