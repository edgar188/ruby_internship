class Api::V1::AuthenticationController < Api::V1::ApplicationController
  before_action :authorized, only: [:authenticate]

  def registration
    user = User.new(login_params)

    if user.save
      token = encode_token({ user_id: user.id })
      render json: token.to_json
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def auth
    user = User.find_by_email(params[:email])

    if user && user.valid_password?(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }
    else
      render json: { errors: I18n.t(:invalid_email_or_password) }, status: :unauthorized
    end
  end

  def admin_auth
    admin = AdminUser.find_by_email(params[:email])
    
    if admin && admin.valid_password?(params[:password])
      token = encode_token({ admin_id: admin.id })
      render json: { admin: admin, token: token }
    else
      render json: { errors: I18n.t(:invalid_email_or_password) }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end