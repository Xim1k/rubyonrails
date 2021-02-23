require 'rails_helper'
require 'requests_helper'

RSpec.describe ProductController, type: :request do
  it 'list' do
    create_test_product

    get product_index_path
    expect(assigns(:products)).to eq(Product.all)
  end

  it 'new' do
    user = create(:user)
    login(user)
    get new_product_path
    expect(response.code).to eq '200'
  end

  it 'edit' do
    product = create_test_product
    user = create(:user)
    login(user)
    get edit_product_path(product)
    expect(response.code).to eq '200'
  end

  it 'redirect edit' do
    product = create_test_product
    get edit_product_path(product)
    expect(response).to redirect_to product_index_path
  end

  it 'redirect new' do
    product = create_test_product
    get new_product_path(product)
    expect(response).to redirect_to product_index_path
  end

  it 'destroy product' do
    product = create_few_products
    user = create(:user)
    login(user)
    delete product_path(product)
    expect(Product.all.count).to eq 1
  end

  it 'create' do
    user = create(:user)
    login(user)
    post product_index_path, params: { product: { quantity: 150, price: 131, name: 'Salo3' } }

    expect(Product.find(7).name).to eq 'Salo3'
  end

  it 'update' do
    user = create(:user)
    product = create_few_products
    login(user)
    put product_path(product.id), params: { product: { quantity: 150, price: 131, name: 'Salo3' } }

    expect(Product.find(product.id).name).to eq 'Salo3'
  end
end
