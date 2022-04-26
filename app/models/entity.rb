class Entity < ApplicationRecord
  belongs_to :groupe, class_name: 'Group'
  belongs_to :author, class_name: 'User'
end
