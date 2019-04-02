require 'echo'

describe Echo do
  it "prompts the user to say something with 'Say something:'" do
    expect { Echo.prompt }.to output("Say something:\n").to_stdout
  end

  it 'outputs the user answer without the extra line' do
    allow(Echo).to receive(:gets).and_return('hello, world')
    expect(Echo.receive_message).to eq('hello, world')
  end

  it 'outputs the moment an answer has been received in the right format' do
    time_now = Time.new(2019, 1, 2, 3, 4, 5, '+00:00')
    allow(Time).to receive(:now).and_return(time_now)
    expect(Echo.format_time_received).to eq('2019-01-02 | 03:04')
  end

  it 'outputs the entire formated string' do
    time_now = Time.new(2019, 1, 2, 3, 4, 5, '+00:00')
    allow(Time).to receive(:now).and_return(time_now)
    allow(Echo).to receive(:loop).and_yield
    allow(Echo).to receive(:gets).and_return("hello, world\n")
    expect { Echo.starts }.to output(
      "Say something:\n2019-01-02 | 03:04 | You said: 'hello, world'!\nGoodbye\n").to_stdout
  end

  it "outputs 'Goodbye' when 'exit' is the message received" do
    time_now = Time.new(2019, 1, 2, 3, 4, 5, '+00:00')
    allow(Time).to receive(:now).and_return(time_now)
    allow(Echo).to receive(:gets).and_return("exit\n")
    expect { Echo.starts }.to output("Say something:\nGoodbye\n").to_stdout
  end
end
