class Customer < ActiveRecord::Base
  belongs_to :user
  serialize :custom_data, JSON

  def has_fields(fields)
    fields.all? { |e| self.custom_data.keys.include?(e) }
  end

  def is_active?
      created_at > 30.days.ago || has_paid
  end

  def ever_paid?
    has_paid
  end

  def has_paid?
    if has_paid
      has_paid > 30.days.ago
    else
      false
    end
  end


  def split_in_months
    self.sort_by { |c| c.created_at }.inject(Hash.new(0)) { |k,v| k[v.created_at.strftime("%b, %Y")] += 1; k }
  end

end
