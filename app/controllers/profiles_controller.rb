class ProfilesController < ApplicationController

  def create
    @user = current_user
    @profile = Profile.find_by(user_id: current_user.id)
  end


  def show
    @user = current_user
    @profile = Profile.find_by(user_id: current_user.id)
  end

  # def edit
	# 	@profile = Profile.find(params)
	# 	if current_user.id != @profile.user_id
	# 		flash[:notice] = "Only owner can edit"
	# 		redirect_to '/'
	# 	else
	# 		render user_profile_path
	# 	end
	# end


	def update
    @user = current_user
    @profile = Profile.find_by(user_id: current_user.id)
		if current_user.id != @profile.user_id
			flash[:notice] = "Only owner can update"
			redirect_to '/'
		else
			@profile.update(profile_params)
			redirect_to user_profile_path
		end
	end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end

end
