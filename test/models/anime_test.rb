# == Schema Information
#
# Table name: animes
#
#  id            :integer          not null, primary key
#  title         :string
#  genre         :string
#  episode_count :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  anime_type    :string
#  rating        :float
#
require "test_helper"

class AnimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
