#!/usr/bin/env ruby

require 'odf-report'
require 'json'

data = JSON.parse(File.read "data.json")

data.each do |g|
  datasheet = ODFReport::Report.new('./big_gen-set_template.odt') do |d|
    d.add_field :model, g['Model']
    d.add_field :sp_kva, g['Stand by kVA']
    d.add_field :pp_kva, g['Prime kVA']
    d.add_field :sp_kw, g['Stand by kW']
    d.add_field :pp_kw, g['Prime kW']
    d.add_field :napon, g['Napon']
    d.add_field :struja, g['Struja']
    d.add_field :frekvencija, g['Frekvencija']
    d.add_field :motor_proizvodjac, g['Motor proizvodjac']
    d.add_field :motor_model, g['Motor model']
    d.add_field :motor_poreklo, g['Motor zemlja porekla']
    d.add_field :motor_gorivo, g['Motor gorivo']
    d.add_field :motor_rpm, g['Motor broj obrtaja']
    d.add_field :motor_cm3, g['Motor zapremina']
    d.add_field :motor_aspiracija, g['Motor aspiracija']
    d.add_field :motor_cilindri, g['Motor broj cilindara']
    d.add_field :motor_regulacija, g['Motor regulacija']
    d.add_field :motor_ulje, g['Motor kapacitet ulja']
    d.add_field :motor_hladjenje, g['Motor vrsta hladjenja']
    d.add_field :motor_antifriz, g['Motor zapremina rashladne tecnosti']
    d.add_field :motor_potrosnja_80, g['Motor prosecna potrosnja 80%']
    d.add_field :generator_proizvodjac, g['Generator proizvodjac']
    d.add_field :generator_model, g['Generator model']
    d.add_field :generator_poreklo, g['Generator zemlja porekla']
    d.add_field :generator_polovi, g['Generator broj polova']
    d.add_field :generator_napon, g['Generator napon']
    d.add_field :generator_frekvencija, g['Generator frekvencija']
    d.add_field :generator_regulacija_napona, g['Generator regulacija napona']
    d.add_field :generator_tacnost_regulacije, g['Generator racnost regulacije']
    d.add_field :generator_stepen_zastite, g['Generator stepen zastite']
    d.add_field :generator_izolacija, g['Generator izolacija']
    d.add_field :dimenzije_canopy, g['Dimzenije canopy']
    d.add_field :masa_canopy, g['Masa canopy']
    d.add_field :rezervoar_canopy, g['Kapacitet rezervoara canopy']
    d.add_field :autonomija_canopy, g['Autonomija canopy']
    d.add_field :nivo_buke_canopy, g['Nivo buke canopy']
    d.add_field :dimenzije_otvoreni, g['Dimenizje open']
    d.add_field :masa_otvoreni, g['Masa open']
    d.add_field :rezervoar_otvoreni, g['Kapacitet rezervoara open']
    d.add_field :autonomija_otvoreni, g['Autonomija open']
    d.add_field :nivo_buke_otvoreni, g['Nivo buke open']
    d.add_field :kontroler, g['Kontroler']
  end

  datasheet.generate "./out/#{g['Model']}.odt"
  puts "Generated './out/#{g["Model"]}.odt'"
end
