class CustomQuery < ActiveRecord::Base
  belongs_to :customer_set

  def query 
    "#{field} #{comparison} ?" 
  end
end
