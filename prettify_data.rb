require "json"
require "enumerator"

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
				.gsub(/\n\t/, " ")
		}

		dataHash = {}

		processData = splitActionsData.each {
			|x| dataHash[:action] = x[/^([\w\-]+)/]
				dataHash[:subtype] = x[/\(([^)]+)\)/]
					.gsub("(", "")
					.gsub(")", "")
				dataHash[:type] = x[/\ ([^)]+)\(/]
					.gsub(" ", "")
					.gsub("(", "")
				dataHash[:data] = x[/\{([^)]+)\}/]
					.gsub(/\n/, " ")
					.gsub("{ ", "")
					.gsub(" }", "")
					.split
					.each_slice(2) {
						|x, y| puts "#{x}, #{y}"
					}
		}

		puts JSON.pretty_generate(dataHash)
	end
end

=begin
execute from command line

ruby -r "./prettify_data.rb" -e "Prettify.new.parse_individual"
=end