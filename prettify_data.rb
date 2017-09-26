require "json"

class Prettify
	def parse_file
	  data = File.read("./machine_log.txt")
	    .strip
	    .gsub(/\r\n?/, "\n")
	    .split(";")

	  parsedData = data.map {
	    |item| item.strip.split(";")
	  }

	  parsedData
	end

	def parse_individual
		allActions = parse_file

		splitActionsData = allActions.map {
			|action| action.first
				.gsub(/\n\t-/, " ")
				.gsub(") {", ");{")
				.gsub(/\n/, " ")
				.split(";")
		}

		dataHash = {}

		processData = splitActionsData.each {
			|x| dataHash[:subtype] = x.first
				.to_s[/\(([^)]+)\)/]
				.gsub("(", "")
				.gsub(")", "")
				dataHash[:data] = x.last
				dataHash[:action] = x.to_s[/^([\w\-]+)/]
		}

		dataHash
	end
end

=begin
execute from command line

ruby -r "./prettify_data.rb" -e "Prettify.new.parse_individual"
=end