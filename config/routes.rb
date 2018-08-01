Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'decisions/new'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/create'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/update'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/edit'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
