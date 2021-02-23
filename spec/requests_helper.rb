def login(user)
  post user_session_path, params: {
    user: {
      email: user.email, password: user.password
    }
  }
  follow_redirect!
end

def create_test_product
  product = Product.create(name: 'Salo', price: 130, quantity: 11)
  product.save!

  product
end

def create_few_products
  product = Product.create(name: 'Salo', price: 130, quantity: 11)
  product.save!

  product = Product.create(name: 'Salo2', price: 130, quantity: 11)
  product.save!

  product
end

def prepare_test_create
  user = create(:user)
  operator = create(:user, role: 2, email: 'operator@test.ru')
  login(user)
  product = create_few_products

  request = Request.new(status: Request::IN_PROGRESS, user: user,
                        operator: operator, product: product, quantity: 1)
  request.save!

  product.quantity = product.quantity - 1
  product.save!

  product
end

def create_products_requests_for_operator
  user = create(:user)
  operator = create(:user, role: 2, email: 'operator_new@test.ru')
  login(operator)
  product = create_few_products

  request = Request.new(status: Request::IN_PROGRESS, user: user,
                        operator: operator, product: product, quantity: 1)
  request.save!

  product.quantity = product.quantity - 2
  product.save!

  request
end
