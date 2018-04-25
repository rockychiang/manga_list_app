      Method Path                                        Controller           Accessibility
--------------------------------------------------------------------------------------------
 [ ]  GET    /                                           static#home          public
 [X]  GET    /login(.:format)                            session#new          public
 [X]  POST   /sessions(.:format)                         session#create       public
 [X]  DELETE /logout(.:format)                           session#destroy      public
 [X]  GET    /auth/facebook/callback(.:format)           session#facebook     public
 [X]  GET    /register(.:format)                         users#new            public
 [X]  POST   /users(.:format)                            users#create         public
 [.]  GET    /users/:id(.:format)                        users#show           require_login
 [X]  POST   /users/:user_id/collections(.:format)       collections#create   current_user
 [ ]  GET    /users/:user_id/collections/:id(.:format)   collections#show     current_user
 [ ]  PATCH  /users/:user_id/collections/:id(.:format)   collections#update   current_user
 [ ]  PUT    /users/:user_id/collections/:id(.:format)   collections#update   current_user
 [X]  DELETE /users/:user_id/collections/:id(.:format)   collections#destroy  current_user
 [ ]  GET    /authors(.:format)                          authors#index        public
 [X]  GET    /authors/:id(.:format)                      authors#show         public
 [X]  GET    /manga(.:format)                            manga#index          public
 [ ]  POST   /manga(.:format)                            manga#create         require_admin
 [ ]  GET    /manga/new(.:format)                        manga#new            require_admin
 [ ]  GET    /manga/:id/edit(.:format)                   manga#edit           require_admin
 [.]  GET    /manga/:id(.:format)                        manga#show           public
 [ ]  PATCH  /manga/:id(.:format)                        manga#update         require_admin
 [ ]  PUT    /manga/:id(.:format)                        manga#update         require_admin
