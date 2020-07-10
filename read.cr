lines = [""]

PRINTS = 
[
    "message",
    "print",
    "printf",
    "printl",
    "alert",
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
    "answer"
]

PRINTS_ENTER =
[
    "puts",
    "println",
    "echo",
]
    

def read(filename)
    lines = File.read_lines(filename)
    lines.each_index do |x|
        lines[x] = lines[x].strip
        lines[x] = lines[x].squeeze(' ')
    end
    lines.delete("")
    error_line = 0
    is_error = false
    lines.each do |x|
        error_line += 1
        x = x.split("\"")

        if PRINTS.includes? x[0].strip
            if x.size > 2
                
            elsif x.size < 2
                puts "Error on line #{error_line}"
                is_error = true
            end
        elsif PRINTS_ENTER.includes? x[0].strip
            if x.size > 2
                
            elsif x.size < 2
                puts "Error on line #{error_line}"
                is_error = true
            end
        else
            puts "Error on line #{error_line}"
            is_error = true
        end


    end

    lines.each do |x|
        x = x.split("\"")
        if !is_error
            if PRINTS.includes? x[0].strip
                if x.size > 2
                    print x[1]
                elsif x.size < 2
                    print "Error"
                end
            elsif PRINTS_ENTER.includes? x[0].strip
                if x.size > 2
                    puts x[1]
                elsif x.size < 2
                    puts "Error"
                end
            else
                puts "Error"
            end
        end
    end


end





