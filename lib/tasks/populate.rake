namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Property, Location, Vehicle, Person, Report].each(&:delete_all)

    property_types = PropertyType.active.collect{|p| p.id}
    
    Property.populate 10 do |property|
      property.property_type_id = property_types
      property.value            = Faker.numerify(['###.##', '####.##', '#####.##'].rand)
      property.description      = Populator.words(5)
    end
    
    Location.populate 200 do |location|
      location.street_number  = Faker.numerify(['###', '####', '#####'].rand)
      location.street_name    = ['Oak St.', 'First St.', 'Main St.', 'Park St.', 'Dixie Hwy.', 'Fourth St.', '3rd St.']
      location.city           = 'Louisville'
      location.state          = 'KY'
      location.postal_code    = Faker.numerify('402##') # Louisville, KY area (for map testing)
    end

    vehicle_makes   = VehicleMake.active.collect{|v| v.id}
    vehicle_models  = VehicleModel.active.collect{|v| v.id}
    vehicle_colors  = VehicleColor.active.collect{|v| v.id}

    Vehicle.populate 200 do |vehicle|
      vehicle.vin         = Faker.numerify('###################')
      vehicle.vehicle_make_id     = vehicle_makes
      vehicle.vehicle_model_id    = vehicle_models
      vehicle.vehicle_color_id    = vehicle_colors
      vehicle.year        = 1901..Time.now.year + 1
      vehicle.reg_number  = Faker.numerify('###-###')
      vehicle.reg_state   = Faker::Address.us_state_abbr
      vehicle.description = Populator.words(5)

      vehicle.active      = ['T','T','T','T','T','T','F']

      vehicle.created_at = 5.years.ago..Time.now
      vehicle.updated_at = vehicle.created_at
    end

    eyecolors   = EyeColor.all.collect{|c| c.id}
    haircolors  = HairColor.all.collect{|c| c.id}
    races       = Race.all.collect{|r| r.id}
    genders     = Gender.all.collect{|g| g.id}
    states      = State.all.collect{|s| s.id}

    PersonMaster.populate 100 do |personmaster|
      # Create attributes that are stable between 'aliases'
      last_name = Faker::Name.last_name
      gender    = genders
      race      = races

      # Generate 'aliases' for this person
      Person.populate 1..10 do |person|
        person.person_master_id  = personmaster.id
        person.first_name   = Faker::Name.first_name
        person.middle_name  = Faker::Name.first_name
        person.last_name    = last_name
        person.ssn          = Faker.numerify('###-##-####')
        person.gender_id    = gender
        person.race_id      = race
        person.height       = 100..500
        person.weight       = 50..500
        person.eyecolor_id  = eyecolors
        person.haircolor_id = haircolors
        person.ol_state_id  = states
        person.ol_number    = Faker.numerify('#####-######')
        person.active       = ['T','T','T','T','T','T','F']

        person.created_at = 5.years.ago..Time.now
        person.updated_at = person.created_at
      end
    end

    #    offences = Offence.all.collect{|c| c.id}
    offences = %w(279 303 327 206 213 123 148 179 188)
    locations = Location.all.collect{|l| l.id}

    Report.populate 200 do |report|
      report.number       = Faker.numerify('######-######')
      report.offence_id   = offences
      report.location_id  = locations

      report.cleared_at     = 5.years.ago..5.days.ago
      report.arrived_at     = report.cleared_at - 2.hours
      report.dispatched_at  = report.arrived_at - 1.hour
      report.narrative      = Populator.paragraphs(3)

      report.created_at = report.cleared_at + 5.hours
      report.updated_at = report.created_at
    end
 
  end
end