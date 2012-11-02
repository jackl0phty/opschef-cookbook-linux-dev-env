#
# Cookbook Name:: linux-dev-env
# Recipe:: wxlua 
#
# Copyright 2012, Gerald L. Hevener Jr., M.S.
#

# Install wxWidgets
case node['platform_family']
  
  when "debian"
    %w{ wx2.8-i18n }.each do |pkg|
    package pkg
  end
end

# Download & compile wxlua from source.
script "download-install-wxlua" do
  interpreter "bash"
  user "root"
  cwd "/opt"
  code <<-EOH
  wget -c http://downloads.sourceforge.net/project/wxlua/wxlua/2.8.10.0/wxLua-2.8.10.0-src.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fwxlua%2Ffiles%2F&ts=1351814476&use_mirror=iweb 
  mv wxLua*.gz wxLua-2.8.10.0-src.tar.gz 
  tar zxvhf wxLua-2.8.10.0-src.tar.gz
  cd wxLua
  ./configure
  make 
  EOH
  not_if "test -d /opt/wxLua"
end
