# /bin/ruby

require 'rubygems'
require 'slop'
$:.unshift File.join(File.dirname(__FILE__), 'src')
require 'read_exif'

opts = Slop.parse do |o|
  o.bool '-c', '--csv', 'output csv', default: true
  o.bool '-h', '--html', 'output html', default: false
  o.string '-p', '--path', 'provide an alternate path to the files', default: './'
  o.on '--help' do
    puts o
    exit
  end
end

puts ReadExif.new(opts[:path]).read.to_s
