# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个种子档会自动建立一个admin账号，里面有预设的工作岗位"

create_account = User.create([email: '123456@gmail.com', password: '123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

create_jos = for i in 1..5 do
  Job.create!([title: "前端工程师#{i}", description: " #{i} 个Public工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "false"])
end
puts "5 Public jobs created."

create_jos = for i in 1..5 do
  Job.create!([title: "后端工程师#{i+5}", description: " #{i+5} 个Hidden工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,is_hidden: "true"])
end
puts "5 Hidden jobs created."

create_jos = for i in 1..5 do
  Job.create!([title: "后端工程师#{i+10}", description: " #{i+10} 个全栈工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100,is_hidden: "true"])
end
puts "5 FullStack jobs created."
