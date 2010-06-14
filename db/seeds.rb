# FIXME: Don't overwrite or change 'active' status on existing records

# Load STATE codes
puts '... NCIC State data...'
State.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICStateCodes.txt')) do |states|
  states.read.each_line do |state|
    value, code = state.chomp.split('|')
    State.create!(:code => code, :value => value, :active => true)
  end
end

# Load OFFENCE codes
puts '... NCIC OFFENCE codes...'
Offence.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICOffenseCodes.txt')) do |ocodes|
  ocodes.read.each_line do |ocode|
    code, value = ocode.chomp.split("|")
    Offence.create!(:code => code, :value => value, :active => true)
  end
end

# Load VEHICLE MAKE codes
puts '... NCIC VEHICLE MAKE codes...'
VehicleMake.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICVehicleMakeCodes.txt')) do |vcodes|
  vcodes.read.each_line do |vcode|
    code, value = vcode.chomp.split("|")
    VehicleMake.create!(:code => code, :value => value, :active => true)
  end
end

puts '... NCIC VEHICLE MODEL codes...'
VehicleModel.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICVehicleModelCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    VehicleModel.create!(:code => code, :value => value, :active => true)
  end
end

puts '... NCIC RACE codes...'
Race.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICRaceCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Race.create!(:code => code, :value => value, :active => true)
  end
end

puts '... NCIC EYE COLOR codes...'
EyeColor.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICEyeColorCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    EyeColor.create!(:code => code, :value => value, :active => true)
  end
end

puts '... NCIC HAIR COLOR codes...'
HairColor.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICHairColorCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    HairColor.create!(:code => code, :value => value, :active => true)
  end
end

puts '... NCIC VEHICLE COLOR codes...'
VehicleColor.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICVehicleColorCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    VehicleColor.create!(:code => code, :value => value, :active => true)
  end
end

puts '... NCIC GENDER codes...'
Gender.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICGenderCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    Gender.create!(:code => code, :value => value, :active => true)
  end
end
