require 'rails_helper'

RSpec.describe HistoryArea, type: :model do
  describe '配送先の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @history_area = FactoryBot.build(:history_area, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it '項目が全て埋まっていれば購入できる' do
       expect(@history_area).to be_valid
      end
    end
    
    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @history_area.token = nil
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_codeが空だと購入できないこと' do
        @history_area.post_code = ''
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Post code can't be blank"  
      end
      it 'post_codeが3桁-4桁の形式でないと購入できないこと' do
        @history_area.post_code = 'aasds'
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Post code is invalid"
      end
      it 'ship_idが---では購入できないこと' do 
        @history_area.ship_id = "1"
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Ship can't be blank"
      end
      it 'cityが空だと購入できないこと' do
        @history_area.city = ''
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと購入できないこと' do
        @history_area.address = ''
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空だと購入できないこと' do
        @history_area.phone_number = ''
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが半角数字でないと購入できないこと' do
        @history_area.phone_number = 'aaaccc'
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは10、11桁でないと購入できないこと' do
        @history_area.phone_number = '1234567'
        @history_area.valid?
        expect(@history_area.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)"
      end
    end
  end
end
