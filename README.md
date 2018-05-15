# Installation
With `ruby 2.4.1`, bundler and homebrew:

`brew install libexif`
`bundle`

# Requirements

- [ ] extracts their EXIF GPS data (longitude and latitude)
- [ ] writes the name of that image and any GPS co-ordinates it finds to a CSV file.
- [ ] With no parameters, the utility should default to scanning from the current directory.
- [ ] It should take an optional parameter that allows any other directory to be passed in
- [ ] optionally writes to an HTML file

# gems

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
