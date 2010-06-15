namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Incident, Person, Vehicle, Location, Property].each(&:delete_all)

    Property.populate 10 do |property|



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
      vehicle.vin   = Faker.numerify('###################')
      vehicle.make  = vehicle_makes
      vehicle.model = vehicle_models
      vehicle.color = vehicle_colors
      vehicle.year  = 1901..Time.now.year + 1
      vehicle.reg_number  = Faker.numerify('###-###')
      vehicle.reg_state   = Faker::Address.us_state_abbr
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

    Incident.populate 200 do |incident|
      incident.number       = Faker.numerify('######-######')
      incident.offence_id   = offences
      incident.location_id  = locations

      incident.cleared_at     = 5.years.ago..5.days.ago
      incident.arrived_at     = incident.cleared_at - 2.hours
      incident.dispatched_at  = incident.arrived_at - 1.hour
      incident.narrative      = Populator.paragraphs(3)

      incident.created_at = incident.cleared_at + 5.hours
      incident.updated_at = incident.created_at
    end
 
  end
end