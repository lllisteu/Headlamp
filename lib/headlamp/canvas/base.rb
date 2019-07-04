require 'redgreenblue'

module Headlamp

  class Canvas

    attr_reader :width, :height

    def initialize(columns=1,rows=columns)
      @width  = columns.to_i
      @height = rows.to_i
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
