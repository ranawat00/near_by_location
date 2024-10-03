class Api::AppointmentsController < ApplicationController
    # before_action :set_appointment, only: [:show]
    before_action :set_user
    skip_before_action :verify_authenticity_token, only: [:create,:update]


    def create
        @appointment = @user.appointments.build(appointment_params)
    
        if @appointment.save
          render json: @appointment, status: :created
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
    end

    def index
      @appointments = @user.appointments.all
      render json: @appointments
    end

    def show
      @appointment = @user.appointments.find(params[:id])
      render json: @appointment
    end

    def update
      @appointment = @user.appointments.find(params[:id])
      if @appointment.update(appointment_params)
        render json: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end

    

    private

    # def set_appointment
    #   @appointment = @user.appointments.find(params[:id])
    # end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def appointment_params
      params.require(:appointment).permit(:salon_name, :appointment_date, :service)
    end
end
