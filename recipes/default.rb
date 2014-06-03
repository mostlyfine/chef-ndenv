#
# Cookbook Name:: ndenv
# Recipe:: default
#
# Copyright 2014, mostlyfine
#
# All rights reserved - Do Not Redistribute
#

group node.ndenv.group do
  members node.ndenv.members
  append true
  action :create
end

git node.ndenv.ndenv_root do
  not_if { File.exist?(node.ndenv.ndenv_root) }
  user node.ndenv.user
  group node.ndenv.group
  repository 'git://github.com/riywo/ndenv.git'
  reference 'master'
  action :sync
end

directory "#{node.ndenv.ndenv_root}/plugins" do
  not_if { File.exist?("#{node.ndenv.ndenv_root}/plugins") }
  owner node.ndenv.user
  group node.ndenv.group
  mode '0755'
  recursive true
  action :create
end

git "#{node.ndenv.ndenv_root}/plugins/node-build" do
  not_if { File.exist?("#{node.ndenv.ndenv_root}/plugins/node-build") }
  user node.ndenv.user
  group node.ndenv.group
  repository 'git://github.com/riywo/node-build.git'
  reference 'master'
  action :sync
end


directory node.ndenv.profile_path do
  not_if { File.exist?(node.ndenv.profile_path) }
  owner node.ndenv.user
  group node.ndenv.group
  mode '0755'
  recursive true
  action :create
end

template "#{node.ndenv.profile_path}/ndenv.sh" do
  owner node.ndenv.user
  group node.ndenv.group
  mode '0644'
end
