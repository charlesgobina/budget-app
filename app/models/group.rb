class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities, class_name: 'Entity', foreign_key: :groupe_id, dependent: :destroy
end
