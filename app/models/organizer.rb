class Organizer < ActiveRecord::Base
  belongs_to :user
  has_many :tournaments
  
    
  def self.create_organizer(user)
    @o = create! { |organizer| organizer.user = user}
    @o
  end

end
