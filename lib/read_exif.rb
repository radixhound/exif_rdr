require 'exifr/jpeg'

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
      data = EXIFR::JPEG.new(filename)
      if data.exif?
        { filename: filename, latitude: data.gps&.latitude, longitude: data.gps&.longitude, status: 'success' }
      else
        { filename: filename, latitude: '', longitude: '', status: 'Undreadable or no EXIF data'}
      end
    end
  end
end