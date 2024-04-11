# This is not the place for test data
# Only use this to put the necessary setup for the app to work
# Separate the seeds in different Seed Service Objects
# The data can then be loaded with the rails db:seed command

# Create coach John
coach_john = User.create!(email: 'coachjohn@example.com',
                          first_name: 'John',
                          last_name: 'Coach',
                          password: 'password',
                          password_confirmation: 'password')

coach_john_roleable = Coach.create!

Role.create!(user: coach_john,
             roleable: coach_john_roleable)

# Create coachee Mary
coachee_mary = User.create!(email: 'coacheemary@example.com',
                            first_name: 'Mary',
                            last_name: 'Coachee',
                            password: 'password',
                            password_confirmation: 'password')

coachee_mary_roleable = Coachee.create!

Role.create!(user: coachee_mary,
             roleable: coachee_mary_roleable)

# Create coachandcoachee Will
coachandcoachee_will = User.create!(email: 'coachandcoacheewill@example.com',
                                    first_name: 'Will',
                                    last_name: 'Coachandcoachee',
                                    password: 'password',
                                    password_confirmation: 'password')

coachandcoachee_will_coach_roleable = Coach.create!
coachandcoachee_will_coachee_roleable = Coachee.create!

Role.create!(user: coachandcoachee_will,
             roleable: coachandcoachee_will_coach_roleable)

Role.create!(user: coachandcoachee_will,
             roleable: coachandcoachee_will_coachee_roleable)
