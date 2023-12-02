class ApplicationController < ActionController::Base
    
    protected

  def after_sign_out_path_for(resource_or_scope)
    # ログアウト後の遷移先を指定
    root_path
  end
end
