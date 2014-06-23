#
# Cookbook Name:: eccube
# Recipe:: default
#
# Copyright 2014, Ryo Ogata
#
# All rights reserved - Do Not Redistribute
#
mysql_database 'oracle_rules' do 
  connection( :host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password'] )
  action :create
end
