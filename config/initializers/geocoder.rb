Geocoder.configure(
  lookup: :nominatim,  # or :google, :bing, etc., depending on your setup
#   api_key: ENV['AIzaSyDBc3eAAZHF2v4QnRcKGBDsx2UvCczi_p4'],  # if you are using an API that requires a key
  timeout: 5,         # timeout setting
  units: :km, 
  use_https: true,
  language: :en       # set to kilometers or miles
)