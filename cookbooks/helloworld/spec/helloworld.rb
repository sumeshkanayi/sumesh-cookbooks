require 'chefspec'

#describe 'helloworld::default' do
 # let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
describe 'helloworld::default' do
let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set["helloworld"]["directory"] = '/tmp/helloworld'
      node.set["sinatra"]["port"]="4567"
      node.set["sinatra"]["listener"]="127.0.0.1"
    end.converge(described_recipe)
  end
  
  
  it 'creates a directory' do
  	  expect(chef_run).to create_directory('/tmp/helloworld')
     end
     
  it 'creates a copies ruby file to hello world directory' do
  	  expect(chef_run).to create_cookbook_file('/tmp/helloworld/helloworld.rb').with(source:'hello_world.rb',owner: 'root')
     end

  it 'does install sinatra gem file' do
  	  expect(chef_run).to install_chef_gem('sinatra')
     end

  it 'does create a template file' do
  	  expect(chef_run).to create_template('/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb')
  	  expect(chef_run).to render_file('/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb').with_content(/192.168.0.1/)
     expect(chef_run).to render_file('/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb').with_content(/80/)

     end
     
      it 'Executes Hello world ruby' do
  	  expect(chef_run).to run_execute('run hello world')
     end
     
it "sinatra gem installation notifies template files to get created" do
resource = chef_run.chef_gem('sinatra')
expect(resource).to notify('template[/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb]').to(:create).immediately
end

it "template file will notify to execute hello world ruby app" do
resource = chef_run.template('/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb')
expect(resource).to notify('execute[run hello world]').to(:run).immediately
end

end
