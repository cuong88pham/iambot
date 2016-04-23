module MessengerHelper  

  #  ----------------------------------------------------------
  #  Facebook Helper
  #  ----------------------------------------------------------

  def self.sendMessage(sender, message) 

    access_token = "CAAI45Tkmg58BACZCKWsmooQ8ZBjXDUF1oVds7O6Hfa4PUpeZB6qDJ2C4ufYIQXaZCDPxPRZBZA6S9JPdkXJvzE2ecE1J5luaCEZCPQeKirm1zZCKBd4qOqQe234m4CIKPfNbf0SadWp5MYSNobrHjTFChYMyILOhL12x3Q1CZCkZCdsjUGx73igVu1YO3wZAUXqpXgZD"
    puts "https://graph.facebook.com/v2.6/me/messages?access_token=#{access_token}"
    body = { :recipient => { :id => sender }, :message => message }.to_json
    puts body

    @result = HTTParty.post("https://graph.facebook.com/v2.6/me/messages?access_token=#{access_token}", {
      :body => body,
      :headers => { 'Content-Type' => 'application/json' }})

    puts '-----------------------------------------'
    puts @result
    puts '-----------------------------------------'

    if @result["error"].blank?
      return true
    end
    return false
  end
  
  #  ----------------------------------------------------------
  #  JSON BUILDER
  #  ----------------------------------------------------------

  def self.getJsonText(text)
    return { text: text }
  end

  def self.getJsonWithButton(text, buttons)    
    result = {
      attachment: {
        type: "template",
        payload: {
          template_type: "button",
          text: text,
          buttons: buttons
        }
      }
    }
    return result
  end

  def self.getJsonWithFood(food)

    buttons= [
      { type: "web_url", url: "https://checkout.shopify.com/10004832/checkouts/5b02bae9fb27f67b9e48a049abc8d79b?channel=facebook", title: "Mua" },
      { type: "postback", title: "Xem thêm", payload: MS_PAYLOAD[:menu__other] }      
    ]

    result = {
      title: food[:name],
      image_url: food[:image],
      subtitle: food[:price],
      buttons: buttons
    } 
    return result
  end

end