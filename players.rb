class Players
  attr_accessor :life, :turn
  attr_reader :name

  def initialize(name)
    @name = name
    @life = 0
    @turn = false
  end
end