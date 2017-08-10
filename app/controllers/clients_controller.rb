class ClientsController < ApplicationController

  expose :client

  before_action :init_client, only: :create

  def new
    client.build_login
  end

  def create
    if client.save
      client.login.send_reset_password_instructions
      redirect_to just_registered_path
      AdvisorMailer.notify_client_signed_up(client).deliver_now
    else
      render :new
    end
  end

  private

  def init_client
    if client_params[:postcode].blank?
      client.errors.add(:postcode, "can't be blank")
    elsif ward_mapit_code = HackneyWardFinder.new(client_params[:postcode]).lookup
      client.assign_team_leader(ward_mapit_code)
      client.login.generate_default_password
    else
      redirect_to :outside_hackney
    end
  end

  def client_params
    params.require(:client).permit(
      :title,
      :first_name,
      :last_name,
      :phone,
      :preferred_contact_method,
      :address_line_1,
      :address_line_2,
      :postcode,
      login_attributes: [ :email ]
      )
  end
end
