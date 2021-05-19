require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context "新規登録がうまくいかないとき" do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
          end

          it 'emailが空では登録できないこと' do
            @user.email = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Email can't be blank")
          end

          it '重複したemailが存在する場合登録できないこと' do
            @user.save
            another_user = FactoryBot.build(:user, email: @user.email)
            another_user.valid?
            expect(another_user.errors.full_messages).to include('Email has already been taken')
          end

          it 'emailに@が含まれていない場合登録できない' do
            @user.email = 'hogehuga.com'
            @user.valid?
            expect(@user.errors.full_messages).to include('Email is invalid')
          end

          it 'passwordが空では登録できないこと' do
            @user.password = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank")
          end

          it 'passwordが5文字以下であれば登録できないこと' do
            @user.password = '12345'
            @user.password_confirmation = '12345'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
          end

          it 'passwordとpassword_confirmationが不一致では登録できないこと' do
            @user.password = '123456'
            @user.password_confirmation = '1234567'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end
      
          it ' passwordが半角英数字混合でなければ登録できない' do
            @user.password = "aaaaaa"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation doesn't match Password")
          end

          it 'passwordが半角数字のみ登録できない' do
            @user.password = '123456'
            @user.password_confirmation = '123456'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end

          it 'passwordが全角でば登録できない' do
            @user.password = 'ＡＢｃ１２３'
            @user.password_confirmation = 'ＡＢｃ１２３'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end

          it 'first_nameが空では登録できないこと' do
            @user.first_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank")
          end
      
          it 'last_nameが空では登録できないこと' do
            @user.last_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank")
          end
      
          it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
            @user.first_name = "kana"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name is invalid")
          end
      
          it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
            @user.last_name = "kana"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name is invalid")
          end
      
          it "フリガナ（名字）が空だと登録できない" do
            @user.first_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end
      
          it "フリガナ（名前）が空だと登録できない" do
            @user.last_name_kana = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana can't be blank")
          end
      
          it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
            @user.first_name_kana = "かな"
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana is invalid")
          end
      
          it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
            @user.last_name_kana = "かな"
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana is invalid")
          end
      
          it "生年月日が空だと登録できない" do
            @user.birth_day = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Birth day can't be blank")
          end
      end

      context '新規登録がうまくいくとき' do
        it 'passwordが6文字以上であれば登録できること' do
          @user.password = '000aaa'
          @user.password_confirmation = '000aaa'
          expect(@user).to be_valid
        end

        it "全てのデータが問題なく入力されていれば登録ができること" do
          expect(@user).to be_valid
        end
      end
  end
end
