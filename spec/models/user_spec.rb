require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameとemail、password他全ての項目が存在すれば登録できること" do
      user = User.new(:user)
      expect(user).to be_valid
    end
    it "nicknameが空だと登録できないこと" do
      user = User.new(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end
    it "emailが空だと登録できないこと" do
      user = User.new(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    it "emailの@がないと登録できないこと" do
      user = User.new(:user, email: "eegmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end
    it "passwordがないと登録できないこと" do
      user = User.new(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end
    it "passwordがあってもpassword_confirmationがないと登録できないこと" do
      user = User.new(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end
    it "emailが重複した場合、登録できないこと" do
      user = User.new(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end
    it "passwordが6字以上だと登録できること" do
      user = User.new(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end
    it "first_nameがないと登録できないこと" do
      user = User.new(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("が入力されていません。")
    end
    it "last_nameがないと登録できないこと" do
      user = User.new(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("が入力されていません。")
    end
    it "first_kanaがないと登録できないこと" do
      user = User.new(:user, first_kana: "")
      user.valid?
      expect(user.errors[:first_kana]).to include("が入力されていません。")
    end
    it "last_kanaがないと登録できないこと" do
      user = User.new(:user, last_kana: "")
      user.valid?
      expect(user.errors[:last_kana]).to include("が入力されていません。")
    end
    it "birth_dateがないと登録できないこと" do
      user = User.new(:user, birth_date: "")
      user.valid?
      expect(user.errors[:birth_date]).to include("が入力されていません。")
    end
  end
end