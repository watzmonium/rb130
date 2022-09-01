class Robot
  attr_reader :name
  LETS = ('A'..'Z').to_a
  NUMS = ('0'..'9').to_a

  def initialize
    Kernel.srand
    @used_names = []
    @name = make_name
  end

  def reset
    @name = make_name
  end

  private

  attr_accessor :used_names

  def make_name
    robo_name = ''
    loop do
      2.times do
        robo_name += LETS.sample
      end
      3.times do
        robo_name += NUMS.sample
      end
      break unless used_names.include?(robo_name)
    end
    used_names << robo_name
    robo_name
  end
end

p Robot.new.name