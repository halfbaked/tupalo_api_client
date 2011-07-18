class TupaloAPIClient
  LANGUAGE = 'en'

  include APISmith::Client
  base_uri 'http://tupalo.com/'
  endpoint '#{LANGUAGE}/api/easy/v1'
end
