#
# Cookbook Name:: eccube
# Recipe:: default
#
# Copyright 2014, Ryo Ogata
#
# All rights reserved - Do Not Redistribute
#
%w{
  php-mbstring unzip
}.each do |package_name|
    package package_name do
    action :install
  end
end

cookbook_file "/tmp/eccube-2.13.2.zip" do
  source "eccube-2.13.2.zip"
  not_if {File.exists?("/tmp/eccube-2.13.2.zip")}
end

script "copy_files" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    unzip eccube-2.13.2.zip 
    cp -a eccube-2.13.2/data eccube-2.13.2/html
    cp -a eccube-2.13.2/html /var/www/
  EOH
end

template "/var/www/html/define.php" do
  source "define.php.erb"
  owner "root"
  group "root"
  mode 0666
end
