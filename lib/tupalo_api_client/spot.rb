class Spot < APISmith::Smash

  property :street
  property :state
  property :category
  property :website_url_formatted
  property :icon_url
  property :zip
  property :city
  property :rating, :transformer => :to_f
  property :google_maps_url
  property :country_code
  property :spot_id
  property :name
  property :latitude, :transformer => :to_f
  property :external_url
  property :longitude, :transformer => :to_f
  property :image_thumbnail_url

end

