# README
第一周作业-job-listing  1st time by echo creat at 2017-1-3

version-1
  1.套上 Bootstrap
  2.安装 devise
  3.安装 SimpleForm
version-1.1
  1.实作 Jobs 的 CRUD
  2.Job 至少必须要有 title 与 description 栏位
  3.Job 的 title 不可为空
  4.new/create/update/edit/destroy 动作必须要进行登入

  create at 2017-1-4
version-1.2
  在version-1.1上增加功能：
  1.实作 Admin 的 CRUD
  2.身为管理者才可以存取 http://localhost:3000/admin/jobs 下的职缺操作
  3.身为管理者才可以看到 Admin 管理选单的连结
  4.admin 的判定应该使用资料库的判断 is_admin
version-1.3
  在version-1.2上增加功能：
  1.新增“薪资上限”“薪资下限”“联络 Email”
  2.薪资不能为空，最低薪资至少要大于 0
  3.请贴你的 pull request 网址
version-1.4
  在version-1.3上增加功能：
  1.首页应该看不到隐藏的工作
  2.首页的工作应该按照建立时间倒叙排列
  3.后台的 Job List 列表，应该显示哪一些工作是“隐藏”还是“公开”

create at 2017-1-5
  version-1.4上修改了
  1.is_hidden显示bug
  2.增加遗漏的前后台show.html

  create at 2017-1-6
  在version-1.4上增加功能
  1.把 admin#jobs ( admin 用）与 jobs （使用者用）做个区分，加上 sidebar 设计
  2.在 admin 后台的职缺状态，改成图示
  3.把 render_job_status 改成 “图示”Font Awesome 图示。（使用 fa-lock / fa-globe ）
  4.把 is_hidden 的操作改成按钮
  5.jobs#show 在隐藏状态不可以用
  6.修改了前后台页面样式
