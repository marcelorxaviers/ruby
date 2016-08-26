# USER SIGN IN
  curl -XPOST -v -H 'Content-Type: application/json' http://localhost:3000/api/auth/sign_in -d '{"email": "reg@user.com", "password": "123qweasd" }'
# USER INDEX
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users
# USER ROLES
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users/roles
# USER SHOW
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users/2
# USER NEW
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users/2
# USER CREATE
  curl -XPOST -v -H 'Content-Type: application/json' http://localhost:3000/api/users -d '{ "user": { "email": "new@user.com", "password": "123qweasd" } }'
  # AS ADMIN
  curl -XPOST -v -H 'Content-Type: application/json' -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users -d '{ "user": { "email": "new_manager@user.com", "password": "123qweasd", "role": "manager" } }'
# USER UPDATE
  curl -XPUT -v -H 'Content-Type: application/json' -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users/5 -d '{ "user": { "role": "regular" } }'
  curl -XPATCH -v -H 'Content-Type: application/json' -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users/5 -d '{ "user": { "role": "manager" } }'
# USER DELETE
  curl -XDELETE -v -H 'Content-Type: application/json' -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/users/4


# MEAL INDEX
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/meals
# MEAL SHOW
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/meals/1
# MEAL SHOW
  curl -XGET -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' http://localhost:3000/api/meals/1
# MEAL CREATE
  curl -XPOST -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' -H 'Content-Type: application/json' http://localhost:3000/api/meals -d '{ "meal": { "day": "2016-08-19", "time": "12:00", "note": "Cucumber", "user_id": 1, "calories": 10 } }'
# MEAL UPDATE
  curl -XPUT -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' -H 'Content-Type: application/json' http://localhost:3000/api/meals/13 -d '{ "meal": { "day": "2016-08-10" } }'
  curl -XPATCH -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' -H 'Content-Type: application/json' http://localhost:3000/api/meals/13 -d '{ "meal": { "day": "2016-08-11" } }'
# MEAL UPDATE
  curl -XDELETE -v -H 'AUTHORIZATION: token="iZ8JKQHtcL4-Jm7xrokZdQ", email="reg@user.com"' -H 'Content-Type: application/json' http://localhost:3000/api/meals/13
