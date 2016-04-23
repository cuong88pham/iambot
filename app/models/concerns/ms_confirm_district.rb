# Bạn phải bạn đang ở quận xxx ?
module MsConfirmDistrict
  include MessengerHelper
  include MsIntro
  include MsHelper

  def self.yes(sender)
    return MsHelper.send_select_type_food(sender)
  end

  def self.no(sender)
    # Gởi cho user thông tin chọn quận
    return MsHelper.send_district(sender)
  end
end