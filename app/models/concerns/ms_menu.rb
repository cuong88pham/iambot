module MsMenu
  include MessengerHelper

  def self.other(sender)

    # Đếm số lượt view more
    count_more = MsHelper.store_get(sender, "view_more")

    if count_more.to_i > 0
      count_more = count_more.to_i + 1
    else
      count_more = 1
    end

    MsHelper.store_set(sender, 'view_more', count_more)
    MsHelper.store_set(sender, 'offset', count_more * 5)

    MsHelper.send_menu(sender)

    # Hiển thị thay đổi menu
    if count_more == 4 
      MsHelper.send_menu_change(sender)
    end

    return true
  end

  def self.drink_other(sender)        
    MsHelper.send_menu_drink(sender)
  end  

  def self.change_price(sender)    
    MsHelper.store_set(sender, 'view_more', 1)
    MsHelper.store_set(sender, 'offset', 0)

    if MsHelper.store_get(sender, 'type_price') == 'over_55'
      MsHelper.store_set(sender, 'type_price', 'below_55')
    else
      MsHelper.store_set(sender, 'type_price', 'over_55')
    end

    MsHelper.send_menu(sender)
  end

  def self.change_type_food(sender)
    MsHelper.send_select_type_food(sender)
  end
end