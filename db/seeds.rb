# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个seeds文件可以自动建立一个admin账号，并且创建10个public jobs,以及10各hidden jobs"

create_account = User.create([email: 'example@gmail.com', password:'123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

create_job = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个公开的工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "false"])
end
create_job = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个隐藏的工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "true"])
end

puts "10 Hidden jobs created."
