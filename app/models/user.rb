class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, class_name: 'Group', foreign_key: :author_id, dependent: :destroy
  has_many :entities, class_name: 'Entity', foreign_key: :author_id, dependent: :destroy
  validates :name, presence: true
end
