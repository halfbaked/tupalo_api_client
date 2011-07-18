Gem::Specification.new do |s|
  s.name = 'tupalo_api_client'
  s.version = '1.0.0'
  s.authors = ['Michael Kohl', 'Andreas Tiefenthaler']
  s.email = ['michi@tupalo.com', 'andy@tupalo.com']
  s.summary = 'A convenient wrapper for the Tupalo.com API'
  s.homepage = 'https://github.com/tupalo/tupalo_api_client'
  s.require_paths = %w[lib lib/tupalo_api_client]
  s.files = %w[lib/tupalo_api_client.rb ./LICENSE ./README]
  s.add_dependency('api_smith', '~> 1.0.0')
  s.has_rdoc = false
end
