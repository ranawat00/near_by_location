class LocateController < ApplicationController
  def index
    @country = request.location.city
  end
end
