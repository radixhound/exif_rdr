require 'exif'

# EXIF is supported in TIFF and JPEG files
class ReadExif
  class NoPathError < StandardError; end
  VALID_EXTENSIONS = [
    '/**/*.jpg',
    '/**/*.jpeg',
    '/**/*.jpe',
    '/**/*.jfif',
    '/**/*.jif',
  ].freeze

  def initialize(path=nil)
    raise NoPathError.new "You need to provide a path to the files" unless path
    path = path.to_s # ensure File.join doesn't fail
    expanded_globs = VALID_EXTENSIONS.map {|glob| File.join(path, glob)}
    @filenames = Dir[*expanded_globs]
  end

  def read
    @filenames.map do |filename|
      begin
        data = Exif::Data.new(File.open(filename))
        { filename: filename, latitude: data.gps_latitude, longitude: data.gps_longitude, status: 'success' }
      rescue Exif::NotReadable
        { filename: filename, latitude: '', longitude: '', status: 'Undreadable or no EXIF data'}
      end
    end
  end
end