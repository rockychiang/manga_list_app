Method Path                                        Controller           Accessibility
--------------------------------------------------------------------------------------
GET    /                                           static#home          public
GET    /login(.:format)                            session#new          public
POST   /sessions(.:format)                         session#create       public
DELETE /logout(.:format)                           session#destroy      public
GET    /auth/facebook/callback(.:format)           session#facebook     public
GET    /register(.:format)                         users#new            public
POST   /users(.:format)                            users#create         public
GET    /users/:id(.:format)                        users#show           require_login
POST   /users/:user_id/collections(.:format)       collections#create   current_user
GET    /users/:user_id/collections/:id(.:format)   collections#show     current_user
PATCH  /users/:user_id/collections/:id(.:format)   collections#update   current_user
PUT    /users/:user_id/collections/:id(.:format)   collections#update   current_user
DELETE /users/:user_id/collections/:id(.:format)   collections#destroy  current_user
GET    /authors(.:format)                          authors#index        public
GET    /authors/:id(.:format)                      authors#show         public
GET    /manga(.:format)                            manga#index          public
POST   /manga(.:format)                            manga#create         require_admin
GET    /manga/new(.:format)                        manga#new            require_admin
GET    /manga/:id/edit(.:format)                   manga#edit           require_admin
GET    /manga/:id(.:format)                        manga#show           public
PATCH  /manga/:id(.:format)                        manga#update         require_admin
PUT    /manga/:id(.:format)                        manga#update         require_admin