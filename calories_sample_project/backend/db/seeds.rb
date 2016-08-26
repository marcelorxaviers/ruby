admin_user = User.create(email: 'admin@user.com', password: '123qweasd', role: :admin)
manager_user = User.create(email: 'manager@user.com', password: '123qweasd', role: :manager, expected_calories: 30)
regular_user = User.create(email: 'regular@user.com', password: '123qweasd', role: :regular, expected_calories: 30)

admin_meal = Meal.create!(day: Date.current, time: '12:00', calories: 10, user_id: admin_user.id, note: 'Meat')
manager_meal = Meal.create!(day: Date.current - 2.day, time: '13:15', calories: 20, user_id: manager_user.id, note: 'Corn')
regular_meal = Meal.create!(day: Date.current - 1.day, time: '22:34', calories: 30, user_id: regular_user.id, note: 'Rice')
