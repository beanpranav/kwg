class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :studies

  has_many :players
  has_many :games, through: :players

  belongs_to :researcher, class_name: "User"
  has_many :participants, class_name: "User", foreign_key: "researcher_id"

  def first_name
    name.split(" ")[0]
  end

  def last_name
    name.split(" ").last
  end

  def params_name
    name.gsub(' ', '+')
  end

end
