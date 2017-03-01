
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
    next_pos = @position.clone

    case next_pos[:facing]
    when :NORTH
      next_pos[:y] += 1
    when :SOUTH
      next_pos[:y] -= 1
    when :WEST
      next_pos[:x] += 1
    when :EAST
      next_pos[:x] -= 1
    end

    if valid_position?(next_pos[:x], next_pos[:y], next_pos[:facing])
      @position = next_pos
    end
  end

  def parse(cmd)
    if cmd.include? "PLACE"
      data = cmd.split("PLACE")[1]
      pos = data.split(",")
      facing = pos[2].split[0] # remove the trails \n
      placed = place(pos[0].to_i, pos[1].to_i, facing.to_sym)
    elsif cmd.include? "LEFT"
      left
    elsif cmd.include? "RIGHT"
      right
    elsif cmd.include? "MOVE"
      move
    elsif cmd.include? "REPORT"
      position = report
      puts "[REPORT] X = #{position[:x]} Y = #{position[:y]} | FACING: #{position[:facing].to_s}" 
    else
      puts "[ERROR] Invalid Command"
    end
  end
end

