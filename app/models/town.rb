class Town < ActiveRecord::Base
  before_validation :load_position
  validates :latitude, :longitude, presence: true
  
  private
  def load_position
    places = Nominatim.search(town_name).limit(1).first
    if places
      self.latitude = places.lat
      self.longitude = places.lon
    end
  end
  public
  def get_forecast
    if self.latitude && self.longitude
      forecast = ForecastIO.forecast(self.latitude,self.longitude, params: { units:'si', lang: 'fr' })
      if forecast
        return forecast.currently
      end
    end
    return nil
  end
end
