require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do 
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混同でなければ登録できない' do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end                                            
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前(姓)が空では登録できない' do
      @user.name_sei = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei can't be blank")
    end
    it '名前(名)が空では登録できない' do
      @user.name_mei = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei can't be blank")
    end
    it '名前(フリ)が空では登録できない' do
      @user.name_furi = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name furi can't be blank")
    end
    it '名前(ガナ)が空では登録できない' do
      @user.name_gana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name gana can't be blank")
    end
    it '名前(姓)が全角でなければ登録できない' do
      @user.name_sei = 'testsei '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei is invalid. Input full-width characters")
    end
    it '名前(名)が全角でなければ登録できない' do
      @user.name_mei = 'testsei '
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei is invalid. Input full-width characters")
    end
    it '名前(フリ)が全角カタカナでなければ登録できない' do
      @user.name_furi = 'test試験'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name furi is invalid. Input full-width katakana characters")
    end
    it '名前(ガナ)が全角カタカナでなければ登録できない' do
      @user.name_gana = 'test試験'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name gana is invalid. Input full-width katakana characters")
    end
    it '生年月日が空白だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end


