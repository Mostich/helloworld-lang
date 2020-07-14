lines = [""]

PRINTS =
  [
    "message",
    "print",
    "printf",
    "printl",
    "log",
    "say",
    "write",
    "type",
    "show",
    "publish",
    "scream",
    "roar",
    "shout",
    "call",
    "bawl",
    "yell",
    "trace",
    "out",
    "output",
    "comment",
    "imprint",
    "put_line",
    "return",
    "--",
    "display",
    "text",
    "chars",
    "writeline",
    "writes",
    "putline",
    "print_string",
    "start",
    "putl",
    "fwrite",
    "answer",
  ]

PRINTS_ENTER =
  [
    "puts",
    "println",
    "echo",
    "alert",
  ]


class Lexer
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

def read(filename, ignore_errors)
  lines = File.read_lines(filename)
  lines.each_index do |x|
    lines[x] = lines[x].strip
    lines[x] = lines[x].squeeze(' ')
  end

  lines.delete("")

  error_line = 0
  is_error = false

  lex = Lexer.new(lines)
  #contains_error( pointerof(is_error) , pointerof(error_line), lines, pointerof(ignore_errors))
  #performance(lines, is_error)

end


def contains_error(is_error, error_line, lines, ignore_errors)
  lex = Lexer.new(lines)
  lines.each do |x|
    error_line.value += 1
    x = x.split("\"")
    if x[0].includes? "("
      x[0] = x[0].delete("(")
    end

    if x[0].includes? ":"
      x[0] = x[0].delete(":")
      x[0] = x[0].delete(" ")
    end
    if PRINTS.includes? x[0].strip
      if x.size > 2
      elsif x.size < 2
        if !ignore_errors.value
          puts "Error on line #{error_line.value}"
          is_error.value = true
        end
      end
    elsif PRINTS_ENTER.includes? x[0].strip
      if x.size > 2
      elsif x.size < 2
        if !ignore_errors.value
          puts "Error on line #{error_line.value}"
          is_error.value = true
        end
      end
    else
      if !ignore_errors.value
        puts "Error on line #{error_line.value}"
        is_error.value = true
      end
    end
  end
end

def performance(lines, is_error)
  lines.each do |x|
    if !is_error
      x = x.split("\"")
      if x[0].includes? "("
        x[0] = x[0].delete("(")
      end

      if x[0].includes? ":"
        x[0] = x[0].delete(":")
        x[0] = x[0].delete(" ")
      end
      if PRINTS.includes? x[0].strip
        if x.size > 2
          print x[1]
        end
      elsif PRINTS_ENTER.includes? x[0].strip
        if x.size > 2
          puts x[1]
        end
      else
      end
    end
  end
end