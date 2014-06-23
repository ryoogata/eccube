#
# Cookbook Name:: eccube
# Recipe:: default
#
# Copyright 2014, Ryo Ogata
#
# All rights reserved - Do Not Redistribute
#
mysql_database '#{node["eccube"]["database"]["_DATABASE_NAME"]}' do 
  connection( :host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password'] )
  action :create
end
