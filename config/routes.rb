Rails.application.routes.draw do
  root :to => 'application#home'
  get 'users/sign_up', :to => 'application#home'

  put 'v5', :to => 'application#test'
  get 'share', :to => 'application#share'
  get 'error', to: 'application#error'

  devise_for :users, :skip => [ :registrations ], :controllers => {
               :sessions  => 'users/sessions',  :confirmations => 'users/confirmations',
               :passwords => 'users/passwords', :unlocks       => 'users/unlocks'
             }
  mount Ishapi::Engine, :at => '/api/'
  mount IshManager::Engine, :at => '/manager/'

  get 'sitemap',                   :to => 'sitemaps#show'
  get 'sites/:domainname/sitemap', :to => 'sitemaps#show', :constraints => { :domainname => /.*/, :format => /xml/ }

  get '/auth/google_oauth2/callback', to: 'application#auth_callback'

end










=begin
  scope "/:locale", :constraints => { :locale => /en|ru|pt/ } do

    get 'about', :to => 'welcome#about', :as => :about
    get 'privacy', :to => 'welcome#privacy', :as => :privacy
    get 'contact', :to => 'welcome#contact', :as => :contact

    devise_for :users, :controllers => {
      :sessions => "users/sessions",
      :registrations => 'users/registrations'
    }


    # cities
    get 'cities/travel-to/:cityname' => redirect { |params, request| "http://travel-guide.mobi/en/cities/travel-to/#{params[:cityname]}" }
    get 'cities' => redirect { |params, request| 'http://travel-guide.mobi/en/cities' }
    get 'cities/*bbb' => redirect { |params, request| "http://travel-guide.mobi/#{params[:locale]}/cities/#{params[:bbb]}" }
    get 'venues/in-city/:cityname' => redirect { |params, request| "http://travel-guide.mobi/en/cities/travel-to/#{params[:cityname]}" }


    get 'galleries', :to => 'galleries#index', :as => :galleries
    get 'galleries/page/:galleries_page', :to => 'galleries#index' # @deprecated, keep it for Google
    get 'galleries/new', :to => 'galleries#new', :as => :new_gallery
    # @deprecated, instead of `show` there should be `style`
    get 'galleries/show/:galleryname/:photo_idx', :to => 'galleries#show', :as => :gallery, :constraints => { :photo_idx => /.*/ }
    get 'galleries/show/:galleryname', :to => 'galleries#show'
    get 'galleries/view/:galleryname' => redirect {|p,r| "/#{p[:locale]}/galleries/show/#{p[:galleryname]}/0" }
    # @deprecated, instead of `show` there should be `style`
    get 'galleries/j_show/:id', :to => 'galleries#j_show', :as => :j_gallery, :defaults => { :format => :json }
    get 'galleries/:style/:galleryname', :to => 'galleries#show', :as => :gallery_show_style, :constraints => { :style => /show_long|show_mini|show/ }
    get 'galleries/:id/edit', :to => 'galleries#edit', :as => :edit_gallery
    get 'galleries/search', :to => 'galleries#search'
    post 'galleries/:id', :to => 'galleries#update', :as => :update_gallery
    post 'galleries', :to => 'galleries#create'
    get 'galleries/:galleryname/multiadd', :to => 'photos#multinew', :as => :gallery_multiadd_photos
    post 'galleries/:galleryname/multiadd', :to => 'photos#j_create', :defaults => { :format => :json }
    get 'galleries/in-city/:cityname' => redirect{ |p,r| "http://travel-guide.mobi/#{p[:locale]}/cities/travel-to/#{p[:cityname]}" }
    post 'galleries/set_show_style/:style', :to => 'galleries#set_show_style'
    resources :galleries


    # get 'photos/upload', :to => 'photos#upload', :as => :new_photo
    # post 'churn-photos', :to => 'photos#churn_photos', :as => :churn_photos
    match 'photos/driver-for/:gallery_id' => 'photos#driver', :as => :add_photos, :via => [ :get, :post, :put ]
    match 'photos/do_upload/:gallery_id/by/:username', :to => 'photos#do_upload', :as => :do_upload, :via => [ :get, :post, :put ]
    get 'photos/new_profile_photo', :to => 'photos#new', :defaults => { :is_profile => true }, :as => :new_profile_photo
    get 'photos/new-for-gallery/:gallery_id', :to => 'photos#new', :as => :new_photo_for_gallery
    resources :photos


    get 'reports', :to => 'reports#index', :as => :reports
    get 'reports/page/:reports_page', :to => 'reports#index' # @deprecated, but keep it for Google
    get 'reports/view/:name_seo', :to => 'reports#show', :as => :report
    get 'reports/search', :to => 'reports#search', :defaults => { :my => false }
    get 'reports/show/:name_seo', :to => 'reports#show' # @deprecated, for Google?
    delete 'reports/:id', :to => 'reports#destroy', :as => :delete_report
    resources :reports


    get "sites/:domainname.html/newsitems/page/:newsitems_page" => redirect { |params, request|
      "/#{params[:locale]}/sites/#{params[:domainname]}/newsitems/page/#{params[:newsitems_page]}"
    }, :constraints => { :domainname => /.*/, :format => /xml|html|json/ }
    get "sites/:domainname.html", :to => "sites#show", :as => :site,   :constraints => { :domainname => /.*/, :format => /xml|html|json/ }
    get 'sites/:domainname/tags', :to => 'tags#index', :as => :tags,   :constraints => { :domainname => /.*/, :format => /xml|html|json/ }
    get 'sites/:domainname/tags/page/:tags_page', :to => 'tags#index', :constraints => { :domainname => /.*/, :format => /xml|html|json/ }
    scope 'sites/:domainname',                         :as => :sites,  :constraints => { :domainname => /.*/, :format => /xml|html|json/ } do
      get 'features', :to => 'sites#features', :as => :features
      get 'features/page/:features_page', :to => 'sites#features'
      get 'newsitems/page/:newsitems_page', :to => 'sites#show'
      get 'newspage/:newsitems_page' => redirect { |p,r| "/#{p[:locale]}/sites/#{p[:domainname]}/newsitems/page/#{p[:newsitems_page]}" }

      get 'reports', :to => 'reports#index', :as => :reports
      get 'reports/page/:reports_page', :to => 'reports#index'

      get 'galleries', :to => 'galleries#index', :as => :galleries
      get 'galleries/page/:galleries_page', :to => 'galleries#index'

      get 'sitemap' => redirect { |params, request| "http://#{request.domain}/en/sitemap.xml" }
    end

    get 'tags' => redirect { |params, request| "/#{params[:locale]}/sites/#{request.domain}/tags" }
    get 'tags/:tagname' => redirect { |params, request| "/#{params[:locale]}/tags/view/#{params[:tagname]}" }
    get 'tags/view/:tagname', :to => 'tags#show', :as => :tag


    get '/users', :to => 'users#index', :as => :users
    get '/users/page/:users_page', :to => 'users#index'
    get '/users/show/:username', :to => 'users#show', :as => :user
    # update
    put '/users/:id', :to => 'users#update', :as => :update_user
    put '/users/show/:id', :to => 'users#update'
    patch '/users/show/:id', :to => 'users#update'
    # resume/profile
    get '/users/:username/resume', :to => 'users#show', :as => :user_resume
    get '/users/:username/resume/print', :to => 'users#show', :defaults => { :print => true }, :as => :user_resume_print
    get '/users/:username/articles', :to => 'users#reports'
    get '/users/:username/articles/page/:reports_page', :to => 'users#reports'
    get '/users/:username/reports', :to => 'users#reports', :as => :user_reports
    get '/users/:username/reports/show/:name_seo', :to => 'users#report', :as => :user_report
    get '/users/:username/galleries', :to => 'users#galleries', :as => :user_galleries
    get '/users/:username/galleries/page/:galleries_page', :to => 'users#galleries'
    match '/users/scratchpad', :to => 'users#scratchpad', :as => :scratchpad, :via => [ :get, :post, :put ]
    get '/users/sign_in', :to => 'users#sign_in', :as => :sign_in
    get '/users/organizer', :to => 'users#organizer', :as => :organizer
    get '/users/organizer2', :to => 'users#organizer2', :as => :organizer2

    get '/users/new_profile', :to => 'users#new_profile', :as => :new_user_profile
    get '/users/:username/profiles/:profile_id/edit', :to => 'users#edit_profile', :as => :edit_user_profile
    put '/users/:username/profiles/:profile_id', :to => 'users#update_profile', :as => :update_profile
    get '/users/gallery/:galleryname', :to => 'users#gallery', :as => :user_gallery
    get '/users/in-city/:cityname', :to => 'users#index', :as => :users_in_city
    post '/user_profiles', :to => 'users#create_profile'
    match '/users/search', :to => 'users#index', :as => :users_search, :via => [ :get, :post, :put ]
    get '/users/:username/github', :to => 'users#github_page', :as => :user_github
    get '/settings', :to => 'users#edit', :as => :settings
    match '/users/new_message', :to => 'users#new_message', :as => :new_message, :via => [ :get, :post, :put ]
    # resources :user_profile
    # messages are not a full resource yet.


    get 'videos', :to => 'videos#index', :as => :videos
    get 'videos/page/:videos_page', :to => 'videos#index'
    get 'videos/show/:youtube_id', :to => 'videos#show', :as => :video
    get 'videos/view/:youtube_id' => redirect { |p,r| "/#{p[:locale]}/videos/show/#{p[:youtube_id]}" }
    post 'videos', :to => 'videos#create'
    get 'videos/new', :to => 'videos#new', :as => :new_video
    get 'videos/in-tag/:tagname' => redirect { |p,r| "/#{p[:locale]}/tags/show/#{p[:tagname]}" }
    # resources :videos

    # venues
    get 'venues/in-city/:cityname' => redirect { |p,r| "http://travel-guide.mobi/#{p[:locale]}/cities/travel-to/#{p[:cityname]}" }
    get 'venues/show/:venue_name' => redirect { |p, r| "http://travel-guide.mobi/#{p[:locale]}/venues/show/#{p[:venue_name]}" }
    get 'venues/:venue_name/galleries/show/:gallery_name' => redirect { |p,r| "/#{p[:locale]}/galleries/show/#{p[:gallery_name]}/0" }
    # this must be the last line of redirects
    get 'venues/*bbb' => redirect { |p, r| "http://travel-guide.mobi/#{p[:locale]}/venues/#{p[:bbb]}" }
    #
    # other
    match '*other', :to => 'welcome#error500', :as => :error500, :via => [ :get, :post, :put ]

  end # scope :locale

  get 'sitemap_photos', :to => 'utils/sitemaps#photos', :as => :sitemap_photos

  # this is one hop instead of two (but there is code publication)
  get 'tags' => redirect { |params, request| "/en/sites/#{request.domain}/tags" }
end
=end

