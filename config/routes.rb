Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # rootの設定をpictweetを参考にしましょう
  # itemコントローラーの作成をしましょう
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
