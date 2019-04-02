require 'echo'

describe Echo do 

  echo = Echo.new

  it "outputs 'Goodbye' when 'exit' is the message received" do
    allow(echo).to receive(:gets).and_return("exit\n")
    expect { echo.starts }.to output("Say something:\nGoodbye\n").to_stdout
  end

  it 'outputs the entire formated string' do
    time_now = Time.new(2019, 1, 2, 3, 4, 5, '+00:00')
    allow(Time).to receive(:now).and_return(time_now)
    allow(echo).to receive(:loop).and_yield
    allow(echo).to receive(:gets).and_return("hello, world\n")
    expect { echo.starts }.to output(
      "Say something:\n2019-01-02 | 03:04 | You said: 'hello, world'!\nGoodbye\n").to_stdout
  end
end
