class Users::RegistrationsController < Devise::RegistrationsController
	# skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
	# prepend_before_action :authenticate_scope!, only: [:new, :create, :cancel]

	def create
    @user = build_resource # Needed for Merit
    super
  end

  def update
    @user = resource # Needed for Merit
    super
  end
end