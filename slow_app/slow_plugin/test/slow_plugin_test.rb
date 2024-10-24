require "test_helper"

class SlowPluginTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert SlowPlugin::VERSION
  end
end
