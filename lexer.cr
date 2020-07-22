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
      variable = {"" => ""}
      strings.each do |x|
        if !x.match(/(^print)\:?\s?\(?\s*\"(.+?)\"\s*\)?/).nil?
          keystring = x.match(/(^print)\:?\s?\(?\s*\"(.+?)\"\s*\)?/).not_nil!

          quotes = keystring[2]
          @keyword = keystring[1]
          print("#{quotes.gsub("\\n", '\n')}")
        end

        if !x.match(/^print[ ]*\:?\(?[ ]*(\w+)[ ]*\)?/).nil?
          keystring = x.match(/(^print*)\:?\(?[ ]*(\w+)[ ]*\)?/).not_nil!
          if variable.has_key?(keystring[2])
            quotes = variable[keystring[2]]
          else
            quotes = keystring[2]
          end

          @keyword = keystring[1]
          print("#{quotes.gsub("\\n", '\n')}")
        end


        if !x.match(/(^var)\s+(.+?)\s*\=\s*(.+)/).nil?
          keystring = x.match(/(^var)\s+(.+?)\s*\=\s*"(.+)"/).not_nil!
          variable[keystring[2]] = keystring[3]
          #puts variable[keystring[2]]
        end

      end

    end

  end

end