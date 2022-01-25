before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'adminuser' && password == '0307'
    end
  end
end