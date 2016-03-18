
module TestWorld
  def which
    @app = @app || App.new
  end

end

World(TestWorld)