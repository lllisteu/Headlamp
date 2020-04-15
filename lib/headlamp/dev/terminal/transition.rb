module Headlamp
  module Dev

    class Terminal

      def transition__none(canvas,params)
        off!
        get_canvas(canvas,params).each do |row|
          puts ( row.map { |p| p.terminal_background + config[:pixel]}.join ) + "\e[0m"
        end
      end

    end

  end
end
