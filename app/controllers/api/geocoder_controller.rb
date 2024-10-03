class Api::GeocoderController < ApplicationController
  def geocode
    address = params[:address]
    
    if address.blank?
      render json: { error: 'Address parameter is required' }, status: :bad_request
      return
    end

    begin
      
      
      encoded_address = URI.encode_www_form_component(address)
   
      # Set the Nominatim URL
      url = "https://nominatim.openstreetmap.org/search?q=#{encoded_address}&format=json&limit=1"

      # Add custom headers, including the User-Agent
      headers = { "User-Agent" => "MyAppName/1.0 (your_email@example.com)" }

      # Make the request with the headers
      response = HTTParty.get(url, headers: headers)

      if response.success?
        data = JSON.parse(response.body)
        
        if data.any?
          render json: { latitude: data[0]["lat"], longitude: data[0]["lon"] }, status: :ok
        else
          render json: { error: 'No results found' }, status: :not_found
        end
      else
        render json: { error: 'Geocoding service unavailable' }, status: :service_unavailable
      end
    rescue StandardError => e
      render json: { error: "Geocoding service error: #{e.message}" }, status: :internal_server_error
    end
  end
end
