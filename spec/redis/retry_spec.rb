RSpec.describe Redis::Retry do
  describe "#redis_retry" do
    subject(:redis_retrier) { RedisRetryTest.new }

    it "raises Redis::Retry::Error if a connection couldn't be established" do
      allow(redis_retrier).to receive(:something_that_uses_redis).and_raise(Redis::BaseConnectionError)
      expect { redis_retrier.call }.to raise_error(Redis::Retry::Error)
    end

    it "yields if redis is functioning" do
      allow(redis_retrier).to receive(:something_that_uses_redis).and_return("works")
      expect(redis_retrier.call).to eq("works")
    end
  end
end

class RedisRetryTest
  include Redis::Retry

  def call
    redis_retry do
      something_that_uses_redis
    end
  end

  def something_that_uses_redis
    :ok
  end
end
