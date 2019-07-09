require 'test/unit'

require 'headlamp/dev/generic'

class Test_dev_generic < Test::Unit::TestCase

    def test_base

      d = Headlamp::Dev::Generic.new
      assert_equal Hash, d.config.class

      assert_equal 0, d.orientation

    end

end
