$Inventory = { 
    "nails": 1 ,
    "wrench": 1,
    "hammer": 1
}

class CheckoutController < ApplicationController
    def process_order(cart)
        Sentry.with_scope do |scope|
            scope.set_extra("inventory", $Inventory)
        end
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
        print "Processing order for: " + order["email"] + "\n"
        cart = order["cart"]
        process_order(cart)

        render json: { "/cart": "OK"  }, status: :ok
    end
    
    def handled
        begin
            '2' + 3
        rescue Exception => exception
            Sentry.capture_exception(exception)
            render json: { "ERROR": exception.message  }, status: :ok
        end
    end
  
    def unhandled
      1 / 0 
    end
  
    private
  
  end
