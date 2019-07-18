require 'headlamp/dev/generic'

module Headlamp
  module Dev

    class SVG < Generic

      def initialize(path,scale=10)
        config.merge!( {
          :path  => path,
          :scale => scale,
        } )
      end

      def scale
        config[:scale]
      end

      def inspect
        "SVG file '#{config[:path]}'"
      end

      def transition__none(canvas,params)
        File.write config[:path], get_svg(canvas,params)
      end

      def get_svg(canvas,params)
        out = "<!-- #{canvas.inspect} (#{Time.now.to_s}) -->"
        out << %(\n\n<svg xmlns="http://www.w3.org/2000/svg" width="#{canvas.width*scale}" height="#{canvas.height*scale}">)

        get_canvas(canvas,params).each_with_index do |row, r|
          out << "\n\n<!-- row #{r} -->"
          row.each_with_index do |pixel, c|

            out << %(\n<rect x="#{c*scale}" y="#{r*scale}" width="#{scale}" height="#{scale}" fill="##{pixel.hex}" />)
          end
        end

        out << "\n\n</svg>\n"
      end

    end

  end
end
