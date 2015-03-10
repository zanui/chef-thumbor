#
# Cookbook Name:: thumbor
# Recipe:: config
#
# Author:: Enrico Stahn <mail@enricostahn.com>
#
# Copyright 2012-2015, Zanui <engineering@zanui.com.au>
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

# You can find all thumbor configuration options here:
#
#   https://github.com/thumbor/thumbor/wiki/Configuration
#
# For default parameter values, check out the thumbor-config command

default['thumbor']['conf_file'] = '/etc/thumbor.conf'
default['thumbor']['key_file']  = '/etc/thumbor.key'

default['thumbor']['options'] = {}

# the quality of the generated image
# this option can vary widely between
# imaging engines and works only on jpeg images
default['thumbor']['options']['QUALITY'] = 85

# enable this options to specify client-side cache in seconds
default['thumbor']['options']['MAX_AGE'] = 24 * 60 * 60

# client-side caching time for temporary images (using queued detectors or after detection errors)
default['thumbor']['options']['MAX_AGE_TEMP_IMAGE'] = 0

# Specifies that the /unsafe url should be available in this thumbor instance
default['thumbor']['options']['ALLOW_UNSAFE_URL'] = true

# the way images are to be loaded
default['thumbor']['options']['LOADER'] = 'thumbor.loaders.http_loader'

# if you set UPLOAD_ENABLED to True,
# a route /upload will be enabled for your thumbor process
# You can then do a put to this URL to store the photo
# using the specified Storage
default['thumbor']['options']['UPLOAD_ENABLED'] = false

# UPLOAD_PHOTO_STORAGE = 'thumbor.storages.file_storage'
default['thumbor']['options']['UPLOAD_PHOTO_STORAGE'] = false

# how to store the loaded images so we don't have to load
# them again with the loader
# STORAGE = 'thumbor.storages.no_storage'
# STORAGE = 'thumbor.storages.file_storage'
# STORAGE = 'thumbor.storages.mixed_storage'
default['thumbor']['options']['STORAGE'] = 'thumbor.storages.no_storage'

# default['thumbor']['options']['STORAGE'] = 'thumbor_aws.storages.s3_storage'

# root path of the file storage
default['thumbor']['options']['FILE_STORAGE_ROOT_PATH'] = '/var/lib/thumbor/storage'
default['thumbor']['options']['RESULT_STORAGE_FILE_STORAGE_ROOT_PATH'] = '/var/lib/thumbor/result-storage'

# If you want to cache results, use this options to specify how to cache it
# Set Expiration seconds to ZERO if you want them not to expire.
# RESULT_STORAGE = 'thumbor.result_storages.file_storage'
# RESULT_STORAGE_EXPIRATION_SECONDS = 60 * 60 * 24 # one day
# RESULT_STORAGE_FILE_STORAGE_ROOT_PATH = '/tmp/thumbor/result_storage'

default['thumbor']['options']['RESULT_STORAGE_STORES_UNSAFE'] = false

# stores the crypto key in each image in the storage
# this is VERY useful to allow changing the security key
default['thumbor']['options']['STORES_CRYPTO_KEY_FOR_EACH_IMAGE'] = true

# imaging engine to use to process images
# OpenCV will still be used for smart detection when PIL is the engine
# but does not support flipping when used as the engine.
# ENGINE = 'graphicsmagick_engine'
# ENGINE = 'opencv_engine'
default['thumbor']['options']['ENGINE'] = 'thumbor.engines.pil'

# detectors to use to find Focal Points in the image
# more about detectors can be found in thumbor's docs
# at https://github.com/globocom/thumbor/wiki
default['thumbor']['options']['DETECTORS'] = []

# Redis parameters for queued detectors
default['thumbor']['options']['REDIS_QUEUE_SERVER_HOST'] = '127.0.0.1'
default['thumbor']['options']['REDIS_QUEUE_SERVER_PORT'] = 6379
default['thumbor']['options']['REDIS_QUEUE_SERVER_DB'] = 0
default['thumbor']['options']['REDIS_QUEUE_SERVER_PASSWORD'] = 'None'

default['thumbor']['options']['AUTO_WEBP'] = true

# if you use face detection this is the file that
# OpenCV will use to find faces. The default should be
# fine, so change this at your own peril.
# if you set a relative path it will be relative to
# the thumbor/detectors/face_detector folder
# FACE_DETECTOR_CASCADE_FILE = 'haarcascade_frontalface_alt.xml'

# this is the security key used to encrypt/decrypt urls.
# make sure this is unique and not well-known
# This can be any string of up to 16 characters
# Only used if keyfile is not specified in /etc/default/thumbor
# SECURITY_KEY = 'MY_SECURE_KEY'

# Mixed storage classes. Change them to the fullname of the
# storage you desire for each operation.
# MIXED_STORAGE_FILE_STORAGE = 'thumbor.storages.file_storage'
# MIXED_STORAGE_CRYPTO_STORAGE = 'thumbor.storages.no_storage'
# MIXED_STORAGE_DETECTOR_STORAGE = 'thumbor.storages.no_storage'

default['thumbor']['options']['FILTERS'] = [
  'thumbor.filters.brightness',
  'thumbor.filters.contrast',
  'thumbor.filters.rgb',
  'thumbor.filters.round_corner',
  'thumbor.filters.quality',
  'thumbor.filters.noise',
  'thumbor.filters.watermark',
  'thumbor.filters.equalize',
  'thumbor.filters.fill',
  'thumbor.filters.sharpen',
  'thumbor.filters.strip_icc',
  'thumbor.filters.frame',

  # can only be applied if there are already points for the image being served
  # this means that either you are using the local face detector or the image
  # has already went through remote detection
  # 'thumbor.filters.redeye',
]
