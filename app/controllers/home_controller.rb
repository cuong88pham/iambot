class HomeController < ShopifyApp::AuthenticatedController
  layout 'application'
  def index

    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

    @template = {
      template_food: {
        view_menus: {
          message: 'Bạn có muốn xem thực đơn hôm nay không?',
          buttons:{
            first_view_menu: {
              title: 'Có',
              type: 'show_location',
              trigger: 'show_location',
              display: true
            },
            second_view_menu: {
              title: 'Không',
              type: 'show_message',
              trigger: 'meet_human',
              display: true
            }
          }
        },
        show_product: {
          data: {
            'com_voi_bo': {
                products:[
                  {
                    id: 1,
                    name: 'Product 1',
                    image: 'http://image.kitfe.com/production/foods/2016/03/72_large_1459347125.jpg?1459347125',
                    checkout_link: 'http://api.kitfe.com/foods?region_id=2',
                    price: '10000'
                  },
                  {
                    id: 2,
                    name: 'Product 2',
                    image: 'http://image.kitfe.com/production/foods/2016/03/72_large_1459347125.jpg?1459347125',
                    checkout_link: 'http://api.kitfe.com/foods?region_id=2',
                    price: '10000'
                  },
                  {
                    id: 3,
                    name: 'Product 3',
                    image: 'http://image.kitfe.com/production/foods/2016/03/72_large_1459347125.jpg?1459347125',
                    checkout_link: 'http://api.kitfe.com/foods?region_id=2',
                    price: '10000'
                  }
                ]
              },
          }
        },
        show_filter: {
          data: {
            message: 'Bạn muốn ăn cơm với gì',
            buttons:{
              first_show_filter: {
                title: 'Cơm với bò',
                slug: 'com_voi_bo',
                type: 'show_product',
                trigger: 'show_product',
                display: true
              },
              second_show_filter: {
                title: 'Cơm với gà',
                slug: 'com_voi_ga',
                type: 'show_product',
                trigger: 'show_product',
                display: true
              },
              thirt_show_filter: {
              title: 'Khác',
              slug: 'khac',
              type: 'show_filter',
              trigger: 'show_product',
              display: true
            }
          }
        }
        },
        show_location: {
          message: 'Bạn đang ở quận nào',
          buttons:{
            first_show_location: {
              title: 'Hai Bà Trưng',
              type: 'show_filter',
              trigger: 'show_filter',
              display: true
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
              data: {
                trigger: 'show_location'
              },
              display: true
            },
            thirt: {
              title: 'Gặp tư vấn',
              data: {trigger: 'meet_human'},
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
