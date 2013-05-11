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
  
  validates :name, :presence => true, :message => 'Name cannot be blank, Lr not saved'
  validates :party, :presence => true, :message => 'Party cannot be blank, Lr not saved'
  validates :truckno, :presence => true, :message => 'Truck number cannot be blank, Lr not saved'
  validates :loadweight, :presence => true, :message => 'Loading Weight cannot be blank, Lr not saved'
  validates :advance, ::presence => true, :message => 'Advance cannot be blank. Put 0 if no Advance, Lr not saved'
  
  
  belongs_to :user
  has_one :voucher, :dependent => :destroy
  
  
  validates_uniqueness_of :lrno, scope: [:party]
  
 
 
  
end
