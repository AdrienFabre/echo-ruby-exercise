require 'echo'

describe Echo do 
    it "prompts the user to say something with 'Say something:'" do 
       expect { Echo.prompt }.to output('Say something:').to_stdout
    end
end