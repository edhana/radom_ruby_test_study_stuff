require_relative 'robot.rb'

robot = Robot.new

Signal.trap('INT') {
  puts "Leaving robot challenge"
  exit
}

$stdin.each_line do |l|
  robot.parse l
end
