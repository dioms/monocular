class Customer < ActiveRecord::Base
  belongs_to :user
  serialize :custom_data, JSON

  def has_fields(fields)
    fields.all? { |e| self.custom_data.keys.include?(e) }
  end
end
