# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :configure_permitted_parameters, only: [:create]
  before_action :customer_state, only: [:create]
  
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
  # カラムを許可するための記述
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end
  
  # 顧客ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    customers_mypage_path  #任意パスに変更
  end

  # 顧客ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path #任意パスに変更
  end
  
private
# アクティブであるかを判断するメソッド
def customer_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  customer = Customer.find_by(email: params[:customer][:email])
  # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
  return if customer.nil?
  # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
  return unless customer.valid_password?(params[:customer][:password])

  # 【処理内容4】 アクティブでない会員に対する処理
  if customer.is_active == true
    # アクティブな場合の処理
    # 例: ユーザーを認証し、アクティブな会員である場合に何らかのアクションを実行
    def create
       super
    end
  else
    # アクティブでない場合の処理
    # 例: 新規登録ページにリダイレクト
    flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
    redirect_to new_customer_registration_path
  end
  
  
  
  
end 
end 