require 'echo'

describe Echo do
  it "prompts the user to say something with 'Say something:'" do
    expect { Echo.prompt }.to output('Say something:').to_stdout
  end

  it 'receive the user answer' do
    allow(Echo).to receive(:gets).and_return('hello, world/n')
    expect(Echo.receive).to eq('hello, world')
  end

  it 'saves the moment an answer has bstrftime("%d/%m/%Y %H:%M")een received' do
    time_now = Time.new(2019, 1, 2, 3, 4, 5, '+00:00')
    allow(Time).to receive(:now).and_return(time_now)
    expect(Echo.time_received).to eq('2019-01-02 | 03:04')
  end
end
