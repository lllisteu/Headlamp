require 'test/unit'

require 'headlamp/dev/rpish'

class Test_rpish_direct < Test::Unit::TestCase

  if Headlamp::Dev::RPiSH.new.fb

    def test_peek
      hat = Headlamp::Dev::RPiSH.new
      assert_equal 128, hat.peek.size
      assert_equal   2, hat.peek(0).size
      assert_equal  64, hat.peek(10,32).size
    end

    def test_poke
      hat = Headlamp::Dev::RPiSH.new
      assert_equal   1, hat.poke("\xff")
      assert_equal 128, hat.poke("\xff"*128)
      assert_equal   8, hat.poke(2, "\xff"*8)
    end

  end

end