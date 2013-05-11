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

require 'spec_helper'

describe Payvoucher do
  pending "add some examples to (or delete) #{__FILE__}"
end
