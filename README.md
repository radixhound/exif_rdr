# Installation
With `ruby 2.4.1`, bundler and homebrew:

`brew install libexif`
`bundle`

Then run it:

`ruby read.rb`

It will output to stdout by default.

# Requirements

- [X] extracts their EXIF GPS data (longitude and latitude)
- [X] writes the name of that image and any GPS co-ordinates it finds to a CSV file.
- [X] With no parameters, the utility should default to scanning from the current directory.
- [X] It should take an optional parameter that allows any other directory to be passed in
- [X] optionally writes to an HTML file

# Gems we need

- exif
- csv
- html generator
- command line parser

# Steps

1. get a list of files
2. filter non-jpegs
3. get exif data for each
4. output to CSV writer
5. or output to HTML writer (use slim)

# Key learnings:

The `exif` gem is supposedly faster (I wasn't able to test it myself) but required manual decoding of the lat/long data from exif and that was going to be a pain so I switched to `exifr` which unfortunately has a super ugly interface :-(
