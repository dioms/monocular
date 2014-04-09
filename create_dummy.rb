#randomize created_at 
r = Random.new
100.times do |x|
  c = Customer.new
  c.email = Faker::Internet.email
  c.user_id = 1
  users = r.rand(0..50)

  if users < 17
    courses_created = r.rand(0..33)
  elsif users > 17 && users <= 34
    courses_created = r.rand(34..66)
  else
    courses_created = r.rand(67..100)
  end

  courses_started = r.rand(0..(users * courses_created))

  c.custom_data = { total_users: users,
    courses_created: courses_created,
    courses_started: courses_started,
    courses_completed: r.rand(0..courses_started),
  }

  c.save
  rand_date = rand(1.year.ago..Time.now)
  c.created_at = rand_date

  random = r.rand(1..5)
  if random < 3
    c.has_paid = rand(rand_date..Time.now)
  end
  c.save!
end 
