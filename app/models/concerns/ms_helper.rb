module MsHelper
  include MessengerHelper

  def self.send_wellcome_message
    title = 'Chào bạn, Mình là đầu bếp ảo KitFe. Mình xin phép được tư vấn cho bạn về menu và cách đặt hàng hôm nay. Chọn “Xem thực đơn” để được hỗ trợ bởi mình và “Tư vấn viên” trong trường hợp bạn cần gặp đội ngũ chăm sóc khách hàng.'
    buttons = [
      { type: "postback", title: "KitFe là gì", payload: MS_PAYLOAD[:intro__kitfe] },
      { type: "postback", title: "Xem thực đơn", payload: MS_PAYLOAD[:intro__begin] },
      { type: "postback", title: "Gặp tư vấn", payload: MS_PAYLOAD[:intro__assistance] }
    ]
    return MessengerHelper.getJsonWithButton(title, buttons)
  end 

  def self.send_district(sender)
    # Gởi lần 1
    title = 'Bạn đang ở quận nào ?'
    buttons = [
      { type: "postback", title: MS_DISTRICT[:HaiBaTrung][:name], payload: MS_DISTRICT[:HaiBaTrung][:payload] },
      { type: "postback", title: MS_DISTRICT[:HoanKiem][:name], payload: MS_DISTRICT[:HoanKiem][:payload] },
      { type: "postback", title: MS_DISTRICT[:DongDa][:name], payload: MS_DISTRICT[:DongDa][:payload] }
    ]
    MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))

    # Gởi lần 2
    title = 'Hay là ?'
    buttons = [
      { type: "postback", title: MS_DISTRICT[:CauGiay][:name], payload: MS_DISTRICT[:CauGiay][:payload] },
      { type: "postback", title: MS_DISTRICT[:BaDinh][:name], payload: MS_DISTRICT[:BaDinh][:payload] },
      { type: "postback", title: MS_DISTRICT[:TrungHoaYenHoa][:name], payload: MS_DISTRICT[:TrungHoaYenHoa][:payload] }
    ]
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
  end

  # -------------------------------
  # Chọn loại món

  def self.send_select_type_food(sender)
    title = 'Bạn muốn ăn cơm với gì ?'
    buttons = [
      { type: "postback", title: "Với thịt bò", payload: MS_PAYLOAD[:type_menu__bo] },
      { type: "postback", title: "Với thịt gà", payload: MS_PAYLOAD[:type_menu__ga] },
      { type: "postback", title: "Khác", payload: MS_PAYLOAD[:type_menu__more] }
    ]
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
  end

  def self.send_select_type_food_more(sender)
    title = 'Một số lựa chọn khác'
    buttons = [
      { type: "postback", title: "Với thịt lợn", payload: MS_PAYLOAD[:type_menu__lon] },
      { type: "postback", title: "Với thịt cá", payload: MS_PAYLOAD[:type_menu__ca] }
    ]
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
  end

  # -------------------------------
  # Chọn tầm giá

  def self.send_type_price(sender)
    title = 'Bạn muốn ăn trong tầm giá bao nhiêu ?'
    buttons = [
      { type: "postback", title: "Dưới 55k", payload: MS_PAYLOAD[:type_price__over_55] },
      { type: "postback", title: "Trên 55k", payload: MS_PAYLOAD[:type_price__below_55] }
    ]
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
  end

  # ------------------------------- 
  # Thay đổi
  def self.send_menu_change(sender)
    title = 'Bạn có muốn thay đổi giá hoặc thay đổi loại món ăn ?'

    # Đổi giá
    change_price = "Xem món dưới 55k" if MsHelper.store_get(sender, "type_price") == "over_55"
    change_price = "Xem món trên 55k" if MsHelper.store_get(sender, "type_price") == "below_55"

    # Đổi món
    change_type_food = "Không ăn " + MsHelper.store_get(sender, "type_food") + " nữa"

    buttons = [
      { type: "postback", title: "Đổi giá", payload: MS_PAYLOAD[:menu__change_price] },
      { type: "postback", title: "Chọn thực đơn khác", payload: MS_PAYLOAD[:menu__change_type_food] }
    ]
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
  end

  # -------------------------------
  # Thực đơn

  def self.send_menu(sender)
    # Thông tin query    
    district = MsHelper.store_get(sender, "district")
    if district.present?
      district = eval(district)
      district_id = district[:id].to_i
    end

    type_food = MsHelper.store_get(sender, "type_food")
    type_price = MsHelper.store_get(sender, "type_price")

    # Lấy offset query và tự động tăng
    offset = MsHelper.store_get(sender, 'offset')
    if offset.to_i > 0
      offset = offset.to_i + 5
    end

    if offset.nil?
      offset = 0      
    end
    MsHelper.store_set(sender, 'offset', offset)

    foods = [
      {:name => "Ba chỉ rang cháy cạnh", :price => "55.000 VND", :image => "https://cdn.shopify.com/s/files/1/1262/1845/products/Ba_ch_rang_chay_c_nh.jpg?v=1461385051"},
      {:name => "Bê xào sả ớt", :price => "60.000 VND", :image => "https://cdn.shopify.com/s/files/1/1262/1845/products/Be_xao_x_t.jpg?v=1461383603"},
      {:name => "Cá chiên sốt cà", :price => "65.000 VND", :image => "https://cdn.shopify.com/s/files/1/1262/1845/products/Ca_chien_s_t_ca.jpg?v=1461383836"},
      {:name => "Cơm sườn non nướng tảng", :price => "55.000 VND", :image => "https://cdn.shopify.com/s/files/1/1262/1845/products/S_n_non_n_ng_t_ng.jpg?v=1461383096"}
    ]


    # Xử lý xem nên hiển thị những button nào theo các món
    # 

    elements = []    
    foods.each do |value|
      elements.push(MessengerHelper.getJsonWithFood(value))
    end

    result = {
      attachment: {
        type: "template",
        payload: {
          template_type: "generic",
          elements: elements
        }
      }
    } 
    return MessengerHelper.sendMessage(sender, result)
  end

  # -----------------------------------------------------
  # Redis Helper
  # -----------------------------------------------------

  def self.store_get(sender, key)
    key = sender.to_s + key
    $redis.get(key)
  end

  def self.store_set(sender, key, value)
    key = sender.to_s + key
    $redis.set(key, value)
  end

end