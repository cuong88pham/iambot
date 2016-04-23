# Bạn muốn ăn trong tầm giá bao nhiêu
module MsTypePrice
  include MessengerHelper
  include MsHelper

  def self.over_55(sender)
    MsHelper.store_set(sender, "type_price", "over_55")    

    MsHelper.store_set(sender, "offset", 0)
    
    # Gởi menu
    return MsHelper.send_menu(sender)
  end

  def self.below_55(sender)
    MsHelper.store_set(sender, "type_price", "below_55")

    MsHelper.store_set(sender, "offset", 0)

    # Gởi menu
    return MsHelper.send_menu(sender)
  end
end