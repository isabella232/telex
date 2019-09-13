Pliny.default_context = {app: "telex"}

unless ENV["TEST_LOGS"] == "true"
  module Pliny::Log
    def log(data, &block)
      block&.call
    end
  end
end
