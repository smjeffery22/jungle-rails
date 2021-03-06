require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "My Cart count goes up when visitor adds a product" do
    # ACT
    visit root_path

    # Find 'Red Bookshelf' field
    page.find('button.btn-primary', match: :first).click
    sleep 5

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_content('My Cart (1)')
  end
end
