require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '#create' do
    before do
      @orderform = FactoryBot.build(:orderform)
    end

    it '全て正常' do
      expect(@orderform.valid?).to eq true
    end

    it 'postal_codeが空だと購入できない' do
      @orderform.postalcode = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Postal Code can't be blank")
    end

    it 'prefectureが空だと購入できない' do
      @orderform.prefecture = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Prefecture can't be blank")
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

  end
end