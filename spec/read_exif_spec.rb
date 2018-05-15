require 'spec_helper'
require 'read_exif'

RSpec.describe ReadExif do
  context "without a valid dirname" do
    # which would only happen if a developer used it wrong...
    it "raises an error" do
      expect{ ReadExif.new }.to raise_exception(ReadExif::NoPathError)
    end
  end

  context "when you pass a symbol as the dirname" do
    it "converts it to a string" do
      expect(ReadExif.new(:path).read).to be_an_instance_of(Array)
    end
  end

  context "when passed the gps_images path" do
    let(:path) { File.join(File.dirname(__FILE__), 'gps_images') }
    subject(:read) { ReadExif.new(path).read }

    it "gets the exif data of all files" do
      expect(read).to be_an_instance_of(Array)
      expect(read.length).to eq(5)
      expect(read.first).to include(:filename, :latitude, :longitude)
    end
  end

end