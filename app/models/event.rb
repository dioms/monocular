class Event < ActiveRecord::Base
  belongs_to :user
  CATEGORIES = %w{ view click reload }
end
