#
# Cookbook Name:: helloworld
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME

#
# All rights reserved - Do Not Redistribute
#i


hellow_wolrd_directory=node["helloworld"]["directory"]

directory hellow_wolrd_directory do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
  recursive true
end


directory '/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
  recursive true
end

cookbook_file "#{node["helloworld"]["directory"]}/helloworld.rb" do
  action :create
  source 'hello_world.rb'
  owner 'root'
  group 'root'
  mode '0777'
 end

#gem_package 'sinatra' do
#action :install
#notifies :create, 'template[/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb]' ,:immediately
#end
gem_package 'sinatra' do
action :install
#compile_time true
#notifies :create, 'template[/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb]', :immediately

end


template '/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb' do
  action :create
  source 'base.erb'
  owner 'root'
  group 'root'
  mode '0777'
  variables(:sinatra_port => node["sinatra"]["listener"] ,:sinatra_ip => node["sinatra"]["ip"])
  notifies :run, 'execute[run hello world]' ,:immediately
end

puts "Hello worldx"
puts "#{node["helloworld"]["directory"]}/helloworld.rb"

execute 'run hello world' do
  #command "/opt/chefdk/embedded/bin/ruby #{node["helloworld"]["directory"]}/helloworld.rb"
  #command "/opt/chefdk/embedded/bin/ruby #{node["helloworld"]["directory"]}/helloworld.rb"
  command "ls #{node["helloworld"]["directory"]}"
  action :run
  
end

package 'apache2' do
  action :install
  
end
 
