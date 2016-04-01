class SubscriptionsController < ApplicationController
  require "stripe"

  def plans
    @plan = Stripe::Plan.retrieve("premium")
  end

  def subscription_checkout
    plan_id = params[:plan_id]
    plan = Stripe::Plan.retrieve(plan_id)
    #This should be created on signup.
    customer = Stripe::Customer.create(
        :description => "Customer for test@example.com",
        :source => params[:stripeToken],
        :email => "test@example.com"
      )
    # Save this in your DB and associate with the user;s email
    stripe_subscription = customer.subscriptions.create(:plan => plan.id)

    flash[:notice] = "Successfully created a charge"
    redirect_to '/plans'
  end

end