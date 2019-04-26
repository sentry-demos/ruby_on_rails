$Inventory = { 
    "nails": 1 ,
    "wrench": 1,
    "hammer": 1
}

class CheckoutController < ApplicationController
    def process_order(cart)
        tempInventory = $Inventory

        cart.each do |item, value|
            itemIdSymbol = item['id'].parameterize.underscore.to_sym

            if ($Inventory[itemIdSymbol] == 0)
                raise Exception.new "Not enough inventory for " + item['id']
            else
                tempInventory[itemIdSymbol] -= 1
                puts 'Success: ' + item['id'] + ' was purchased, remaining stock is ' + tempInventory[itemIdSymbol].to_s
            end
        end

        $Inventory = tempInventory
    end

    def cart

        order = JSON.parse request.body.read
        print "Processing order for: " + order["email"]
        cart = order["cart"]

        process_order(cart)

        render json: { "/cart": "OK"  }, status: :ok
    end
    
    def handled
        begin
            '2' + 2
        rescue Exception => exception
            Raven.capture_exception(exception)
            render json: { "/handled": exception.message  }, status: :ok
        end
    end
  
    def unhandled
      1 / 0 
    end
  
    private
  
  end
