Geocoder.configure(
  lookup: :nominatim,  
  api_key: 'AIzaSyDBc3eAAZHF2v4QnRcKGBDsx2UvCczi_p4',  
  timeout: 5,        
  units: :km, 
  use_https: true,
  language: :en,
  # ip_lookup: :maxmind, # IP lookup service for geocoding by IP

  # Raise exceptions when limits are hit
  # always_raise: [Geocoder::OverQueryLimitError],

  # Allow local IPs for development purposes
  # ip_addresses_allowed: ['127.0.0.1', '::1', 'localhost']  
)