require 'test/unit'

require 'headlamp/canvas'

class Test_canvas_base < Test::Unit::TestCase

  def test_base
    sheet = Headlamp::Canvas.new
    assert_equal sheet.height, sheet.width

    sheet = Headlamp::Canvas.new 5
    assert_equal 25, sheet.to_a.size
    assert_equal  5, sheet.width
    assert_equal  5, sheet.height

    sheet = Headlamp::Canvas.new 10, 20
    assert_equal 200, sheet.to_a.size
    assert_equal  10, sheet.width
    assert_equal  20, sheet.height
  end

  def test_init_with_object
    d = Headlamp::Dev::Generic.new
    d.config.merge!( { :width => 3, :height => 6 } )
    sheet = Headlamp::Canvas.new d
    assert_equal 18, sheet.to_a.size
    assert_equal  3, sheet.width
    assert_equal  6, sheet.height
  end

  def test_each
    sheet = Headlamp::Canvas.new 15

    sheet.each { |p| p.rr = 256 }
    sheet.each_with_index do |p,i|
      assert_equal 256, p.rr
    end

    sheet.each_with_index { |p,i| p.b = i }
    sheet.each_with_coordinates { |p,r,c| p.r = r; p.g = c }

    sheet.each do |p|
      assert_equal p.b, p.r * 15 + p.g
    end
  end

end
