# /bin/ruby

require 'rubygems'
require 'slop'
$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'read_exif'
require 'csv_writer'
require 'html_writer'

opts = Slop.parse do |o|
  o.bool '-c', '--csv', 'output csv', default: true
  o.bool '-h', '--html', 'output html', default: false
  o.string '-p', '--path', 'provide an alternate path to the files', default: './'
  o.on '--help' do
    puts o
    puts <<~DOCS

      Sample usage for reading image files in the current folder and outputing to output.csv:

        $ ruby read.rb > output.csv

      If you want to output to html:

        $ ruby read.rb -h > output.html

      If you want to read from another folder:

        $ ruby read.rb -p ~/images/ -h > output.hml

    DOCS
    exit
  end
end

data = ReadExif.new(opts[:path]).read
if opts.html?
  puts HtmlWriter.new(data).call
else opts[:csv]
  puts CsvWriter.new(data).call
end
