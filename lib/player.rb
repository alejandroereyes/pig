class Player
  attr_reader :name, :id
  attr_accessor :score

  def initialize name
    @name  = name
    @score = 0
    @id = 0
  end

  def add_id(id)
    @id = id
  end
end
