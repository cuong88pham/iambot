module MsTypeMenu
  include MessengerHelper
  include MsHelper

  def self.bo(sender)
    MsHelper.store_set(sender, "type_food", "bò")
    return MsHelper.send_type_price(sender)
  end

  def self.ga(sender)
    MsHelper.store_set(sender, "type_food", "gà")
    return MsHelper.send_type_price(sender)
  end

  def self.lon(sender)
    MsHelper.store_set(sender, "type_food", "HEO")
    return MsHelper.send_type_price(sender)
  end

  def self.ca(sender)
    MsHelper.store_set(sender, "type_food", "cá")
    return MsHelper.send_type_price(sender)
  end

  def self.more(sender)
    return MsHelper.send_select_type_food_more(sender)
  end
end