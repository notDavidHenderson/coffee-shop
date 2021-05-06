class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders
    # class method that returns a collection with all of the customer names
    def self.names
        all.map(&:name)
    end

    # instance method that takes in a coffee title and price and will create an order with that coffee and price
    def order_coffee (coffee_title, price )
        coffee = Coffee.find_by(title: coffee_title)
        Order.create(:price => price, :customer => self, :coffee => coffee)
    end

    # instance method that returns the cost of all of the Customer's coffee orders
    def total_purchases_amount
        # orders.pluck(:price).sum no active record
        orders.sum(:price) #active record method to sum
    end

    #instance method that takes in a coffee_title, finds the last order for that coffee and removes it.
    #puts` a message formatted like: `{customer name} has been refunded ${price}`

    def dislike_coffee (coffee_title)
        coffee_id = Coffee.find_by(title: coffee_title).id
        order = orders.select{ |o| o.coffee_id === coffee_id}.last.destroy
        puts "#{name} has been refunded #{order.price}"
    end   
end