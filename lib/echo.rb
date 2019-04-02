
class Echo
  def starts
    loop do
      prompt_user
      break if input?

      puts string_formated
    end
    puts 'Goodbye'
  end

  private

  def prompt_user
    puts 'Say something:'
    @input = gets.chomp
  end

  def format_time_received
    Time.now.strftime('%Y-%m-%d | %H:%M')
  end

  def input?
    @input == 'exit'
  end

  def string_formated
    format_time_received + " | You said: '" + @input + "'!"
  end
end
