# Bạn có muốn xem thực đơn hôm nay
module MsViewMenu
  include MessengerHelper
  include MsIntro  

  def self.yes(sender)
    MsIntro.begin(sender)
  end

  def self.no(sender)
    title = 'Khi nào muốn đặt món, hãy đánh "kitfe" để xem thực đơn bạn nhé !'
    MessengerHelper.sendMessage(sender, MessengerHelper.getJsonText(title))
  end
end