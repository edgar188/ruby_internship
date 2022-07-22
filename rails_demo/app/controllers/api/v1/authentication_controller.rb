class Api::V1::AuthenticationController < Api::V1::ApplicationController

  def registration
    user = User.new(login_params)

    unless user.save
      return render json: { errors: user.errors.full_messages }, status: :bad_request
    end

    token = encode_token({ user_id: user.id })
    render json: { email: user.email, token: token }, status: :created
  end

  def auth
    user = User.find_by_email(params[:email])

    unless user.present? && user.valid_password?(params[:password])
      return render json: { errors: I18n.t(:invalid_email_or_password) }, status: :unauthorized
    end

    token = encode_token({ user_id: user.id })
    render json: { email: user.email, token: token }, status: :ok
  end

  def admin_auth
    admin = AdminUser.find_by_email(params[:email])

    unless admin && admin&.valid_password?(params[:password])
      return render json: { errors: I18n.t(:invalid_email_or_password) }, status: :unauthorized
    end

    token = encode_token({ admin_id: admin.id })
    render json: { email: admin.email, token: token }, status: :ok
  end

  private

  def login_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end