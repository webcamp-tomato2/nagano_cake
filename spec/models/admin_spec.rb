require "rails_helper"

describe 'モデルのテスト' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:admin)).to be_valid
  end
end