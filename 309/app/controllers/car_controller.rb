class CarController <ApplicationController
	def enter_login
		@user = CarShareMember.new
		render(:login) and return
	end

	def submit_login
		@user = CarShareMember.where(username: params["username"]).first
  	if @user != nil && @user.authenticate(params["password"])
    	session[:car_share_member_id] = @user.id
    	redirect_to "/reservations" and return
  	else
    	flash[:error] = "Unknown username or wrong password."
    	redirect_to "/login" and return
    end
  end

  def current_reservation
  	if session[:car_share_member_id] != nil
  		@user = CarShareMember.where(id: session[:car_share_member_id]).first
    	@car = Car.where(car_share_member_id: @user.id).first
    	render(:reservations) and return
  	else
    # If not, redirect to the login page.
    redirect_to "/login" and return
  	end
  end
	
	def make_reservation
		if params["logout"]
    	session.clear
    	redirect_to "/login" and return
 	 elsif params["return_this_car"]
	    car = Car.where(car_share_member_id: session[:car_share_member_id]).first
	    car.car_share_member_id = nil
	    car.save!
	    redirect_to "/reservations" and return
  	elsif params["reserve_this_car"] 
	    car = Car.where(id: params["reserve_this_car"]).first
	    car.car_share_member_id = session[:car_share_member_id]
	    car.save!
	    redirect_to "/reservations" and return
  	end
	end	
end