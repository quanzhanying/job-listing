## My steps for Job Listing

1. change GEM file:

   ```rub
   gem 'bootstrap-sass'
   gem 'simple_form'
   gem 'devise'

   #gem 'spring'
   #gem 'spring-watcher-listen', '~> 2.0.0'
   ```

2. `bundle install`

3. ```
   rails g devise:install
   rails g devise user
   rake db:migrate

   rails generate simple_form:install --bootstrap
   ```

4. 重命名css文件

   ```
   mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
   ```

   并在文件中加入：

   ```
   mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
   ```

5. 添加app/views/common文件夹，并加入通用文件

6. 修改全局显示文件app/views/layouts

7. 添加flash功能：

   ```
   1. assets/javascripts/application.js 中添加：module 2. 在view 中添加 _flash.html.erb
   3. 在app/helpers/ 添加flash_helper.rbs
   ```

8. ​