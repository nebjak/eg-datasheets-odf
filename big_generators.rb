#!/usr/bin/env ruby

require 'mongo'
require 'odf-report'

include Mongo

@coll = MongoClient.new('localhost', 27017)['datasheets_development']['big_generators']

puts @coll

@coll.find({}).each do |g|
  datasheet = ODFReport::Report.new('./big_gen-set_template.odt') do |d|
    d.add_field :model, "#{g['model']}-S"
    d.add_field :sp_kva, g['kva_max']
    d.add_field :pp_kva, g['kva_cont']
    d.add_field :sp_kw, g['kw_max']
    d.add_field :pp_kw, g['kw_cont']
    d.add_field :napon, g['napon']
    d.add_field :struja, g['struja']
    d.add_field :frekvencija, g['frekvencija']
    d.add_field :autonomija, g['autonomija']
    d.add_field :motor_proizvodjac, g['motor_proizvodjac']
    d.add_field :motor_model, g['motor_model']
    d.add_field :motor_poreklo, g['motor_poreklo']
    d.add_field :motor_gorivo, g['motor_gorivo']
    d.add_field :motor_rpm, g['motor_rpm']
    d.add_field :motor_cm3, g['motor_cm3']
    d.add_field :motor_aspiracija, g['motor_aspiracija']
    d.add_field :motor_cilindri, g['motor_cilindri']
    d.add_field :motor_regulacija, g['motor_regulacija']
    d.add_field :motor_ulje, g['motor_ulje']
    d.add_field :motor_hladjenje, g['motor_hladjenje']
    d.add_field :motor_antifriz, g['motor_antifriz']
    d.add_field :motor_potrosnja_75, g['motor_potrosnja_75']
    d.add_field :motor_rezervoar, g['motor_rezervoar']
    d.add_field :generator_proizvodjac, g['generator_proizvodjac']
    d.add_field :generator_model, g['generator_model']
    d.add_field :generator_poreklo, g['generator_poreklo']
    d.add_field :generator_polovi, g['generator_polovi']
    d.add_field :generator_napon, g['generator_napon']
    d.add_field :generator_frekvencija, g['generator_frekvencija']
    d.add_field :generator_regulacija_napona, g['generator_regulacija_napona']
    d.add_field :generator_tacnost_regulacije, g['generator_tacnost_regulacije']
    d.add_field :generator_stepen_zastite, g['generator_stepen_zastite']
    d.add_field :generator_izolacija, g['generator_izolacija']
    d.add_field :nivo_buke_otvoreni, g['nivo_buke_otvoreni']
    d.add_field :nivo_buke_canopy, g['nivo_buke_canopy']
    d.add_field :dimenzije_otvoreni, g['dimenzije_otvoreni']
    d.add_field :masa_otvoreni, g['masa_otvoreni']
    d.add_field :dimenzije_canopy, g['dimenzije_canopy']
    d.add_field :masa_canopy, g['masa_canopy']
    d.add_field :kontrolna_tabla_ats, g['kontrolna_tabla_ats']
    case g['kva_max']
    when 0..25
      d.add_image :slika1, "./imgs/10-25-1.jpg"
      d.add_image :slika2, "./imgs/10-25-2.jpg"
    when 26..50
      d.add_image :slika1, "./imgs/25-50-1.jpg"
      d.add_image :slika2, "./imgs/25-50-2.jpg"
    when 51..110
      d.add_image :slika1, "./imgs/50-110-1.jpg"
      d.add_image :slika2, "./imgs/50-110-2.jpg"
    when 111..220
      d.add_image :slika1, "./imgs/110-200-1.jpg"
      d.add_image :slika2, "./imgs/110-200-2.jpg"
    end
  end

  datasheet.generate "./out/#{g['model']}-S.odt"
  puts "Generated './out/#{g['model']}-S.odt'"
end
