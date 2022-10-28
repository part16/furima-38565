require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'item_name,item_discribe,state_id,category_id,postage_id,ship_id,scheduled_id,item_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'item_priceが半角数値なら登録できる'do
        @item.item_price = "12345"
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'item_nameが空では登録できない' do 
        @item.item_name = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_discribeが---では登録できない' do 
        @item.item_discribe = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Item discribe can't be blank"
      end
      it 'state_idが---では登録できない' do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank" 
      end
      it 'category_idが---では登録できない' do 
        @item.category_id = "1"
        @item.valid?        
        expect(@item.errors.full_messages).to include "Category can't be blank" 
      end
      it 'postage_idが---では登録できない' do 
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank" 
      end
      it 'ship_idが---では登録できない' do 
        @item.ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Ship can't be blank" 
      end
      it 'scheduled_day_idが---では登録できない' do 
        @item.scheduled_day_id ="1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled day can't be blank"
      end 
      it 'item_priceが空では登録できない' do 
        @item.item_price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank" 
      end
       it 'userが紐付いていないと保存できない' do
         @item.user = nil
         @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
       end
    end
  end
end

