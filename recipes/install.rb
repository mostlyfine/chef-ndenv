#
# Cookbook Name:: ndenv
# Recipe:: install
#
# Copyright 2014, mostlyfine
#
# All rights reserved - Do Not Redistribute
#

execute 'ndenv init' do
  user node.ndenv.user
  group node.ndenv.group
  command "source #{node.ndenv.profile_path}/ndenv.sh; ndenv rehash"
  action :run
end

node.ndenv.build.each do |version|
  execute "node.js install #{version}" do
    not_if "source #{node.ndenv.profile_path}/ndenv.sh; ndenv versions | grep #{version}"
    command "source #{node.ndenv.profile_path}/ndenv.sh; ndenv install #{version}"
    user node.ndenv.user
    group node.ndenv.group
    action :run
  end
end

execute 'global node.js change' do
  user node.ndenv.user
  group node.ndenv.group
  command "source #{node.ndenv.profile_path}/ndenv.sh; ndenv global #{node.ndenv.global}; ndenv rehash"
  action :run
end

