class LocationsController < ApplicationController

    protect_from_forgery with: :null_session
    def index 
    end
    def fetch_location
        # debugger
        if params[:latitude].present? && params[:longitude].present? && params[:radius].present?
            user_latitude = params[:latitude].to_f
            user_longitude = params[:longitude].to_f
            radius = params[:radius].to_f

            nearby_users = User.where.not(latitude: nil, longitude: nil).select do |user|
                distance = haversine_distance(user_latitude, user_longitude, user.latitude, user.longitude)
                distance.present? && distance <= radius
            end
            render json: nearby_users.map { |user| { name: user.name, distance: haversine_distance(user_latitude, user_longitude, user.latitude, user.longitude) } }
        else
            render json: { error: "Invalid parameters" }, status: :unprocessable_entity
        end
    end
    

    private
 
    def haversine_distance(lat1, lon1, lat2, lon2)
        return nil if lat1.nil? || lon1.nil? || lat2.nil? || lon2.nil?
        r = 6371 
        dLat = (lat2 - lat1) * Math::PI / 180
        dLon = (lon2 - lon1) * Math::PI / 180
        a = Math.sin(dLat / 2) ** 2 + Math.cos(lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180) * Math.sin(dLon / 2) ** 2
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
        r * c 
    end


end
  