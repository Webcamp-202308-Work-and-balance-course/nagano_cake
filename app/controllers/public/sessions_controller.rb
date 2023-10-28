# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  
  # サインアップ時に許可する追加のパラメーターを設定するために使用する↓
  #def configure_permitted_parameters
   # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  # 顧客ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    public_path  #任意パスに変更
  end

  # 顧客ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    new_customer_session_path #任意パスに変更
  end
  
  protected
  # 退会しているかを判断するメソッド
  def customer_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    # 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
      # 【処理内容3】is_active(会員ステータス)カラムの中身に応じて処理を分岐させることでアクティブでない（退会している）場合の処理を実装する
    end
  end
  
  
  
  
  
end
