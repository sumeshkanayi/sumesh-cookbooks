require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "sinatra" do


describe file('/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/bases.rb') do
  it { should exist }
end


end
