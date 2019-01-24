class ContactMailer < ApplicationMailer
    def send_contact_mailer
       @name = params[:name]
       @phone = params[:phone]
       @email = params[:email]
       @message = params[:message]
        mail(to: "7sightjr@gmail.com", subject: 'Novo Contato - 7Sight')
    end
end
