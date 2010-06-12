# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# Load STATE codes
puts '... NCIC State data...'
NcicCode.states.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICStateCodes.txt')) do |states|
  states.read.each_line do |state|
    value, code = state.chomp.split('|')
    NcicCode.create!(:code_type => 'State', :code => code, :value => value)
  end
end

# Load OFFENCE codes
puts '... NCIC OFFENCE codes...'
NcicCode.offences.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICOffenseCodes.txt')) do |ocodes|
  ocodes.read.each_line do |ocode|
    code, value = ocode.chomp.split("|")
    NcicCode.create!(:code_type => 'Offence', :code => code, :value => value)
  end
end

# Load VEHICLE MAKE codes
puts '... NCIC VEHICLE MAKE codes...'
NcicCode.vehicle_makes.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICVehicleMakeCodes.txt')) do |vcodes|
  vcodes.read.each_line do |vcode|
    code, value = vcode.chomp.split("|")
    NcicCode.create!(:code_type => 'VMake', :code => code, :value => value)
  end
end

puts '... NCIC VEHICLE MODEL codes...'
NcicCode.vehicle_models.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICVehicleModelCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    NcicCode.create!(:code_type => 'VModel', :code => code, :value => value)
  end
end

puts '... NCIC RACE codes...'
NcicCode.races.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICRaceCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    NcicCode.create!(:code_type => 'Race', :code => code, :value => value)
  end
end

puts '... NCIC EYE COLOR codes...'
NcicCode.eye_colors.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICEyeColorCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    NcicCode.create!(:code_type => 'EColor', :code => code, :value => value)
  end
end

puts '... NCIC HAIR COLOR codes...'
NcicCode.hair_colors.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICHairColorCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    NcicCode.create!(:code_type => 'HColor', :code => code, :value => value)
  end
end

puts '... NCIC VEHICLE COLOR codes...'
NcicCode.vehicle_colors.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICVehicleColorCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    NcicCode.create!(:code_type => 'VColor', :code => code, :value => value)
  end
end
