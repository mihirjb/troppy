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
  
  
  
  belongs_to :user
  has_one :voucher, :dependent => :destroy
  
  
  validates_uniqueness_of :lrno, scope: [:party]
  
  def self.search(lrno,company)
    if lrno
      find(:all, :conditions => ['lrno LIKE ? AND LOWER(party) LIKE ?',lrno, "%#{params[:company].downcase}%"])
    else
      find(:all)
    end
  end
  
end
