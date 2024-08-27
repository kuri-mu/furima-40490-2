require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when the user has valid attributes' do
    it 'is valid with valid attributes' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      expect(@user).to be_valid
    end
  end

  context 'when the user has invalid attributes' do
    it 'is invalid without a nickname' do
      @user = User.new(
        nickname: '',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'is invalid without an email' do
      @user = User.new(
        nickname: 'test',
        email: '',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid without a password' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: '',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is invalid without a first_name' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is invalid without a last_name' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is invalid without a first_kana' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: '',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end

    it 'is invalid without a last_kana' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: '',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end

    it 'is invalid without a birth_date' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: ''
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end

    it 'is invalid with a password containing only numbers' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: '12345678',
        password_confirmation: '12345678',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid, must include both letters and numbers")
    end

    it 'is invalid with a password containing only letters' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid, must include both letters and numbers")
    end

    it 'is invalid with a password containing full-width characters' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'あいうえおかきくけこ',
        password_confirmation: 'あいうえおかきくけこ',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid, must include both letters and numbers")
    end

    it 'is invalid with last_name containing half-width characters' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: 'ﾀﾛｳ',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name must be full-width characters")
    end

    it 'is invalid with first_name containing half-width characters' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: 'ﾔﾏﾀﾞ',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("First name must be full-width characters")
    end

    it 'is invalid with last_kana containing non-Katakana characters' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'カナ',
        last_kana: 'たろう',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end

    it 'is invalid with first_kana containing non-Katakana characters' do
      @user = User.new(
        nickname: 'test',
        email: 'kkk@gmail.com',
        password: 'password1',
        password_confirmation: 'password1',
        first_name: '山田',
        last_name: '太郎',
        first_kana: 'やまだ',
        last_kana: 'カナ',
        birth_date: '2000-01-01'
      )
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana is invalid")
    end
  end
end