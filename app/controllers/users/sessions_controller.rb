class Users::SessionsController < Devise::SessionsController
	# skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
	# prepend_before_action :authenticate_scope!, only: [:new, :create, :cancel]

	protected

	def sign_up(resource_name, resource)

	end
end