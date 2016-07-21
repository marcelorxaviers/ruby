# curl -XPOST -v -H 'Content-Type: application/json' http://toptal-api.herokuapp.com/api/auth/sign_in -d '{"email": "admin@user.com", "password": "password" }'
# curl -XGET -v -H 'Content-Type: application/json' -H 'access-token: ZqfbCHQAlvv4ENEv42fRXA' -H 'client: 7C0xA3QZPYw5jAMJQp7UzA' -H "uid: admin@user.com"  http://toptal-api.herokuapp.com/api/users/
admin_user = User.create(email: 'admin@user.com', password: '123qweasd', role: :admin)
manager_user = User.create(email: 'manager@user.com', password: '123qweasd', role: :manager)
regular_user = User.create(email: 'regular@user.com', password: '123qweasd', role: :regular)