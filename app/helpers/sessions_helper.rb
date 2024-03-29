module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		current_user = user
		Compare.new(:user_id => current_user.id).save
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
		unless signed_in?
			flash[:red]="Please sign in first!"
			redirect_to signin_path
		end
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		if current_user
			Compare.find_by_user_id(current_user.id).destroy
		end
		current_user = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
end
