module Lexer
  extend self

  def clear(lines)

    lines.each_index do |x|
      lines[x] = lines[x].strip
      lines[x] = lines[x].squeeze(' ')
    end

    lines.delete("")

    return lines

  end

  class Read

    def initialize(strings)
      @keyword = ""

      strings.each do |x|
        if !x.match(/(^print)\:?\s?\(?\s*"(.+)"\s*\)?/).nil?
          keystring = x.match(/(^print)\:?\s?\(?\s*"(.+)"\s*\)?/).not_nil!
          quotes = keystring[2]
          @keyword = keystring[1]
          str = "Hello\n"
          print("#{quotes.gsub("\\n", '\n')}")
        end
      end

    end

  end

end