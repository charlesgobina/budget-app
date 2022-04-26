class User < ApplicationRecord
  has_many :groups, class_name: 'Group', foreign_key: :author_id, dependent: :destroy
  has_many :entities, class_name: 'Entity', foreign_key: :author_id, dependent: :destroy
end
