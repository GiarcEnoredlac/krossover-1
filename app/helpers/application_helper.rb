module ApplicationHelper

	def which_user_signed_in?
		if signed_in?
			if current_user
				current_user.full_name
			elsif current_admin
				current_admin.full_name
			end
		end
	end

end
