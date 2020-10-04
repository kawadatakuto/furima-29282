require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

  it "全て正常" do  
    expect(@item.valid?).to eq true  
  end

  it "imageが空だと出品できない" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it "titleが空だと出品できない" do
    @item.title = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
  end

  it "textが空だと出品できない" do
    @item.text = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end

  it "priceが空だと出品できない" do
    @item.selling_price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Selling price can't be blank")
  end

  it "genreが選択されていないと出品できない" do
    @item.genre_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end

  it "statusが選択されていないと出品できない" do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Seles status Select")
  end

  it "delivery_feeが選択されていないと出品できない" do
    @item.delivery_fee_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee status Select")
  end

  it "delivery_areaが選択されていないと出品できない" do
    @item.delivery_area_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture Select")
  end

  it "delivery_timeが選択されていないと出品できない" do
    @item.delivery_time_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled delivery Select")
  end

  end
end