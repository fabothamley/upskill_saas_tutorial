class Users::RegistrationsController < Devise::RegistrationsController
  # extend devise gem default behaviour so that users signing up 
  # with pro account plan id 2
  # save witha  special striupe subscription funtion
  # otherwise signup as usual
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end
