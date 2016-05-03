module Sendle
  module Api
    PLAN_EASY = 'easy'
    PLAN_PREMIUM = 'premium'
    PLAN_PRO = 'pro'
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

