# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts

  has_many :comments

  has_many :likes, dependent: :destroy

  has_many :friend_requests, dependent: :destroy
  has_many :pending_friends, through: :friend_requests, source: :friend

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :surname, presence: true
end
