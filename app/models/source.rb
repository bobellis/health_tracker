class Source < ActiveRecord::Base
  belongs_to :event

  def self.search(search)
    if search
      self.where("name LIKE ?", "%#{search}%")
    else
      self.all
    end
  end
end
