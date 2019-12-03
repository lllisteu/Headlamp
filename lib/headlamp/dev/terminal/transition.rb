module Headlamp
  module Dev

    class Terminal

      def transition__none(canvas,params)
        get_canvas(canvas,params).each do |row|
          puts ( row.map { |p| p.to_terminal_background_24bit + config[:pixel]}.join ) + "\e[0m"
        end
      end

    end

  end
end
