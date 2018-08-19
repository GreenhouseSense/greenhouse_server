Rails.application.routes.draw do
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
