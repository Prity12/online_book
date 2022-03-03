class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role:{user:0,admin:1}

  has_many :favourites, dependent: :destroy
  has_many :books, through: :favourites

  def is_favourties?(book_id)
    favourites.pluck(:book_id).include? book_id
  end

  def favourtie_book_id(book_id)
    favourites.find_by_book_id(book_id)&.id
  end

end
