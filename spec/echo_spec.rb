require 'echo'

describe Echo do
  it "prompts the user to say something with 'Say something:'" do
    expect { Echo.prompt }.to output('Say something:').to_stdout
  end

  it 'receive the user answer' do
    allow(Echo).to receive(:gets).and_return('hello, world/n')
    expect(Echo.receive).to eq('hello, world')
  end
end