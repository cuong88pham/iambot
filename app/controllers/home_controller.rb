class HomeController < ShopifyApp::AuthenticatedController
  layout 'application'
  def index

    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

    @template = {
      template_food: {
        view_menus: {
          message: 'Bạn có muốn xem thực đơn hôm nay không?',
          buttons:{
            first: {
              title: 'Có',
              type: 'show_location',
              trigger: 'show_location',
              display: true
            },
            second: {
              title: 'Không',
              type: 'show_message',
              trigger: 'meet_human',
              display: true
            }
          }
        },
        show_filter: {
          data: {
            message: 'Bạn muốn ăn cơm với gì',
            buttons:{
              a: {
                title: 'Cơm với bò',
                type: 'show_product',
                trigger: 'show_product',
                display: true
              },
              b: {
                title: 'Cơm với gà',
                type: 'show_product',
                trigger: 'show_product',
                display: true
              },
              c: {
              title: 'Khác',
              type: 'show_filter',
              trigger: 'show_filter',
              display: true
            },
            d: {
              title: 'Cơm với thịt heo',
              type: 'show_product',
              trigger: 'show_product',
              display: true
            },
            e: {
              title: 'Cơm với cá',
              type: 'show_product',
              trigger: 'show_product',
              display: true
            }
          }
        }
        },

        show_location: {
          message: 'Bạn đang ở quận nào',
          buttons:{
            a: {
              title: 'Hai Bà Trưng',
              type: 'show_filter',
              trigger: 'show_filter',
              display: true
            },
            b: {
              title: 'Hoàn Kiếm',
              type: 'show_filter',
              trigger: 'show_filter',
              display: false
            },
            c: {
              title: 'Đống Đa',
              type: 'show_filter',
              trigger: 'show_filter',
              display: false
            },d: {
              title: 'Cầu Giấy',
              type: 'show_filter',
              trigger: 'show_filter',
              display: false
            },e: {
              title: 'Ba Đình',
              type: 'show_filter',
              trigger: 'show_filter',
              display: false
            },f: {
              title: 'Trung Hòa, Yên Hòa',
              type: 'show_filter',
              trigger: 'show_filter',
              display: false
            }
          }
        },
        view_cost: {
          data: [{
            name: 'Dưới 55k',
            condition: '55'
          },{
            name: 'Trên 55k',
            condition: '56'
          }]
        },
        meet_human: {
          message: 'Khi nào muốn đặt món, hãy đánh "kitfe" để xem thực đơn bạn nhé!'
        },
        wellcome_area: {
          message: 'Chào bạn, Mình là đầu bếp ảo KitFe. Mình xin phép được tư vấn cho bạn về menu và cách đặt hàng hôm nay. Chọn “Xem thực đơn” để được hỗ trợ bởi mình và “Tư vấn viên” trong trường hợp bạn cần gặp đội ngũ chăm sóc khách hàng.',
          buttons: {
            first: {
              title: 'KitFe là gì',
              type: 'show_message',
              display: true,
              data: {
                      message: 'KitFe là một cách trải nghiệm ẩm thực đầy mới mẻ. Tận hưởng đồ ăn thức uống ngon lành, bổ dưỡng được chế biến tinh tế bởi những đầu bếp được lựa chọn kỹ từ KitFe. Hiện tại KitFe giao hàng trong các quận tại Hà Nội.',
                      trigger: 'view_menus'
                    }
            },
            second: {
              title: 'Xem thực đơn',
              type: 'show_product',
              data: {},
              trigger: 'view_menus',
              display: true
            },
            thirt: {
              title: 'Gặp tư vấn',
              type: 'show_message',
              data: {},
              trigger: 'meet_human',
              display: true
            }
          }
        }
      }
    }

    render 'index'
  end

  def login
    render layout: 'login'
  end

  def products
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    render json: @products
  end

  def wellcome
    render layout: 'login'
  end

  def step2
    render 'text'
    type = ['new_message', 'exit_message', 'show_message', 'show_product', 'show_location']

  end
end
