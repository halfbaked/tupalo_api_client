require 'api_smith'

class TupaloAPIClient
  LANGUAGE = 'en'

  include APISmith::Client
  base_uri 'http://tupalo.com/'
  endpoint "#{LANGUAGE}/api/easy/v1"

  def spots(opts={})
    get(parameterize(opts), :transform => Spot)
  end

  def match(opts={})
  end


  private

  def parameterize(params)
    query = "?"
    query + URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&'))
  end

end
