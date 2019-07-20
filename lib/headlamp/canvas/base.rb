require 'redgreenblue'

module Headlamp

  class Canvas

    attr_reader :data

    def initialize(*args)
      case args.count
      when 0
        cols = rows = 1
      when 1
        if args.first.respond_to? :to_i
          cols = rows = args.first
        elsif args.first.class == Class
          add_device args.first.new
          cols = devices.first.width
          rows = devices.first.height
        else
          add_device args.first
          cols = args.first.width
          rows = args.first.height
        end
      when 2
        cols = args[0]
        rows = args[1]
      end
      @data = Array.new(rows) { Array.new(cols) { RGB.black } }
    end

    def width
      if @data.map(&:size).uniq.size == 1
        @data.first.size
      else
        raise IndexError, 'row size differs'
      end
    end

    def height
      @data.size
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
