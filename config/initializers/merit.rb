# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # # Define :current_user_method. Similar to previous option. It will be used
  # # to retrieve :user_model_name object if no `:to` option is given. Default
  # # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'  
end

Merit::Badge.create!(
  id: 1,
  name: "Pickup",
  level: 1,
  description: "Analyze 1 Game"
)
Merit::Badge.create!(
  id: 2,
  name: "Varsity",
  level: 2,
  description: "Analyze 5 Game"
)
Merit::Badge.create!(
  id: 3,
  name: "Division 3",
  level: 3,
  description: "Analyze 10 Game"
)
Merit::Badge.create!(
  id: 4,
  name: "Division 2",
  level: 4,
  description: "Analyze 15 Game"
)
Merit::Badge.create!(
  id: 5,
  name: "Division 1",
  level: 5,
  description: "Analyze 20 Game"
)
Merit::Badge.create!(
  id: 6,
  name: "Rookie",
  level: 6,
  description: "Analyze 25 Game"
)
Merit::Badge.create!(
  id: 7,
  name: "Veteran",
  level: 7,
  description: "Analyze 30 Game"
)
Merit::Badge.create!(
  id: 8,
  name: "Captain",
  level: 8,
  description: "Analyze 35 Game"
)
Merit::Badge.create!(
  id: 9,
  name: "Allstar",
  level: 9,
  description: "Analyze 40 Game"
)
Merit::Badge.create!(
  id: 10,
  name: "MVP",
  level: 10,
  description: "Analyze 100 Game"
)


























