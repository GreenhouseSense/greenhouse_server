Rails.application.routes.draw do
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
      get 'decisions/get_weel'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/get_months'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/get_year'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'decisions/add'
    end
  end

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
