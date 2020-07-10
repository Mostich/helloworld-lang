require "option_parser"
require "./read.cr"
filename = ""
about_file = false
parser = OptionParser.new do |parser|
  parser.banner = "Usage: example [subcommand] [arguments]"
  parser.on("-f NAME", "--file=NAME", "File name") { |name| filename = name }
  parser.on("-a", "--about", "About file") { about_file = true }
  parser.on("-v", "--version", "Version") do
    puts "HelloWorld: 0.1.1"
    exit
  end
  parser.on("-h", "--help", "Show HELP") do
    puts parser
    exit
  end
end

parser.parse

if File.extname(filename) == ""
    puts "The file has no extension!"
elsif File.extname(filename) != ".hw"
    puts "File extension not .hw"
else
    
    if File.file?(filename)
        if File.size(filename) == 0
            puts "File is empty"
        else
            if about_file
                puts "Filename: #{filename}"
                puts "Size: #{File.size(filename)} bytes"
            end
            read(filename)
        end
    else
        puts "File not found!"
    end
end
