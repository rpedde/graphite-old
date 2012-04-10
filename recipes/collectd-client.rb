#
# Cookbook Name:: graphite
# Recipe:: collectd-client
#
# Copyright 2012, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This recipe installs a collectd server, listening on a network socket,
# and forwarding to graphite
#

include_recipe "osops-utils"
include_recipe "collectd"
include_recipe "collectd-plugins::syslog"
include_recipe "collectd-plugins::cpu"
include_recipe "collectd-plugins::df"
include_recipe "collectd-plugins::disk"
include_recipe "collectd-plugins::interface"
include_recipe "collectd-plugins::memory"
include_recipe "collectd-plugins::swap"

# this should be indirected to management-network
servers = IPManagement.get_ips_for_role("carbon-cache", "management", node)

collectd_plugin "network" do
  options :server => servers
end

collectd_plugin "libvirt" do
  options :connection => "qemu:///system",:refresh_interval => 60, :hostname_format => "name"
end

collectd_plugin "load"

