#
# Cookbook Name:: linux-dev-env
# Recipe:: lua 
#
# Copyright 2012, Gerald L. Hevener Jr., M.S.
#

# Install lua package
case node['platform_family']
 
  when "debian"
    %w{ lua#{node['linux-dev-env']['lua_version']} }.each do |pkg|
    package pkg
  end
end 
