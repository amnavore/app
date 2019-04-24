class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :cost, inclusion: {in: 1..5}
  validates :location, presence: true
  has_and_belongs_to_many :moods

  def mood_names=(names)
    self.moods = []
    names.split(',').each do |name|
      mood = Mood.find_by(name: name.strip)

      self.moods << mood
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
end
