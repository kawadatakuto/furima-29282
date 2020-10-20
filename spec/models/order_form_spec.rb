require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#create' do
    before do
      @orderform = FactoryBot.build(:orderform)
    end

    it '全て正常' do
      expect(@orderform.valid?).to eq true
    end

    it 'tokenが登録できないと購入できない' do
      @orderform.token = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空だと購入できない' do
      @orderform.postalcode = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Postal Code can't be blank")
    end

    it 'postal_codeに-(ハイフン)が含まれていないと購入できない' do
      @orderform.postalcode = '1234567'
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Is invalid. Include hyphen(-)")
    end

    it 'prefectureが空だと購入できない' do
      @orderform.prefecture = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefectureが選択されていないと購入できない' do
      @orderform.prefecture = 1
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Prefecture celect")
    end

    it 'munisicipalityが空だと購入できない' do
      @orderform.munisicipality = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Munisicipality can't be blank")
    end

    it 'addressが空だと購入できない' do
      @orderform.address = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと購入できない' do
      @orderform.phone_number = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Phone Number can't be blank")
    end

    it 'phone_numberが12桁以上だと購入できない' do
      @orderform.phone_number = '0000000000000'
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Cannot be purchased if it is 12 digits or more")
    end

    it 'phone_numberに(-)ハイフンがある場合は登録できない' do
      @orderform.phone_number = '000-00000-0000'
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("is invalid. Include hyphen(-)")
    end

  end
end