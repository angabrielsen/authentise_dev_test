def parse_data
  data = File.read("./machine_log.txt")
    .strip
    .gsub(/\r\n?/, "\n")
    .split(";")

  parsedData = data.map {
    |item| item.strip.split
  }

  puts parsedData.inspect
end

parse_data