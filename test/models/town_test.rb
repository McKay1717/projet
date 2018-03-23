require 'test_helper'

class TownTest < ActiveSupport::TestCase
 # test "the truth" do
 #   assert true
 # end
 test "town validation does geocoding" do
   VCR.use_cassette("town_validation_geocoding") do
    belfort = Town.new
    belfort.town_name = 'belfort'
    assert belfort.valid?
    assert_equal(47.6379599, belfort.latitude)
    assert_equal(6.8628942, belfort.longitude)
  end
 end

 test "town does not exist" do
   unknown = Town.new
   unknown.town_name = 'MyString'
   assert !unknown.valid?
 end
end
