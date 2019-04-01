
class Echo
  def self.prompt
    print 'Say something:'
  end

  def self.receive
    gets.delete!('/n')
  end

  def self.time_received
    Time.now.strftime('%Y-%m-%d | %H:%M')
  end
end
