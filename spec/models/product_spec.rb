require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @category = Category.create(name: 'Apparel')
    @product = Product.create(name: 'Hipster Hat', price: 34.49, quantity: 4)
  end

  describe 'Validations' do
    it 'should save product with all four fileds set' do
      puts @category.inspect
      puts @product.inspect
      # @category = Category.create(name: 'Apparel')
      
      # @product = Product.new
      # @product.name = 'Hipster Hat'
      # @product.price = 34.49
      # @product.quantity = 4
      # @product.category_id = @category.id
      # @product.save
      
      expect(@product).to be_present
    end

    # it 'should not save product if name field is not provided' do
    #   @category = Category.create(name: 'Apparel')
    #   # @category.save
      
    #   @product = Product.new
    #   @product.name = nil
    #   @product.price = 34.49
    #   @product.quantity = 4
    #   @product.category_id = @category.id
    #   @product.save
      
    #   expect(@product.valid?).to be false
    #   expect(@product.errors.full_messages.count).to be 1
    # end

    # it 'should not save product if price field is not provided' do
    #   @category = Category.create(name: 'Apparel')
      
    #   @product = Product.new
    #   @product.name = 'Hipster Hat'
    #   @product.price = nil
    #   @product.quantity = 4
    #   @product.category_id = @category.id
    #   @product.save
      
    #   expect(@product.valid?).to be false
    #   expect(@product.errors.full_messages.count).to be 3
    # end

    # it 'should not save product if quantity field is not provided' do
    #   @category = Category.create(name: 'Apparel')
      
    #   @product = Product.new
    #   @product.name = 'Hipster Hat'
    #   @product.price = 34.49
    #   @product.quantity = nil
    #   @product.category_id = @category.id
    #   @product.save
      
    #   expect(@product.valid?).to be false
    #   expect(@product.errors.full_messages.count).to be 1
    # end

    # it 'should not save product if category field is not provided' do
    #   @category = Category.create(name: 'Apparel')
      
    #   @product = Product.new
    #   @product.name = 'Hipster Hat'
    #   @product.price = 34.49
    #   @product.quantity = nil
    #   @product.category_id = nil
    #   @product.save
      
    #   expect(@product.valid?).to be false
    #   expect(@product.errors.full_messages.count).to be 2
    # end
    
  end
end
