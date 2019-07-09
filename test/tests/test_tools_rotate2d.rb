require 'test/unit'

require 'headlamp/tools/rotate2d'

class Test_tools_rotate < Test::Unit::TestCase

  def test_simple

    ary = [ [1,2,3], [4,5,6], [7,8,9] ]

    assert_equal ary, Headlamp::Tools.rot2d(ary,  0)
    assert_equal ary, Headlamp::Tools.rot2d(ary, 91)

    assert_equal [[7,4,1], [8,5,2], [9,6,3]], Headlamp::Tools.rot2d(ary      )
    assert_equal [[7,4,1], [8,5,2], [9,6,3]], Headlamp::Tools.rot2d(ary,   90)
    assert_equal [[7,4,1], [8,5,2], [9,6,3]], Headlamp::Tools.rot2d(ary,  450)
    assert_equal [[7,4,1], [8,5,2], [9,6,3]], Headlamp::Tools.rot2d(ary, -270)

    assert_equal [[9,8,7], [6,5,4], [3,2,1]], Headlamp::Tools.rot2d(ary,  180)
    assert_equal [[9,8,7], [6,5,4], [3,2,1]], Headlamp::Tools.rot2d(ary, -180)
    assert_equal [[9,8,7], [6,5,4], [3,2,1]], Headlamp::Tools.rot2d(ary,  540)

    assert_equal [[3,6,9], [2,5,8], [1,4,7]], Headlamp::Tools.rot2d(ary,  270)
    assert_equal [[3,6,9], [2,5,8], [1,4,7]], Headlamp::Tools.rot2d(ary,  -90)
    assert_equal [[3,6,9], [2,5,8], [1,4,7]], Headlamp::Tools.rot2d(ary, -450)

  end

end
