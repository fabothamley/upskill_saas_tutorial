class ProfilesController < ApplicationController
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  #POST	to /users/:user_id/profile
  def create
    # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile updated!"
      #if ok go to home page
      redirect_to user_path( params[:user_id] )
    else
      #if update failed show the blank form again
      render action: :new
    end
  end

  #whitelist form variables
  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end