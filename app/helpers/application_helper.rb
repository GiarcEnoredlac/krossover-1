module ApplicationHelper

	def which_user_signed_in?
		if signed_in?
			if current_user
				current_user.email
			elsif current_admin
				current_admin.email
			end
		end
	end

end
