class Prettify
	def parse_data
	  data = File.read("./machine_log.txt")
	    .strip
	    .gsub(/\r\n?/, "\n")
	    .split(";")

	  parsedData = data.map {
	    |item| item.strip.split(";")
	  }

	  parsedData
	end
end

=begin
execute from command line

ruby -r "./prettify_data.rb" -e "Prettify.new.parse_data"
=end