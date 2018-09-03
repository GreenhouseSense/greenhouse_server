Rails.application.routes.draw do
  #devise_for :greenhouse_services
  #devise_for :users

  namespace :api do
    namespace :v1 do
      post 'greenhouse_service_controller/login'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'greenhouse_service_controller/logout'
    end
  end
  namespace :api do
    namespace :v1 do
      post 'actions/add'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'actions/get_all'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'actions/get'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'actions/update'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'actions/destroy'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'readings/add'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'readings/get_last'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'readings/get_weeks'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'readings/get_months'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'readings/get_years'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/get_last'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/get_weeks'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/get_years'
    end
  end


  namespace :api do
    namespace :v1 do
      get 'decisions/get_months'
    end
  end


  namespace :api do
    namespace :v1 do
      post 'decisions/add'
    end
  end

  namespace :api do
    namespace :v1 do
      post 'sessions/login'
      post 'sessions/logout'
      post 'sessions/new_user'
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
