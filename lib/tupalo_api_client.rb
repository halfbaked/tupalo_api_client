require 'api_smith'
require 'uri'
require 'tupalo_api_client/spot'
require 'tupalo_api_client/review'

class TupaloAPIClient
  include APISmith::Client
  base_uri 'http://tupalo.com/'

  def initialize(opts = {})
    options = {
      :lang => 'en',
      :token => ''}.merge(opts)

    add_query_options! :token => options[:token] unless options[:token].empty?
    self.class.endpoint "#{options[:lang]}/api/easy/v1"

  end

  def spots(opts={})
    get("spots/#{parameterize(opts)}", :transform => Spot)
  end

  def spot_details(opts={})
    get("spot/#{parameterize(opts)}", :transform => Spot)
  end

  #token only
  def review_widget(opts={})
    get("review_widget/#{parameterize(opts)}", :transform => ReviewWidget)
  end

  #token only
  def match(opts={})
    #get("review_widget/#{parameterize(opts)}", :transform => ReviewWidget)
  end



  private

  def parameterize(params)
    "?#{URI.escape(params.map{|k,v| "#{k}=#{v}"}.join('&'))}"
  end

end
