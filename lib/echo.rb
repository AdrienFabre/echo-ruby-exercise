
class Echo
  def self.prompt
    print 'Say something:'
  end

  def self.receive
    gets.delete!('/n')
  end
end
