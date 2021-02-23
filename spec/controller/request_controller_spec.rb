require 'rails_helper'
require 'requests_helper'

RSpec.describe RequestController, type: :request do
  it 'create' do
    product = prepare_test_create
    operator_two = create(:user, role: 2, email: 'operator_second@test.ru')
    post request_create_path, params: { product_id: product.id, quantity: 1 }
    expect(Request.find(2).operator.id).to eq operator_two.id
  end

  it 'distribution' do
    product = prepare_test_create
    create(:user, role: 2, email: 'operator_second@test.ru')

    post request_create_path, params: { product_id: product.id, quantity: 1 }

    expect(Request.find(3).id).not_to eq nil
  end

  it 'index' do
    create_products_requests_for_operator

    get request_index_path

    expect(response.code).to eq '200'
  end

  it 'finish' do
    request = create_products_requests_for_operator

    post request_finish_path, params: { format: request.id }

    expect(Request.find(request.id).status).to eq Request::FINISHED
  end

  it 'cancel' do
    request = create_products_requests_for_operator

    post request_cancel_path, params: { format: request.id }

    expect(Request.find(request.id).status).to eq Request::CANCELED
  end
end
