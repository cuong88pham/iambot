module MsConfirmViewDrink
  include MessengerHelper
  include MsHelper

  def self.yes(sender)
    MsHelper.send_menu_drink(sender)
  end

  def self.no(sender)
    title = 'Chúc bạn sẽ có bữa trưa vui vẻ cùng KitFe. Nếu bạn muốn xem lại thực đơn, hãy đánh "kitfe" nhé'
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonText(title2))
  end
end