require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when the user has valid attributes' do
    it 'is valid with valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  context 'when the user has invalid attributes' do
    it 'is invalid without a nickname' do
      user = FactoryBot.build(:user, nickname: '')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: '')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid without a password' do
      user = FactoryBot.build(:user, password: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is invalid when email is in use' do
      FactoryBot.create(:user, email: 'kkk@gmail.com')
      user = FactoryBot.build(:user, email: 'kkk@gmail.com')
      user.valid?
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'is invalid when email does not contain @' do
      user = FactoryBot.build(:user, email: 'kkkgmail.com')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it 'is invalid without a first_name' do
      user = FactoryBot.build(:user, first_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is invalid without a last_name' do
      user = FactoryBot.build(:user, last_name: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is invalid without a first_kana' do
      user = FactoryBot.build(:user, first_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank")
    end

    it 'is invalid without a last_kana' do
      user = FactoryBot.build(:user, last_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank")
    end

    it 'is invalid without a birth_date' do
      user = FactoryBot.build(:user, birth_date: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'is invalid with a password containing only numbers' do
      user = FactoryBot.build(:user, password: '12345678', password_confirmation: '12345678')
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid, must include both letters and numbers")
    end

    it 'is invalid with a password containing only letters' do
      user = FactoryBot.build(:user, password: 'abcdefgh', password_confirmation: 'abcdefgh')
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid, must include both letters and numbers")
    end

    it 'is invalid with a password containing full-width characters' do
      user = FactoryBot.build(:user, password: 'あいうえおかきくけこ', password_confirmation: 'あいうえおかきくけこ')
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid, must include both letters and numbers")
    end

    it 'is invalid with last_name containing half-width characters' do
      user = FactoryBot.build(:user, last_name: 'ﾀﾛｳ')
      user.valid?
      expect(user.errors.full_messages).to include("Last name must be full-width characters")
    end

    it 'is invalid with first_name containing half-width characters' do
      user = FactoryBot.build(:user, first_name: 'ﾔﾏﾀﾞ')
      user.valid?
      expect(user.errors.full_messages).to include("First name must be full-width characters")
    end

    it 'is invalid with last_kana containing non-Katakana characters' do
      user = FactoryBot.build(:user, last_kana: 'たろう')
      user.valid?
      expect(user.errors.full_messages).to include("Last kana is invalid")
    end

    it 'is invalid with first_kana containing non-Katakana characters' do
      user = FactoryBot.build(:user, first_kana: 'やまだ')
      user.valid?
      expect(user.errors.full_messages).to include("First kana is invalid")
    end
  end
end