require 'redgreenblue'

module Headlamp

  class Canvas

    attr_reader :width, :height, :data

    def initialize(*args)
      case args.count
      when 0
        @width = @height = 1
      when 1
        if args.first.respond_to? :to_i
          @width = @height = args.first
        elsif args.first.class == Class
          add_device args.first.new
          @width  = devices.first.width
          @height = devices.first.height
        else
          add_device args.first
          @width  = args.first.width
          @height = args.first.height
        end
      when 2
        @width  = args[0]
        @height = args[1]
      end
      @data = Array.new(height) { Array.new(width) { RGB.black } }
    end

    def to_a
      @data.flatten
    end

    def each
      @data.flatten.each { |pixel| yield pixel }
      automatically_render
    end

    def each_with_index
      @data.flatten.each_with_index { |pixel,i| yield pixel,i }
      automatically_render
    end

    def each_with_coordinates
      @data.each_with_index do |row,row_number|
        row.each_with_index do |pixel, col_number|
          yield pixel, row_number, col_number
        end
      end
      automatically_render
    end

  end

end
