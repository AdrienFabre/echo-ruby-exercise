
class Echo
  def self.prompt
    puts 'Say something:'
  end

  def self.receive_message
    @input = gets.chomp
  end

  def self.format_time_received
    Time.now.strftime('%Y-%m-%d | %H:%M')
  end

  def self.input?
    @input == 'exit'
  end

  def self.starts
    loop do
      prompt
      receive_message
      break if input?

      puts format_time_received + " | You said: '" + @input + "'!"
    end
    puts 'Goodbye'
  end
end
