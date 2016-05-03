module Sendle
  module Api
    PLAN_EASY = 'Easy'
    PLAN_PREMIUM = 'Premium'
    PLAN_PRO = 'Pro'
    PLANS = [ PLAN_EASY, PLAN_PREMIUM, PLAN_PRO ]

    ORDER_STATUS_PAYMENT = 'Payment'
    ORDER_STATUS_PICKUP = 'Pickup'
    ORDER_STATUS_IN_TRANSIT = 'In Transit'
    ORDER_STATUS_DELIVERED = 'Delivered'
    ORDER_STATUS_CANCELLED = 'Cancelled'
    ORDER_STATUSES = [ ORDER_STATUS_PAYMENT,
                       ORDER_STATUS_PICKUP,
                       ORDER_STATUS_IN_TRANSIT,
                       ORDER_STATUS_DELIVERED,
                       ORDER_STATUS_CANCELLED 
                      ]
  end
end

