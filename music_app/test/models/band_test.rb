# == Schema Information
#
# Table name: bands
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  origin     :string
#  genre      :string
#  members    :string
#

require 'test_helper'

class BandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
