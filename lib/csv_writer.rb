require 'csv'

# Write Exif data to CSV output
class CsvWriter
  def initialize(exif_data)
    @exif_data = exif_data
  end

  def call
    CSV.generate do |csv|
      csv << @exif_data.first.keys.map(&:to_s)
      @exif_data.each { |data| csv << data.values }
    end
  end
end
