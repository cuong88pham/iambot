module MsIntro
  extend MessengerHelper

  def self.intro(sender)
    title = "KitFe là một cách trải nghiệm ẩm thực đầy mới mẻ. Tận hưởng đồ ăn thức uống ngon lành, bổ dưỡng được chế biến tinh tế bởi những đầu bếp được lựa chọn kỹ từ KitFe.\n Hiện tại KitFe giao hàng trong các quận tại Hà Nội."
    MessengerHelper.sendMessage(sender, MessengerHelper.getJsonText(title))

    # Chờ 10s và gởi message tiếp theo
    sleep(5)

    title = "Bạn có muốn xem thực đơn hôm nay ?"
    buttons = [
      { type: "postback", title: "Có", payload: MS_PAYLOAD[:view_menu__yes] },
      { type: "postback", title: "Không", payload: MS_PAYLOAD[:view_menu__no] }
    ]
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
  end

  def self.begin(sender)    
    # Lấy thông tin district đã được lưu
    district = MsHelper.store_get(sender, "district")

    # Nếu user chưa chọn quận
    if district.blank?
      # Gởi cho user thông tin chọn quận
      MsHelper.send_district(sender)
    else
      district = eval(district)
      # Nếu user đã chọn quận
      title = "Có phải bạn đang ở quận #{district[:name]}"
      buttons = [
        { type: "postback", title: "Đúng rồi", payload: MS_PAYLOAD[:confirm_district__yes] },
        { type: "postback", title: "Quận khác", payload: MS_PAYLOAD[:confirm_district__no] }
      ]
      return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonWithButton(title, buttons))
    end
  end

  def self.assistance(sender)
    # Message 1
    title = "Mình đã gửi yêu cầu của bạn đến đội ngủ chăm sóc khách hàng. Xin đợi trong giây lát, sẽ có người liên lạc lại với bạn."
    MessengerHelper.sendMessage(sender, MessengerHelper.getJsonText(title))

    # Message 2
    title2 = 'Bạn cũng có thể đánh "kitfe" để xem thực đơn'
    return MessengerHelper.sendMessage(sender, MessengerHelper.getJsonText(title2))
  end
end