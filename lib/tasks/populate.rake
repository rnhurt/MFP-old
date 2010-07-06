namespace :db do
  desc "Erase and fill database with test data"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Property, Location, Vehicle, Person, PersonLocation, Report, CallForService, Involvement].each(&:delete_all)

    puts 'Building Property records...'
    property_types = PropertyType.active.collect{|p| p.id}
    Property.populate 10 do |property|
      property.property_type_id = property_types
      property.value            = Faker.numerify(['###.##', '####.##', '#####.##'].rand)
      property.description      = Populator.words(5)
    end

    puts 'Building Location records...'
    kentucky = Region.find_by_code('KY')
    Location.populate 200 do |location|
      location.street_number  = Faker.numerify(['###', '####', '#####'].rand)
      location.street_name    = ['Oak St.', 'First St.', 'Main St.', 'Park St.', 'Dixie Hwy.', 'Fourth St.', '3rd St.']
      location.city           = 'Louisville'
      location.region_id      = kentucky
      location.postal_code    = Faker.numerify('402##') # Louisville, KY area (for map testing)
    end

    puts 'Building Vehicle records...'
    vehicle_makes   = VehicleMake.active.collect{|v| v.id}
    vehicle_models  = VehicleModel.active.collect{|v| v.id}
    vehicle_colors  = VehicleColor.active.collect{|v| v.id}
    Vehicle.populate 200 do |vehicle|
      vehicle.vin         = Faker.numerify('#################')
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

    puts 'Building PersonMaster/Person records...'
    eyecolors   = EyeColor.all.collect{|c| c.id}
    haircolors  = HairColor.all.collect{|c| c.id}
    races       = Race.all.collect{|r| r.id}
    genders     = Gender.all.collect{|g| g.id}
    regions     = Region.all.collect{|s| s.id}
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
        person.dob          = 120.years.ago.to_date..15.years.ago.to_date
        person.ssn          = Faker.numerify('###-##-####')
        person.gender_id    = gender
        person.race_id      = race
        person.height       = 100..500
        person.weight       = 50..500
        person.eye_color_id   = eyecolors
        person.hair_color_id  = haircolors
        person.ol_state_id  = regions
        person.ol_number    = Faker.numerify('#####-######')
        person.active       = ['T','T','T','T','T','T','F']

        person.created_at = 5.years.ago..Time.now
        person.updated_at = person.created_at
      end
    end


    puts 'Building PersonLocation records...'
    roles     = Role.address.active.collect{|l| l.id}
    people    = Person.all.collect{|l| l.id}
    locations = Location.all.collect{|l| l.id}
    PersonLocation.populate 2000 do |address|
      address.person_id   = people
      address.location_id = locations
      address.role_id     = roles
      address.phone_number= Faker.numerify('##########')
    end

    puts 'Building Offenses records...'
    offenses = Offense.active.collect{|l| l.id}
    Report.populate 200 do |report|
      report.number       = Faker.numerify('######-######')
      report.offense_id   = offenses
      report.location_id  = locations

      report.cleared_at     = 5.years.ago..5.days.ago
      report.arrived_at     = report.cleared_at - Faker.numerify('##').to_i.minutes
      report.dispatched_at  = report.arrived_at - Faker.numerify('#').to_i.hours
      report.narrative      = Populator.paragraphs(3)

      #      report.persons <<

      report.created_at = report.cleared_at + 5.hours
      report.updated_at = report.created_at
    end

    puts 'Building CFS records...'
    CallForService.populate 200 do |cfs|
      cfs.offense_id    = offenses
      cfs.cleared_at    = 5.years.ago..5.days.ago
      cfs.arrived_at    = cfs.cleared_at - Faker.numerify('##').to_i.minutes
      cfs.dispatched_at = cfs.arrived_at - Faker.numerify('#').to_i.hours
      cfs.narrative     = Populator.paragraphs(3)
      cfs.number        = Faker.numerify('C-##-###-' + cfs.dispatched_at.year.to_s)

      #      cfs.persons <<

      cfs.created_at = cfs.cleared_at + 5.hours
      cfs.updated_at = cfs.created_at
    end
    
    puts 'Building OfficerInvolvement records...'
    officers  = Officer.active.collect{|l| l.id}
    reports   = Report.all.collect{|l| l.id}
    roles     = Role.officer.active.collect{|l| l.id}
    OfficerInvolvement.populate 200 do |oi|
      oi.report_id    = reports
      oi.involved_id  = officers
      oi.role_id      = roles
    end

    puts 'Building VehicleInvolvement records...'
    vehicles  = Vehicle.all.collect{|l| l.id}
    statuses  = Status.active.collect{|l| l.id}
    VehicleInvolvement.populate 200 do |vi|
      vi.report_id    = reports
      vi.involved_id  = vehicles
      vi.role_id      = statuses
    end
  end
end