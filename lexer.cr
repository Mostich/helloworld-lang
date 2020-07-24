module Lexer
  extend self

  def clear(lines)

    lines.each_index do |x|
      lines[x] = lines[x].strip
      lines[x] = lines[x].squeeze(' ')
    end

    return lines

  end

  class Read

    def initialize(strings, ignore_errors)
      is_error = false
      if !ignore_errors
       is_error = check(strings)
      end

      if !is_error

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
          end

          prints.each do |y|
            
            v = /^(#{y})\:?\s?\(?\s*\"(.+?)\"\s*\)?/
            k = /^(#{y})\:?\s*\(?\s*(\w+)\s*\)?/
            #Print quotes
            if !x.match(v).nil?
              keystring = x.match(v).not_nil!

              quotes = keystring[2]
              print("#{quotes.gsub("\\n", '\n')}")

            #Print Variable
            elsif !x.match(k).nil?
              keystring = x.match(k).not_nil!
              if variable.has_key?(keystring[2])
                quotes = variable[keystring[2]]
              else
                quotes = keystring[2]
              end
    
              print("#{quotes.gsub("\\n", '\n')}")
            else

            end
            

          end

        end
      end
    end

    def print_check(x, i, prints)
      prints.each do |y|
        quotes_r = /^(#{y})\:?\s?\(?\s*\"(.+?)\"\s*\)?/
        variable_r = /^(#{y})\:?\s*\(?\s*(\w+)\s*\)?/
        #Print Quotes
        if quotes_r =~ x
          return true
        #Print Variable
        elsif variable_r =~ x
          return true
        end
          
      end
    end

    def check(strings)
      error_in_string = true;
      variable = {"" => ""}
      prints = ["print"] of String 
      strings.each_with_index do |x, i|

        if !x.match(/(.+?)\s*(->)\s*(print)/).nil?
          keystring = x.match(/(.+?)\s*(->)\s*(print)/).not_nil!
          prints << keystring[1]
        #New Variable
        elsif !x.match(/(^var)\s+(.+?)\s*\=\s*(.+)/).nil?
          keystring = x.match(/(^var)\s+(.+?)\s*\=\s*"(.+)"/).not_nil!
          variable[keystring[2]] = keystring[3]
        end

        
        if /(.+?)\s*(->)\s*(print)/ =~ x
          error_in_string = true
        #New Variable
        elsif /(^var)\s+(.+?)\s*\=\s*(.+)/ =~ x
          error_in_string = true
        elsif /^\s*?\n*?$/ =~ x
          error_in_string = true
        elsif print_check(x, i, prints)

        else
          print "Error on line:".colorize.red.bold
          puts " #{i+1} | #{x}".colorize.bold
          return true
        end

      end
      
      return false

    end
  end

end