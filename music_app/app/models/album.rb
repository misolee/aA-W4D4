# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer
#  band_id    :integer
#  live       :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, presence: true

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band
end
