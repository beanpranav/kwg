class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games do
   def researcher_games
     where("self.user_type = ?", "researcher")
   end
  end

  has_many :players
  has_many :games, through: :players do
   def participant_games
     where("self.user_type = ?", "participant")
   end
  end

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
