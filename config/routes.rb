Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end

# 刚才没有这一行，现在有了，但却不行，我试试能否重新安装w

# open the slack
# 我之前有那一行，发现和教材不一样后删掉了，有的时候也不行
# 我能看到slack
