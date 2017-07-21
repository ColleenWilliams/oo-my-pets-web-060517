require "pry"
class Owner

attr_accessor :pets, :name
attr_reader :species

  @@all = []
  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []

  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{species}."
  end


  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    Dog.all.map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    Cat.all.map do |cat|
      cat.mood = "happy"
    end
  end


  def feed_fish
    Fish.all.map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.map do |species, list|
      list.map do |animal|
        animal.mood = "nervous"
      end
      pets[species] = []
      # binding.pry
    end

  end

  def list_pets
    @pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end


end
