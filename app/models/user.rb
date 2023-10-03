# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :searches, dependent: :delete_all
  has_many :cars, dependent: :delete_all

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info['email']).first

    user ||= User.create(
      email: access_token.info['email'],
      password: Devise.friendly_token[0, 20],
      full_name: access_token.info['name'],
      avatar_url: access_token.info['image'],
      provider: access_token.provider,
      uid: access_token.uid
    )

    user
  end
end
