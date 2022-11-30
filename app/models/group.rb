class Group < ApplicationRecord
  # belongs_to :user
  has_many :expenses
  has_many :users, through: :expenses
  
  def index
    
  end
  
end
