# This file contains descriptions of all your stripe plans

# Example
# Stripe::Plans::PREMIUM #=> 'primo'

Stripe.plan :premium do |plan|

  # plan name as it will appear on credit card statements
  plan.name = 'Playt Premium'

  # amount in cents. This is 6.99
  plan.amount = 500

  # currency to use for the plan (default 'usd')
  plan.currency = 'usd'

  # interval must be either 'week', 'month' or 'year'
  plan.interval = 'month'

  # only bill once every one months (default 1)
  plan.interval_count = 1

  # number of days before charging customer's card (default 0)
  plan.trial_period_days = 7
end

# Once you have your plans defined, you can run
#
#   rake stripe:prepare
#
# This will export any new plans to stripe.com so that you can
# begin using them in your API calls.
