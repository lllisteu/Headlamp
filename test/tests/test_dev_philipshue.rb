require 'test/unit'

require 'headlamp/dev/philipshue'

class Test_philipshue < Test::Unit::TestCase

  def test_require
    assert_equal Class, Headlamp::Dev::PhilipsHue::Light.class
  end

end