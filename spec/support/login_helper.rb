module LoginHelper

  def user_signup
    fill_in("user[name]", :with => "Amy Poehler")
    fill_in("user[height]", :with => "58")
    fill_in("user[happiness]", :with => "3")
    fill_in("user[nausea]", :with => "2")
    fill_in("user[tickets]", :with => "15")
    fill_in("user[password]", :with => "password")
    click_button('Create User')
  end

  def user_signout
    click_link('Log Out')
  end

  def user_login
    fill_in "user_name",:with => 'Mindy'
    fill_in("user_password", :with => "password")
    click_button('Login')
  end

  def admin_signup
    fill_in("user[name]", :with => "Walt Disney")
    fill_in("user[password]", :with => "password")
    find(:css, "#user_admin").set(true)
    click_button('Create User')
  end

  def admin_login
    fill_in("user_name", with: 'Walt Disney')
    fill_in("user_password", :with => "password")
    click_button('Login')
  end

  def create_standard_user
    @mindy = User.create(
      name: "Mindy",
      password: "password",
      happiness: 3,
      nausea: 2,
      tickets: 10,
      height: 50
      )
  end

  def create_standard_user_1
    @tommy = User.create(
      name: "Alex",
      password: 'alexpassword',
      happiness: 3,
      nausea: 4,
      tickets: 20,
      height: 48
    )
  end

  def create_standard_user_2
    @tommy = User.create(
      name: "Noah",
      password: 'noahpassword',
      happiness: 2,
      nausea: 4,
      tickets: 20,
      height: 56
    )
  end

  def create_standard_and_admin_user
    @mindy = User.create(
      name: "Mindy",
      password: "password",
      happiness: 3,
      nausea: 2,
      tickets: 10,
      height: 50
    )
    @walt = User.create(
      name: "Walt Disney",
      password: "password",
      admin: true
    )
  end

end
