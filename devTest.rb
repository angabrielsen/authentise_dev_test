
def parse_data
  # read file
  inputFileAsString = File.read("./Sample-stratasys-status-log.txt")
  #create empty arrat
  inputFileAsArray = []
  #split on new line & add to new array
  inputFileAsArray << inputFileAsString.split(/^\n\s/)
  #print new array
  puts inputFileAsArray
end

parse_data