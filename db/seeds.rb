# This is not the place for test data
# Only use this to put the necessary setup for the app to work
# Separate the seeds in different Seed Service Objects
# The data can then be loaded with the rails db:seed command

# Create coach John
coach_john = User.create!(email: 'coachjohn@example.com',
                          password: 'password',
                          password_confirmation: 'password')

coach_john_roleable = Coach.create!

Role.create!(user: coach_john,
             roleable: coach_john_roleable)

# Create coachee Mary
coachee_mary = AdminUser.create!(email: 'coacheemary@example.com',
                                 password: 'password',
                                 password_confirmation: 'password')

coachee_mary_roleable = Coachee.create!

Role.create!(user: coachee_mary,
             roleable: coachee_mary_roleable)
