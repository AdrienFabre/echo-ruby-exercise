
class Echo
  def self.prompt
    print 'Say something:'
  end

  def self.receive_message
    gets.delete!('/n')
  end

  def self.format_time_received
    Time.now.strftime('%Y-%m-%d | %H:%M')
  end

  def self.format_entire_string
    print format_time_received + " | You said: '" + receive_message + "'!"
  end
end
