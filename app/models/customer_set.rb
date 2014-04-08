class CustomerSet < ActiveRecord::Base
  belongs_to :user
  has_many :custom_queries

  accepts_nested_attributes_for :custom_queries


  def get_customers(user)
    fields = self.custom_queries.map { |c| c.field } 
    @customers = user.customers.select { |c| c.has_fields(fields) }
    self.custom_queries.each do |c_q|
      if c_q.comparison == ">"
        @customers = @customers.select { |c| c.custom_data[c_q.field].to_i > c_q.value.to_i }
      else
        @customers = @customers.select { |c| c.custom_data[c_q.field].to_i < c_q.value.to_i }
      end
    end
    @customers
  end
end
