require 'minitest/autorun'

class Robot
  # ordered in clockwise ordered
  FACES = [:NORTH, :WEST, :SOUTH, :EAST]

  def initialize
    @position = {:x => 0, :y => 0, :facing => :NORTH}
  end

  def report
    return @position
  end

  def place(posX, posY, facing)
    if valid_position? posX, posY, facing
      @position = {:x => posX, :y => posY, :facing => facing}
      return true
    end

    return false
  end

  def valid_position?(posX, posY, facing)
    if posX >= 5 or posX < 0
      return false
    end

    if posY >= 5 or posY < 0
      return false
    end

    unless FACES.include?(facing)
      return false
    end

    return true
  end

  def left
    current_index = FACES.index(@position[:facing])

    if current_index > 0
      @position[:facing] = FACES.at(current_index - 1)
    else
      @position[:facing] = FACES.last
    end
  end

  def right
    current_index = FACES.index(@position[:facing])

    if current_index < 3
      @position[:facing] = FACES.at(current_index + 1)
    else
      @position[:facing] = FACES.first
    end
  end

  def move
    case @position[:facing]
    when :NORTH
      @position[:y] += 1
    when :SOUTH
      @position[:y] -= 1
    when :WEST
      @position[:x] += 1
    when :EAST
      @position[:x] -= 1
    end
  end
end

class RobotControl
  attr_reader :robot

  def initialize(robot)
    @robot = robot
  end

  def parse(strCmd)
    if strCmd == "PLACE"
      #@robot.place
    end
  end
end

describe Robot do
  before do
    @robot = Robot.new
  end

  it "should start in posistion 0,0 facing north" do
    @robot.report.must_equal({:x => 0, :y => 0, :facing => :NORTH})
  end

  it "should place the robot in a valid position" do
    @robot.place(1, 1, :SOUTH).must_equal true
    @robot.report.must_equal({:x => 1, :y => 1, :facing => :SOUTH})
  end

  it "should reject an invalid position" do
    @robot.place(6, 6, :SOUTH).must_equal false
    @robot.place(1, 1, :ANYWHERE).must_equal false
    @robot.place(-11, -1, :NORTH).must_equal false
  end

  it "should face robot to east after an left command" do
    @robot.left
    @robot.report.must_equal({:x => 0, :y => 0, :facing => :EAST})
  end

  it "should face robot to south after two left commands" do
    @robot.left
    @robot.left
    @robot.report.must_equal({:x => 0, :y => 0, :facing => :SOUTH})
  end

  it "should face robot to north after four left commands" do
    (1..4).each do
      @robot.left
    end

    @robot.report.must_equal({:x => 0, :y => 0, :facing => :NORTH})
  end

  it "should face robot to west after a right command" do
    @robot.right
    @robot.report.must_equal({:x => 0, :y => 0, :facing => :WEST})
  end

  it "should face north after four right commands" do
    (1..4).each do
      @robot.right
    end

    @robot.report.must_equal({:x => 0, :y => 0, :facing => :NORTH})
  end

  it "should move the robot forward from the initial (0,0,north) position" do
    @robot.move
    @robot.report.must_equal({:x => 0, :y => 1, :facing => :NORTH})
  end

  it "should move the robot forward and then get it back to its origin place" do
    @robot.move
    @robot.left
    @robot.left
    @robot.move
    @robot.report.must_equal({:x => 0, :y => 0, :facing => :SOUTH})
  end

  it "should move robot to west position by one unit" do
    @robot.right
    @robot.move
    @robot.report.must_equal({:x => 1, :y => 0, :facing => :WEST})
  end

  it "should move the robot to west by one position and the turn it to east and move it back to the original position" do
    @robot.right
    @robot.move
    @robot.left
    @robot.left
    @robot.move
    @robot.report.must_equal({:x => 0, :y => 0, :facing => :EAST})
  end
end

