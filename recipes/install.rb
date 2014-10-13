#
# Cookbook Name:: thumbor
# Recipe:: install
#
# Copyright 2014, Virender Khatri
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

case node['platform_family']
when 'debian'

  # apt repository configuration
  apt_repository node['thumbor']['apt']['thumbor']['repo'] do
    uri node['thumbor']['apt']['thumbor']['uri']
    distribution node['thumbor']['apt']['thumbor']['distribution']
    components node['thumbor']['apt']['thumbor']['components']
    keyserver node['thumbor']['apt']['thumbor']['keyserver']
    key node['thumbor']['apt']['thumbor']['key']
    deb_src node['thumbor']['apt']['thumbor']['deb_src']
    action node['thumbor']['apt']['thumbor']['action']
  end

  apt_repository node['thumbor']['apt']['multiverse']['repo'] do
    uri node['thumbor']['apt']['multiverse']['uri']
    distribution node['thumbor']['apt']['multiverse']['distribution']
    components node['thumbor']['apt']['multiverse']['components']
    deb_src node['thumbor']['apt']['multiverse']['deb_src']
    action node['thumbor']['apt']['multiverse']['action']
  end

  # removed redis-server package from the list, Use redisio cookbook instead
  # removed python packages, Using python cookbook instead
  #
  # keeping it sane just for thumbor
  #

  required_packages = %w(libopencv-dev libevent-dev libxml2-dev libcurl4-gnutls-dev python-pycurl-dbg
                         librtmp-dev libatlas-base-dev gfortran liblapack-dev libblas-dev build-essential
                         checkinstall git pkg-config cmake libpng12-0 libpng12-dev libpng++-dev libpng3
                         libpnglite-dev libfaac-dev libjack-jackd2-dev libjasper-dev libjasper-runtime
                         libjasper1 libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev
                         libtheora-dev libva-dev libvdpau-dev libvorbis-dev libx11-dev libxfixes-dev libxvidcore-dev
                         texi2html yasm zlib1g-dev zlib1g-dbg zlib1g libgstreamer0.10-0 libgstreamer0.10-dev libgstreamer0.10-0-dbg
                         gstreamer0.10-tools gstreamer0.10-plugins-base libgstreamer-plugins-base0.10-dev gstreamer0.10-plugins-good
                         gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-ffmpeg pngtools libtiff4-dev libtiff4
                         libtiffxx0c2 libtiff-tools libjpeg8 libjpeg8-dev libjpeg8-dbg libjpeg-progs libavcodec-dev libavcodec53
                         libavformat53 libavformat-dev libxine1-ffmpeg libxine-dev libxine1-bin libunicap2 libunicap2-dev
                         libdc1394-22-dev libdc1394-22 libdc1394-utils swig libjpeg-progs libjpeg-dev libgtk2.0-0 libgtk2.0-dev
                         gtk2-engines-pixbuf python-numpy python-opencv libgraphicsmagick++1-dev libgraphicsmagick++3
                         libboost-python-dev tree webp libwebp-dev python-dateutil libqt4-dev libswscale-dev libtbb-dev
                         libv4l-dev v4l-utils x264)

when 'rhel'
  # TODO: add yum packages
  required_packages = []
end

# install dependency packages
required_packages.each do |pkg|
  package pkg
end

# install dependency pip packages
python_pip 'remotecv'

python_pip 'graphicsmagick-engine'

# install thumbor
case node['thumbor']['install_method']
when 'pip'
  python_pip 'thumbor' do
    version node['thumbor']['version']
    notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
  end
  # python_pip "git+git://github.com/globocom/thumbor.git@#{node['thumbor']['version']}#egg=thumbor"
when 'package'
  # package installation is only supported for debian os family
  # need to check for rhel family
  case node['platform_family']
  when 'debian'
    package 'thumbor' do
      notifies :restart, 'service[thumbor]', :delayed if node['thumbor']['notify_restart']
    end
  else
    fail "installed_method package is not available for #{node['platform_family']} platform_family"
  end
else
  fail "invalid install_method #{node['thumbor']['install_method']}, valid are pip package"
end

python_pip 'git+git://github.com/zanui/thumbor_aws.git@webp#egg=thumbor_aws'
