class OrderCreator
  def initialize(current_user)
    @current_user = current_user
  end
  
  def call
    order = create_order()
    order
  end

  protected
  
  # It's creating an order.
  def create_order
    ActiveRecord::Base.transaction do
      balance = @current_user.balance
      balance -= @current_user.user_items.with_not_ordered.total_price
      
      @current_user.user_items.with_not_ordered.each do |user_item|
        ordered_at = DateTime.now
        user_item.update!(ordered_at: ordered_at)
        @current_user.update!(balance: balance)
      end

    rescue ActiveRecord::RecordInvalid => exception
      raise ActiveRecord::Rollback
    end
  end
end