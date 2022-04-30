class Entity < ApplicationRecord
  belongs_to :groupe, class_name: 'Group'
  belongs_to :author, class_name: 'User'
  validates :name, presence: true
  validates :amount, presence: true
  validates :groupe, presence: true
  validates :author, presence: true

  def self.total_amount(entity)
    sum = 0
    entity.each do |e|
      sum += e.amount
    end
    sum
  end
end
