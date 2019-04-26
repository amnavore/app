class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :cost, inclusion: {in: 1..5}
  validates :location, presence: true
  has_and_belongs_to_many :moods

  def mood_names=(names)
    self.moods = []
    names.split(',').each do |name|
      cap_name = name.capitalize
      mood = Mood.find_by(name: cap_name.strip)

      if !!mood
        self.moods << mood
      else
        # Do Nothing
      end
    end
  end

  def mood_names
    if self.moods.any?
      moods = self.moods.map{|x| x.name}
      moods.join(',')
    else
      moods = nil
    end
  end

  def setting_foodimg=(foodtype)
    if foodtype.nil? || foodtype.empty?
    else
      foodimage_path = foodtype + ".jpg"
      self.update_attribute(:foodtype, foodtype)
      self.update_attribute(:foodimage, foodimage_path)
    end
  end

  def setting_foodimg
    return self.foodtype
  end

  def set_dollar
    dollars = self.cost
    signs = ''
    dollars.times do |i|
      signs += "$"
      i+1
    end
    return signs
  end

end
