#!/usr/bin/env ruby

require 'mongo'
require 'odf-report'

include Mongo

@coll = MongoClient.new('localhost', 27017)['datasheets_development']['big_generators']

puts @coll

@coll.find({}).each do |g|
  datasheet = ODFReport::Report.new('./big_gen-set_template.odt') do |d|
    g.each do |item|
      d.add_field item[0].to_sym, item[1]
    end
  end

  datasheet.generate "./out/#{g['model']}.odt"
  puts "Generated './out/#{g['model']}.odt'"
end

