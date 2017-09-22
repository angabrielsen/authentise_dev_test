require './prettify_data.rb'

RSpec.describe Prettify, "#parse_data" do
  context "when reading local file" do
    it "prints an array" do
      prettify = Prettify.new
      data = prettify.parse_data

      expect(data.class).to eq Array
    end

    it "contains 6 objects" do
      prettify = Prettify.new
      data = prettify.parse_data

      expect(data.length).to eq 6
    end
  end
end