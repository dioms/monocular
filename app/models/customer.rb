class Customer < ActiveRecord::Base
  belongs_to :user
  serialize :custom_data, JSON
end
