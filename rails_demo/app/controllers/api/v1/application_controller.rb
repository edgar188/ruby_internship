class Api::V1::ApplicationController < ActionController::API

  before_action :authorized
  before_action :set_logged_in
  rescue_from ActiveRecord::RecordNotFound, with: :notfound

  private

  def encode_token(payload)
    JWT.encode(payload, 'mySuperSecretKey')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]

      begin
        JWT.decode(token, 'mySuperSecretKey', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by_id(user_id)
    end
  end

  def logged_in_admin
    if decoded_token
      admin_id = decoded_token[0]['admin_id']
      @admin = AdminUser.find_by_id(admin_id)
    end
  end

  def logged_in?
    !!logged_in_admin || !!logged_in_user
  end

  def authorized
    render json: { message: I18n.t(:not_logged_in) }, status: :unauthorized unless logged_in?
  end

  def set_logged_in
    logged_in = logged_in_user.present? ? logged_in_user : logged_in_admin
    ApplicationRecord.set_logged_in_user(logged_in)
  end

  def notfound
    render json: { error: I18n.t(:not_found) }, status: :not_found
  end

end