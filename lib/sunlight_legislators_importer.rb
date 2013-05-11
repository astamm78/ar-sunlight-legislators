require 'csv'
require_relative '../app/models/politician'
require_relative '../db/config'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true, :header_converters => :symbol )
    csv.each do |politician|
      
       Politician.create( {   :title        => politician[:title],
                              :firstname    => politician[:firstname],
                              :lastname     => politician[:lastname],
                              :party        => politician[:party],
                              :state        => politician[:state],
                              :in_office    => politician[:in_office],
                              :gender       => politician[:gender],
                              :phone        => politician[:phone],
                              :website      => politician[:website],
                              :birthdate    => politician[:birthdate],
                              :twitter_id   => politician[:twitter_id] })

    end
  end
end

begin
  raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  SunlightLegislatorsImporter.import(ARGV[0])
rescue ArgumentError => e
  $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
rescue NotImplementedError => e
  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
end
