# == Schema Information
#
# Table name: payvouchers
#
#  id                :integer          not null, primary key
#  balpaid           :integer
#  totalamnt         :integer
#  paiddate          :date
#  payee             :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  creation_location :string(255)
#  lr_id             :integer
#  lrno              :integer
#  party             :string(255)
#

class Payvoucher < ActiveRecord::Base
  attr_accessible :balpaid, :paiddate, :payee, :totalamnt,:party, :lr_id, :lrno,:creation_location, :unloadingweight
  
  validates :balpaid, :presence => true
  validates :payee, :presence => true
  validates :unloadingweight, :presence => true
  validates :lr_id, :uniqueness => true
  
  
  
  belongs_to :lr
  
end
