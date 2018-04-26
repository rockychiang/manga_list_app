      Method Path                                        Controller           Accessibility
--------------------------------------------------------------------------------------------
 [ ]  GET    /                                           static#home          public
 [X]  GET    /login(.:format)                            session#new          public
 [X]  POST   /sessions(.:format)                         session#create       public
 [X]  DELETE /logout(.:format)                           session#destroy      public
 [X]  GET    /auth/facebook/callback(.:format)           session#facebook     public
 [X]  GET    /register(.:format)                         users#new            public
 [X]  POST   /users(.:format)                            users#create         public
 [X]  GET    /users/:id(.:format)                        users#show           require_login
 [X]  POST   /users/:user_id/collections(.:format)       collections#create   require_login
 [X]  PATCH  /users/:user_id/collections/:id(.:format)   collections#update   owner?
 [X]  PUT    /users/:user_id/collections/:id(.:format)   collections#update   owner?
 [X]  DELETE /users/:user_id/collections/:id(.:format)   collections#destroy  owner?
 [X]  GET    /authors(.:format)                          authors#index        public
 [X]  GET    /authors/:id(.:format)                      authors#show         public
 [X]  GET    /manga(.:format)                            manga#index          public
 [X]  POST   /manga(.:format)                            manga#create         require_admin
 [X]  GET    /manga/new(.:format)                        manga#new            require_admin
 [X]  GET    /manga/:id/edit(.:format)                   manga#edit           require_admin
 [X]  GET    /manga/:id(.:format)                        manga#show           public
 [X]  PATCH  /manga/:id(.:format)                        manga#update         require_admin
 [X]  PUT    /manga/:id(.:format)                        manga#update         require_admin
