Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

APP_PATH = File.dirname(__FILE__)
$LOAD_PATH << File.join(APP_PATH, '.')

require 'grape'
require 'grape-entity'
require 'json'
require 'yaml'

CONFIG = HashWithIndifferentAccess.new(YAML.safe_load(File.read("#{APP_PATH}/config/config.yml")))