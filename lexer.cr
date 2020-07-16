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
        print "#{strings.index(x)}) [#{x}]\n"

        if !x.match(/(^print)(\:?)\s?"(.+)"/).nil?
          keystring = x.match(/(^print)(\:?)\s?"(.+)"/).not_nil!
          quotes = keystring[3]
          @keyword = keystring[1]
          colon = keystring[2]
        else
          quotes = "Nope"
          @keyword = "Nope"
          colon = "Nope"
        end
        puts "[\n keyword: [#{@keyword }]\n colon: [#{colon}] \n quotes: [#{quotes}] \n]"
      end

    end

  end

end