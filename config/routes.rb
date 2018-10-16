Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :users, only: %i[show new create]
  resources :feeds, only: %i[index new edit create update destroy] do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: %i[index create destroy]
  resources :sessions, only: %i[new create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
