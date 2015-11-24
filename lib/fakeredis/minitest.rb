# Require this either in your Gemfile or in your minitest configuration.
# Examples:
#
#   # Gemfile
#   group :test do
#     gem 'rspec'
#     gem 'fakeredis', :require => 'fakeredis/minitest'
#   end
#
#   # test/test_helper.rb (or test/minitest_config.rb)
#   require 'fakeredis/minitest'

require 'fakeredis'

module FakeRedis
  module Minitest
    def setup
      super
      Redis::Connection::Memory.reset_all_databases
    end

    Minitest::Test.send(:include, self)
  end
end
