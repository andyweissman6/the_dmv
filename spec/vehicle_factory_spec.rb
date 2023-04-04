require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/registrant'
require './lib/facility'

RSpec.describe Vehicle do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "#Vehicle Factory" do
    it "exists" do 
      expect(@factory).to be_a(VehicleFactory)
    end
   
    it "is an array" do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Array)
    end
  end

  describe "#assigns data to created vehicles" do
    it "will get 'vin' data from database" do
      expect(@factory.create_vehicles(@wa_ev_registrations)[0].vin).to eq("WMEEJ9AA7E")
    end

    it "will get 'year' data from database" do
      expect(@factory.create_vehicles(@wa_ev_registrations)[0].year).to eq("2014")
    end

    it "will get 'make' data from database" do
      expect(@factory.create_vehicles(@wa_ev_registrations)[0].make).to eq("SMART")
    end

    it "will get 'model' data from database" do
      expect(@factory.create_vehicles(@wa_ev_registrations)[0].model).to eq("Fortwo Electric Drive")
    end
  end
end

  # :vin_1_10=>"WMEEJ9AA7E",
  # :dol_vehicle_id=>"349158127",
  # :model_year=>"2014",
  # :make=>"SMART",
  # :model=>"Fortwo Electric Drive",
  # :vehicle_primary_use=>"Passenger",
  # :electric_range=>"58",
  # :odometer_reading=>"0",
  # :odometer_code=>"Odometer reading is not collected at time of renewal",
  # :new_or_used_vehicle=>"Used",
  # :sale_price=>"0",
  # :base_msrp=>"0",
  # :transaction_type=>"Registration Renewal",
