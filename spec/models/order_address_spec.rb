require 'rails_helper'

  RSpec.describe OrderAddress, type: :model do
    describe '購入情報情報の保存' do
      before do
        user = FactoryBot.create(:user)
        product = FactoryBot.create(:product)
        @order_address = FactoryBot.build(:order_address, user_id: user.id, product_id: product.id)
        sleep 0.1 
      end

      context '内容に問題ない場合' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
        it 'buildingは空でも保存できること' do
          @order_address.building = ''
          expect(@order_address).to be_valid
        end
      end

      context '内容に問題がある場合' do
        it 'zip_codeが空だと保存できないこと' do
          @order_address.zip_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
        end
        it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_address.zip_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
        end
        it 'prefectureを選択していないと保存できないこと' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'cityが空だと保存できないこと' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it 'block_numberが空だと保存できないこと' do
          @order_address.block_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Block number can't be blank")
        end
        it 'phone_numberが空だと保存できないこと' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが11桁未満では保存できないこと' do
          @order_address.phone_number = '090'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
        end
        it 'phone_numberは英数字混同では保存できないこと' do
          @order_address.phone_number = '0901111aaaa'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is not a number')
        end
        it 'userが紐付いていないと保存できないこと' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'tokenが空では登録できないこと' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'productが紐付いていないと保存できないこと' do
          @order_address.product_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Product can't be blank")
        end
      end
    end
  end