class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipingcost
  belongs_to_active_hash :situation
  belongs_to_active_hash :timeship
  belongs_to_active_hash :area
  belongs_to :user
  has_one_attached :image
  
  validates :image,            presence: true
  validates :title,            presence: true
  validates :explanation,      presence: true
  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank"} 
  validates :situation_id,     numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipingcost_id,   numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :timeship_id ,     numericality: { other_than: 1 , message: "can't be blank"} 
  validates :cost,             presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :cost,             format: { with: /\A[0-9]+\z/ }



end
