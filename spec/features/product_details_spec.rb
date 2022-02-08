require 'rails_helper'

RSpec.feature "Visitor navigates from the home page to the product detail page", type: :feature, js: true do
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

  scenario "Visitor sees the detail page of the clicked product" do
    # ACT
    visit root_path

    # Find 'Red Bookshelf' field
    page.find('img', match: :first).click
    sleep 2

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'section.products-show'
  end
end
