require 'test/unit'

require 'headlamp/dev/rpish'

class Test_rpish_gamma < Test::Unit::TestCase

  if Headlamp::Dev::RPiSH.new.fb

    def test_gamma

      hat = Headlamp::Dev::RPiSH.new
      hat.gamma_reset

      assert_equal 32, hat.gamma_get.size

      # define 4 gammas
      gam_def = hat.gamma_get

      gam_low = [
        0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2,
        3, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 10, 10
      ]

      gam_lin = (0..31).to_a

      gam_cus = (16..31).to_a + (0..15).to_a.reverse

      # test

      hat.gamma_linear
      assert_equal gam_lin, hat.gamma_get

      hat.gamma_low_light
      assert_equal gam_low, hat.gamma_get

      hat.gamma_default
      assert_equal gam_def, hat.gamma_get

      hat.gamma_user
      assert_equal gam_lin, hat.gamma_get

      hat.gamma_set gam_cus
      assert_equal gam_cus, hat.gamma_get

      hat.gamma_reset
      assert_equal gam_def, hat.gamma_get

      hat.gamma_user
      assert_equal gam_cus, hat.gamma_get

      hat.gamma_reset
    end

  end

end
