require 'test/unit'

require 'headlamp/dev/generic'

class Test_dev_generic < Test::Unit::TestCase

    def test_generic_transition_speed
      d = Headlamp::Dev::Generic.new
      assert_equal 1, d.speed

      d.speed = 0.2
      assert_equal 0.2, d.speed
    end

    def test_generic_no_transitions
      d = Headlamp::Dev::Generic.new

      assert_equal 0, d.transitions.count
      assert_nil d.transition
    end

    def test_generic_a_transition
      d = Headlamp::Dev::Generic.new
      def d.transition__foo;  end

      assert_equal 'foo', d.transition
    end

    def test_generic_some_transitions
      d = Headlamp::Dev::Generic.new

      def d.transition__foo;  end
      def d.transition__bar;  end
      def d.transition__none; end

      assert_equal 3, d.transitions.count
      assert_equal 'none', d.transition

      d.transition = 'bar'
      assert_equal 'bar', d.transition

      d.transition = 'none'
      assert_equal 'none', d.transition
    end

end
