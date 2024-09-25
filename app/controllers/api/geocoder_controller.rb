class Api::GeocoderController < ApplicationController
    def geocode
      address = params[:address]
      if address.blank?
        render json: { error: 'Address parameter is required' }, status: :bad_request
        return
      end
  
      begin
        url = "https://nominatim.openstreetmap.org/search?q=#{URI.encode_www_form_component(address)}&format=json"
        response = HTTParty.get(url)
  
        if response.success? && response.any?
          render json: response, status: :ok
        else
          render json: { error: 'No results found' }, status: :not_found
        end
      rescue StandardError => e
        render json: { error: "Geocoding service error: #{e.message}" }, status: :internal_server_error
      end
    end
  end
  