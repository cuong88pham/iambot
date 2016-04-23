# Sau khi user chọn 1 quận
module MsDistrict
  include MessengerHelper

  def self.HaiBaTrung(sender)
    # Store thông tin
    value = {:name => MS_DISTRICT[:HaiBaTrung][:name], :id => MS_DISTRICT[:HaiBaTrung][:id]}
    MsHelper.store_set(sender, "district", value)    

    # Chọn món
    return MsHelper.send_select_type_food(sender)
  end

  def self.HoanKiem(sender)
    # Store thông tin
    value = {:name => MS_DISTRICT[:HoanKiem][:name], :id => MS_DISTRICT[:HoanKiem][:id]}
    MsHelper.store_set(sender, "district", value)    

    return MsHelper.send_select_type_food(sender)
  end

  def self.DongDa(sender)
    # Store thông tin
    value = {:name => MS_DISTRICT[:DongDa][:name], :id => MS_DISTRICT[:DongDa][:id]}
    MsHelper.store_set(sender, "district", value)    

    return MsHelper.send_select_type_food(sender)
  end

  def self.CauGiay(sender)
    # Store thông tin
    value = {:name => MS_DISTRICT[:CauGiay][:name], :id => MS_DISTRICT[:CauGiay][:id]}
    MsHelper.store_set(sender, "district", value)    

    return MsHelper.send_select_type_food(sender)
  end

  def self.BaDinh(sender)
    # Store thông tin
    value = {:name => MS_DISTRICT[:BaDinh][:name], :id => MS_DISTRICT[:BaDinh][:id]}
    MsHelper.store_set(sender, "district", value)    

    return MsHelper.send_select_type_food(sender)
  end

  def self.TrungHoaYenHoa(sender)
    # Store thông tin
    value = {:name => MS_DISTRICT[:TrungHoaYenHoa][:name], :id => MS_DISTRICT[:TrungHoaYenHoa][:id]}
    MsHelper.store_set(sender, "district", value)    

    return MsHelper.send_select_type_food(sender)
  end
end