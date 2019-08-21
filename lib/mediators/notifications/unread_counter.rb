module Mediators::Notifications
  class UnreadCounter < Mediators::Base
    def initialize(user:)
      @user = user
    end

    def call
      Notification
        .where(user: @user)
        .where(Sequel.lit("notifications.created_at > now() - '1 month'::interval"))
        .where(Sequel.lit("notifications.read_at IS NULL"))
        .count
    end
  end
end
