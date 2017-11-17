class RequestMailer < ApplicationMailer

  def request_mail(eui, button)
    @eui = eui
    @button = button
    mail(from: 'teambox@oxon.ch', to: 'gg@oxon.ch', subject: 'Test Buttons')
  end

end
