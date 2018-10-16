50.times do
  password = 'password'
  User.create!(name: Faker::NewGirl.character,
               email: Faker::Internet.email,
               password: password,
               password_confirmation: password)
end
