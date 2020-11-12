module Headlamp

  class Canvas

    def view
      data.each do |row|
        puts ( row.map { |p| p.terminal_background + '  '}.join ) + "\e[0m"
      end
      nil
    end

    alias v view

  end

end
