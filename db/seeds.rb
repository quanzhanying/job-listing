# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ :name => 'Star Wars' }, { :name => 'Lord of the Rings' }])
#   Character.create{ :name => 'Luke', movie: movies.first)

puts "这个seeds文件可以自动建立一个admin账号，并且创建10个public jobs,以及10各hidden jobs"

create_account = User.create([email: 'd280775064@126.com', password:'123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

categories = Category.create([
{ :name => '财务|人力资源|行政'},
{ :name => '互联网|IT|通信'},
{ :name => '房产|建筑|物业管理'},
{ :name => '金融'},
{ :name => '采购|贸易|交通|物流'},
{ :name => '生产制造'},
{ :name => '咨询|法律|教育|翻译'},
{ :name => '服务业'},
{ :name => '兼职|实习|社工|其他'}
])

create_job = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个公开的工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "false"])
end
create_job = for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个隐藏的工作", wage_upper_bound: rand(50..99)*100, wage_lower_bound: rand(10..49)*100, is_hidden: "true"])
end

puts "10 Hidden jobs created."
