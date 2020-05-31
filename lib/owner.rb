class Owner
  @@all= []
  attr_accessor :pets
  attr_reader :name, :species

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def cats
    Cat.all.select do 
      |cat| cat.owner == self
    end
  end
  
  def dogs
    Dog.all.select do 
      |dog| dog.owner == self
    end
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def walk_dogs
    self.dogs.collect do |dog| dog.mood = "happy"
    end
  end

  def feed_cats
      self.cats.collect do |cat| cat.mood = "happy"
      end
  end


  def sell_pets
   pets = self.cats + self.dogs
     pets.collect do |pet| pet.mood = "nervous" end 
     pets.collect do |pet| pet.owner = nil end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.dogs.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end
end