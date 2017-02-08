# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '设置管理员，生成隐藏job和显示job'

  User.create([email: 'xyy123@gmail.com', password: 'xyy123',
                   password_confirmation: 'xyy123', is_admin: 'true'])
  User.create([email: 'xyy@gmail.com', password: 'xyy123',
     password_confirmation: 'xyy123', is_admin: 'true'])



puts '管理员设置成功'

job_info = ['developer',
            'teacher',
            'editor',
            'engineer',
            'dancer']

create_jobs = for i in 1..10 do
             Job.create!([title: job_info[rand(job_info.length)],description: 'publish job',
             wage_lower_bound: rand(40..70)*800, wage_upper_bound: rand(40..70)*1000 , is_hidden: 'false'])
end
puts '10 publish jobs created'

create_jobs = for i in 1..10 do
  Job.create!([title: job_info[rand(job_info.length)], description: "hidden job", wage_upper_bound: rand(40..79) * 1000, wage_lower_bound: rand(20..39) * 1000, is_hidden: 'true'])
end
puts '10 hidden jobs created'
