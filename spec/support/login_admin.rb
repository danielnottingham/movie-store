module LoginAdmin
  def login_admin(admin = Admin.create!(email: 'admin@gmail.com', password: '123456'))
    login_as admin
    admin
  end
end
