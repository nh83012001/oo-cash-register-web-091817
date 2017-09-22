

class CashRegister
  attr_accessor :discount
  attr_reader :total, :items, :prices

 def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

 def total=(total)
    @total = total
  end

 def add_item(title, price, quantity = 1)
    if quantity > 1
      quantity.times do
        @items << title
        @prices << price
      end
      self.total += (price * quantity)
    else
      @items << title
      @prices << price
      self.total += (price * quantity)
    end
  end

 def apply_discount
    if @discount != nil
      @total = @total - (@total * @discount / 100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

 def items=(items)
    @items = items
  end

 def void_last_transaction
    @total -= @prices.last
  end
end
