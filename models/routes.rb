Router.configure do
  map '/',                     controller: 'root',     action: 'index'
  map '/profile',              controller: 'profile',  action: 'show'
  map '/sign_in',              controller: 'sessions', action: 'new'
  map '/sign_out',             controller: 'sessions', action: 'destroy'
  map '/auth/github/callback', controller: 'sessions', action: 'create'
end
