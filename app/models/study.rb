# rubocop:disable Metrics/LineLength
class Study < ActiveRecord::Base
  validates_presence_of :user_id, :title

  belongs_to :user
  has_many :games, dependent: :destroy
end
