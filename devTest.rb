
def parse_data
  data = File.read("./Sample-stratasys-status-log.txt").gsub(/\r\n?/, "\n").split(";")

  parsedData = []

  parsedData << data.each {
    |item| item.split
  }

  puts parsedData.inspect
end

parse_data