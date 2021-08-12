Rails.application.routes.draw do
  get '/users', to: 'user_post#users_index'
  get '/posts', to: 'user_post#posts_index'
  get '/userPost', to: 'user_post#user_post_index'
end
