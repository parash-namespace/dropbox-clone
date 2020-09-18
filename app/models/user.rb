class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :folders, foreign_key: "owner_id"

  has_many :shares
  has_many :shared_folders, through: :shares, source: :folder
  # the ones that are shared with current user
end
