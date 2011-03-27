namespace :db do
  desc "Erase and fill database with test data"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Property, Location, Vehicle, Person, Officer, PersonLocation,
      Report, CallForService,
      PersonInvolvement, OfficerInvolvement].each(&:delete_all)

    puts 'Building Officer records...'
    property_types = PropertyType.active.collect{|p| p.id}
    Officer.populate 10 do |officer|
      officer.first_name  = Faker::Name.first_name
      officer.last_name   = Faker::Name.last_name
      officer.badge_number= 'B101-' + officer.last_name
      officer.login       = Faker::Internet.user_name
      officer.email       = Faker::Internet.email
      officer.login_count = 10..1000
      officer.failed_login_count = 0..5
      officer.active      = [true, true, true, true, true, false]

      salt = Authlogic::Random.hex_token
      officer.password_salt       = salt
      officer.crypted_password    = Authlogic::CryptoProviders::Sha512.encrypt(officer.last_name + salt)
      officer.persistence_token   = Authlogic::Random.friendly_token
      officer.single_access_token = Authlogic::Random.friendly_token
      officer.perishable_token    = Authlogic::Random.friendly_token
    end

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
    
    puts 'Building Report records...'
    offenses      = Offense.active.collect{|l| l.id}
    locations     = Location.all.collect{|l| l.id}
    person_roles  = Role.person.collect{|l| l.id}
    officer_roles = Role.officer.collect{|l| l.id}
    statuses      = Status.active.collect{|l| l.id}
    Report.populate 200 do |report|
      report.number       = Faker.numerify('######-######')
      report.offense_id   = offenses
      report.location_id  = locations

      report.cleared_at     = 5.years.ago..5.days.ago
      report.arrived_at     = report.cleared_at - Faker.numerify('##').to_i.minutes
      report.dispatched_at  = report.arrived_at - Faker.numerify('#').to_i.hours
      report.narrative      = Populator.paragraphs(3)

      report.created_at = report.cleared_at + 5.hours
      report.updated_at = report.created_at

      # Add people to the report
      current_id = 0
      people = Person.recent.collect{|l| l.id}
      PersonInvolvement.populate 1..10 do |pi|
        pi.report_id    = report.id
        people.shuffle!                       # Randomize the list of People ...
        pi.involved_id  = people.delete_at(0) # ...and remove one item from the list so we don't reuse it
        pi.role_id      = person_roles
        current_id      = pi.id
      end

      # Add officers to the report
      officers = Officer.all.collect{|l| l.id}
      OfficerInvolvement.populate 1..3 do |oi|
        current_id += current_id
        oi.id = current_id
        oi.report_id    = report.id
        officers.shuffle!                       # Randomize the list of Officers...
        oi.involved_id  = officers.delete_at(0) # ...and remove one item from the list so we don't reuse it
        oi.role_id      = officer_roles
      end

      # Add vehicles to the report
      vehicles = Vehicle.all.collect{|l| l.id}
      VehicleInvolvement.populate 1..5 do |vi|
        current_id += current_id
        vi.id = current_id
        vi.report_id    = report.id
        vehicles.shuffle!                       # Randomize the list of Vehicles...
        vi.involved_id  = vehicles.delete_at(0) # ...and remove one item from the list so we don't reuse it
        vi.role_id      = statuses
      end
    end

    puts 'Building CFS records...'
    CallForService.populate 200 do |cfs|
      cfs.offense_id    = offenses
      cfs.cleared_at    = 5.years.ago..5.days.ago
      cfs.arrived_at    = cfs.cleared_at - Faker.numerify('##').to_i.minutes
      cfs.dispatched_at = cfs.arrived_at - Faker.numerify('#').to_i.hours
      cfs.narrative     = Populator.paragraphs(3)
      cfs.number        = Faker.numerify('C-##-###-' + cfs.dispatched_at.year.to_s)

      cfs.created_at = cfs.cleared_at + 5.hours
      cfs.updated_at = cfs.created_at

      # Add people to the CFS
      current_id = 0
      people = Person.recent.collect{|l| l.id}
      PersonInvolvement.populate 1..10 do |pi|
        pi.report_id    = cfs.id
        people.shuffle!                       # Randomize the list of People ...
        pi.involved_id  = people.delete_at(0) # ...and remove one item from the list so we don't reuse it
        pi.role_id      = person_roles
        current_id      = pi.id
      end

      # Add officers to the CFS
      officers = Officer.all.collect{|l| l.id}
      OfficerInvolvement.populate 1..3 do |oi|
        current_id += current_id
        oi.id = current_id
        oi.report_id    = cfs.id
        officers.shuffle!                       # Randomize the list of Officers...
        oi.involved_id  = officers.delete_at(0) # ...and remove one item from the list so we don't reuse it
        oi.role_id      = officer_roles
      end

      #      # Add vehicles to the CFS
      #      vehicles = Vehicle.all.collect{|l| l.id}
      #      VehicleInvolvement.populate 1..5 do |vi|
      #        current_id += current_id
      #        vi.id = current_id
      #        vi.report_id    = cfs.id
      #        vehicles.shuffle!                       # Randomize the list of Vehicles...
      #        vi.involved_id  = vehicles.delete_at(0) # ...and remove one item from the list so we don't reuse it
      #        vi.role_id      = statuses
      #      end
    end
  end
end