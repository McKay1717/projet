require 'test_helper'

class TownsControllerTest < ActionController::TestCase
  setup do
    @town = towns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:towns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create town" do
    VCR.use_cassette("town_should create") do
     assert_difference('Town.count') do
       post :create, town: { latitude: @town.latitude, longitude: @town.longitude, postcode: @town.postcode, town_name: @town.town_name }
     end

     assert_redirected_to town_path(assigns(:town))
   end
  end
 
 test "should not create town" do
    @town = towns(:empty)
    VCR.use_cassette("town_not_should") do
      assert_no_difference('Town.count') do
        post :create, town: { latitude: @town.latitude, longitude: @town.longitude, postcode: @town.postcode, town_name: @town.town_name }
      end
      assert_response :success
    end
 end

  test "should show town" do
   VCR.use_cassette("should_show_town") do
    get :show, id: @town
    assert_response :success
   end
  end

  test "should get edit" do
    get :edit, id: @town
    assert_response :success
  end

  test "should update town" do
    VCR.use_cassette("town_should_update") do
     patch :update, id: @town, town: { latitude: @town.latitude, longitude: @town.longitude, postcode: @town.postcode, town_name: @town.town_name }
     assert_redirected_to town_path(assigns(:town))
   end
  end

  test "should not update town" do
    VCR.use_cassette("town_bad_should_update") do
      @town = towns(:empty)
      patch :update, id: @town, town: { latitude: @town.latitude, longitude: @town.longitude, postcode: @town.postcode, town_name: @town.town_name }
      assert_response :success
    end
   end

  test "should destroy town" do
    assert_difference('Town.count', -1) do
      delete :destroy, id: @town
    end

    assert_redirected_to towns_path
  end
end
