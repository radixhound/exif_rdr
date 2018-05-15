require 'csv'
require 'slim'
require 'byebug'

# Write Exif data to HTML output
class HtmlWriter
  def initialize(exif_data)
    @exif_data = exif_data
  end

  def call
    template_path = File.join(File.dirname(__FILE__), 'output.slim')
    Slim::Template.new(template_path).render(self)
  end

  def rows
    @exif_data
  end
end