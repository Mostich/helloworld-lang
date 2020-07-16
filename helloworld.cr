require "option_parser"
require "./lexer.cr"

filename = ""
lines = [""]
about_file = false
ignore_errors = false
parser = OptionParser.new do |parser|
  parser.banner = "Usage: example [subcommand] [arguments]"
  parser.on("-f NAME", "--file=NAME", "File name") { |name| filename = name }
  parser.on("-i", "--ignore", "Ignore Errors") { ignore_errors = true }
  parser.on("-a", "--about", "About file") { about_file = true }
  parser.on("-v", "--version", "Version") do
    puts "HelloWorld: 0.1.2_1"
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
      read(filename, ignore_errors)
    end
  else
    puts "File not found!"
  end
end


def read(filename, ignore_errors)
  lines = File.read_lines(filename)

  lines = Lexer.clear(lines)
  lex = Lexer::Read.new(lines)
  
end

