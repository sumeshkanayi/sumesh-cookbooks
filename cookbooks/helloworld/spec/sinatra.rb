require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "sinatra" do


describe file('/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb') do
  it { should exist }
end


describe package('apache2') do
  it { should be_installed }
end

describe package('sinatra') do
  it { should be_installed.by('gem')}
end


end
