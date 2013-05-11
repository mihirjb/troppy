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
  
  validates :balpaid, :presence => true, :message => 'Balance paid cannot be blank, Payvoucher not saved'
  validates :payee, :presence => true, :message => 'Payee cannot be blank, Payvoucher not saved'
  validates :unloadingweight, :presence => true, :message => 'Unloading weight cannot be blank, Payvoucher not saved'
  
  
  
  belongs_to :lr
  
end
