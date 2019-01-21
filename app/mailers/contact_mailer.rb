class ContactMailer < ApplicationMailer
    def send_contact_mailer
       @name = params[:name]
       @phone = params[:phone]
       @email = params[:email]
       @message = params[:message]
        mail(to: "7sight@gmail.com", subject: 'Novo Contato')
    end
end
