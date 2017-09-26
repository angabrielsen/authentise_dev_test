require './prettify_data.rb'
require 'json'

RSpec.describe Prettify, "#parse_data" do
  context "when reading local file" do
    it "prints an array" do
      prettify = Prettify.new
      data = prettify.parse_file

      expect(data.class).to eq Array
    end

    it "contains 6 objects" do
      prettify = Prettify.new
      data = prettify.parse_file

      expect(data.length).to eq 6
    end
  end
end

RSpec.describe Prettify, "#parse_individual" do
  context "after parsing data" do
    it "creates prettified string" do
      prettify = Prettify.new
      separated = prettify.parse_individual

      expect(separated.class).to eq String
    end

    # it "string is formatted correctly" do
    #   prettify = Prettify.new
    #   separated = prettify.parse_individual

    #   expect(separated).to eq JSON.pretty_generate(separated)
    # end
  end
end