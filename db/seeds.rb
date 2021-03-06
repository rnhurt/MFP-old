# FIXME: Don't overwrite or change 'active' status on existing records

# Load REGION codes
puts '... NCIC REGION data...'
Region.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICRegionCodes.txt')) do |states|
  states.read.each_line do |state|
    value, code = state.chomp.split('|')
    Region.create!(:code => code, :value => value, :active => true)
  end
end

# Load OFFENCE codes
puts '... NCIC OFFENSE codes...'
Offense.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICOffenseCodes.txt')) do |ocodes|
  ocodes.read.each_line do |ocode|
    code, value = ocode.chomp.split("|")
    Offense.create!(:code => code, :value => value, :active => true)
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

puts '... NCIC PROPERTY TYPE codes...'
PropertyType.delete_all
open(File.join(Rails.root, 'db', 'seeds', 'NCICPropertyTypeCodes.txt')) do |codes|
  codes.read.each_line do |code_line|
    code, value = code_line.chomp.split("|")
    PropertyType.create!(:code => code, :value => value, :active => true)
  end
end

puts '... Officer Roles ...'
Role.officer.delete_all
%w(Primary Secondary Backup).each do |role|
  Role.create!(:code => 'Officer', :value => role, :active => true)
end

puts '... Person Roles ...'
Role.person.delete_all
%w(Victim Witness Suspect Other).each do |role|
  Role.create!(:code => 'Person', :value => role, :active => true)
end

puts '... Address Roles ...'
Role.address.delete_all
%w(Home Work Office).each do |role|
  Role.create!(:code => 'Address', :value => role, :active => true)
end

puts '... Property Status ...'
Status.delete_all
%w(Stolen Recovered Seized Burned Destroyed Pawned Lost).each do |status|
  Status.create!(:value => status, :active => true)
end