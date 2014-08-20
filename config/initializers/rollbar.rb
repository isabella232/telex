unless Config.rack_env == 'test'
  Rollbar.configure do |config|
    config.access_token = ENV["ROLLBAR_ACCESS_TOKEN"]
    config.use_sucker_punch
  end
end

