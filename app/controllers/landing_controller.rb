class LandingController < ApplicationController

    def index
    end

    def send_email
        ContactMailer.with(name: params[:name], phone: params[:phone], email: params[:email], message: params[:message]).send_contact_mailer.deliver_later
        redirect_to :root, notice: "Email enviado!"
    end
end
