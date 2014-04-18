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
    self.date_comparison ? @customers.select { |c| (self.start..self.end).cover?(c.send(self.date_comparison)) } : @customers
  end

  def get_all_but_existing
    CustomerSet.all.reject { |c| c.id == id }
  end

  def get_active(user)
    self.get_customers(user).select { |c| c.is_active? }  
  end

  def get_overlap(cust_set, user)
    self.get_customers(user) & cust_set.get_customers(user)
  end

end
