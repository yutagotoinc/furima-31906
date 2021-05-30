require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品新規登録' do
    context "新規登録がうまくいかないとき" do
      it 'imageが空では登録できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では登録できないこと' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できないこと' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank", "Category can't be blank", "Category is not a number")
      end

      it 'category_idが1では登録できないこと' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idが空では登録できないこと' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank", "Status can't be blank", "Status is not a number")
      end

      it 'status_idが1では登録できないこと' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end

      it 'charge_idが空では登録できないこと' do
        @product.charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Charge can't be blank", "Charge can't be blank", "Charge is not a number")
      end

      it 'charge_idが1では登録できないこと' do
        @product.charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Charge must be other than 1")
      end

      it 'area_idが空では登録できないこと' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank", "Area can't be blank", "Area is not a number")
      end

      it 'area_idが1では登録できないこと' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 1")
      end

      it 'duration_idが空では登録できないこと' do
        @product.duration_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Duration can't be blank", "Duration can't be blank", "Duration is not a number")
      end

      it 'duration_idが1では登録できないこと' do
        @product.duration_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Duration must be other than 1")
      end

      it 'priceが空では登録できないこと' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが10,000,000円以上は出品できないこと' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが299円以下では登録できないこと' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが英数字混合では出品できないこと' do
        @product.price = 'aaa000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが全角では出品できないこと' do
        @product.price = '０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      context '新規登録がうまくいくとき' do
        it "全てのデータが問題なく入力されていれば登録ができること" do
          expect(@product).to be_valid
        end
      end
    end
  end
end
