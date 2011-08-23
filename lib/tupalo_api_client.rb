require 'api_smith'
require 'uri'

require 'tupalo_api_client/spot'
require 'tupalo_api_client/review'
require 'tupalo_api_client/review_widget'
require 'tupalo_api_client/match'
require 'tupalo_api_client/import'

require 'tupalo_api_client/errors'

class TupaloApiClient

  include APISmith::Client
  include TupaloApiErrors

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
  rescue Errno::ETIMEDOUT
    []
  end

  def spot_details(opts={})
    get("spot/#{parameterize(opts)}", :transform => Spot)
  rescue Errno::ETIMEDOUT
    []
  end

  def review_widget(opts={})
    get("review_widget/#{parameterize(opts)}", :transform => ReviewWidget)
  rescue Errno::ETIMEDOUT
    ''
  end

  def match(opts={})
    transform = opts.has_key?(:spot_id) ? Match : Import
    get("match/#{parameterize(opts)}", :transform => transform)
  end

  private

  def parameterize(params)
    "?#{URI.escape(params.map{|k,v| "#{k}=#{v}"}.join('&'))}"
  end

  def check_response_errors(response)
    if response.code.to_s =~ /^(4|5)/
      raise $1 == "4" ?
        ClientError.new(response.headers["status"]) :
        ServerError.new(response.headers["status"])
    end
  end

end
