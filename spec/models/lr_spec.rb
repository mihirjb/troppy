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

require 'spec_helper'

describe Lr do
  pending "add some examples to (or delete) #{__FILE__}"
end
