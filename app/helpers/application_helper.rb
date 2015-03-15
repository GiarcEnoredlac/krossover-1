module ApplicationHelper

	def which_user_signed_in?
		if current_user?
			current_user.full_name
		# else
		# 	current_admin.full_name
		end
	end

end
