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
    "answer"
]

PRINTS_ENTER =
[
    "puts",
    "println",
    "echo",
    "alert",
]
    

def read(filename, ignore_errors)
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
                if !ignore_errors
                    puts "Error on line #{error_line}"
                    is_error = true
                end
            end
        elsif PRINTS_ENTER.includes? x[0].strip
            if x.size > 2
                
            elsif x.size < 2
                if !ignore_errors
                    puts "Error on line #{error_line}"
                    is_error = true
                end
            end
        else
            if !ignore_errors
                puts "Error on line #{error_line}"
                is_error = true
            end
        end


    end

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
                elsif x.size < 2

                end
            elsif PRINTS_ENTER.includes? x[0].strip
                if x.size > 2
                    puts x[1]
                elsif x.size < 2

                end
            else

            end

        end
    end


end
