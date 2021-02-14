Product.create(name: 'Salo', quantity: 13, price: 150)
Product.create(name: 'Potato', quantity: 50, price: 60)
Product.create(name: 'Vodka', quantity: 90, price: 100)
Product.create(name: 'Beer', quantity: 70, price: 40)
User.create!([
               { email: 'testadmin@mvmanor.co.uk', password: 'testadminuser', password_confirmation: 'testadminuser', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: 1 },
               { email: 'testuser@mvmanor.co.uk', password: 'testuseraccount', password_confirmation: 'testuseraccount', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: 1 },
               { email: 'testcustomer@customer.co.uk', password: 'testcustomeruser', password_confirmation: 'testcustomeruser', reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, role: 2 }
             ])
