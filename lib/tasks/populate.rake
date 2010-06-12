namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Incident, Person, Vehicle, Location].each(&:delete_all)
    
    Incident.populate 200 do |incident|
      incident.number   = Faker.numerify('######-######')
      incident.cleared_at     = 5.years.ago..5.days.ago
      incident.arrived_at     = incident.cleared_at - 2.hours
      incident.dispatched_at  = incident.arrived_at - 1.hour
      incident.narrative      = Populator.paragraphs(3)
    
      incident.created_at = incident.cleared_at + 5.hours
      incident.updated_at = incident.created_at
    end
    
#    Location.populate 200 do |location|
#      location.street_number  = Faker.numerify('#####')
#      location.street_name    = Faker::Address.street_name
#      location.city           = Faker::Address.city
#      location.state          = Faker::Address.us_state_abbr
#      location.postal_code    = Faker::Address.zip_code
#    end
#    
    Vehicle.populate 200 do |vehicle|
      vehicle.vin  = Faker.numerify('###################')
      vehicle.make = ['FORD','AUDI','VOLK']
      vehicle.model= ['A4','SUPR']
      vehicle.year = 1901..Time.now.year + 1

      vehicle.created_at = 5.years.ago..Time.now
      vehicle.updated_at = vehicle.created_at
    end
    
    PersonMaster.populate 100 do |personmaster|
      # Create attributes that are stable between people
      last_name = Faker::Name.last_name
      gender    = ['M','M','M','M','F','F','O']
      race      = ['A','W']
      
      # Generate 'aliases' for this person
      Person.populate 1..10 do |person|
        person.person_master_id  = personmaster.id
        person.first_name = Faker::Name.first_name
        person.last_name  = last_name
        person.ssn        = Faker.numerify('###-##-####')
        person.gender     = gender
        person.race       = race
        person.height     = 100..500
        person.weight     = 50..500
        person.eyecolor   = ['BL','Y','BR']
        person.haircolor  = ['BL','Y','BR']
        person.ol_state   = Faker::Address.us_state_abbr
        person.ol_number  = Faker.numerify('#####-######')
        person.active     = ['T','T','T','T','T','T','F']
        
        person.created_at = 5.years.ago..Time.now
        person.updated_at = person.created_at
      end
    end
  end
end