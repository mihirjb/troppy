# == Schema Information
#
# Table name: lrs
#
#  id                :integer          not null, primary key
#  lrno              :integer
#  party             :string(255)
#  truckno           :string(255)
#  loadweight        :string(255)
#  advance           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  creation_location :string(255)
#

class Lr < ActiveRecord::Base
  attr_accessible :advance, :loadweight, :lrno, :party, :truckno, :user_id,:creation_location
  
  validates :lrno, :presence => true
  validates :party, :presence => true
  validates :truckno, :presence => true
  validates :loadweight, :presence => true
  validates :advance, :presence => true
  
  
  belongs_to :user
  has_one :payvoucher # dependent destroy implemented via a hack in the LR controller.

  
  
  validates_uniqueness_of :lrno, scope: [:party] # it will not create a duplicate Lr for the same Party - say only one            Lr for Reliance
  
 
 
  
end
