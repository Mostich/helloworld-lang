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
      prints = ["print"] of String 
      strings.each do |x|
        #New word
        if !x.match(/(.+?)\s*(->)\s*(print)/).nil?
          keystring = x.match(/(.+?)\s*(->)\s*(print)/).not_nil!
          prints << keystring[1]
        end

        #New Variable
        if !x.match(/(^var)\s+(.+?)\s*\=\s*(.+)/).nil?
          keystring = x.match(/(^var)\s+(.+?)\s*\=\s*"(.+)"/).not_nil!
          variable[keystring[2]] = keystring[3]
          #puts variable[keystring[2]]
        end

        prints.each do |y|
          #Print quotes
          v = /^(#{y})\:?\s?\(?\s*\"(.+?)\"\s*\)?/
          if !x.match(v).nil?
            keystring = x.match(v).not_nil!

            quotes = keystring[2]
            @keyword = keystring[1]
            print("#{quotes.gsub("\\n", '\n')}")
          end

          #Print Variable
          k = /^(#{y})\:?\s*\(?\s*(\w+)\s*\)?/
          #puts "K: #{k}"
          if !x.match(k).nil?
            keystring = x.match(k).not_nil!
            if variable.has_key?(keystring[2])
              quotes = variable[keystring[2]]
            else
              quotes = keystring[2]
            end
  
            @keyword = keystring[1]
            print("#{quotes.gsub("\\n", '\n')}")
          end

        end

      end

    end

  end

end