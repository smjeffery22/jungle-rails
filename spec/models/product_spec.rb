require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: 'Apparel')
    @product = Product.create(name: 'Hipster Hat', price: 34.49, quantity: 4)
  end

  describe 'Validations' do
    before do
      @category = Category.new(name: 'Apparel')
      @product = Product.new(name: 'Hipster Hat', price: 34.49, quantity: 4, category: @category)
    end

    it 'should save product with all four fileds set' do
      @product.save
      expect(@product).to be_present
    end

    it 'should not save product if name field is not provided' do
      @product.name = nil      
      @product.save
      
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save product if price field is not provided' do
      @product.price_cents = nil
      @product.save
      
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save product if quantity field is not provided' do
      @product.quantity = nil
      @product.save
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save product if category field is not provided' do
      @product.category = nil
      @product.save
      
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
  end
end
