require 'test/unit'

require 'headlamp/canvas'

class Test_canvas_devices < Test::Unit::TestCase

  def test_auto
    sheet = Headlamp::Canvas.new
    assert_true sheet.automatic

    sheet.automatic = nil
    assert_false sheet.automatic

    assert_equal [], sheet.devices
    sheet.add_device Object.new
    assert_equal 1, sheet.devices.count

    assert_equal sheet.devices[0], sheet.dev0
  end

end
