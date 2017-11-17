class RequestMailer < ApplicationMailer

  def request_mail(eui, button)
    @eui = eui
    @button = button
    mail(from: 'teambox@oxon.ch', to: 'teambox@oxon.ch', subject: 'Button wurde gedrückt')
  end

end
