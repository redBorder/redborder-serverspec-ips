# frozen_string_literal: true

require 'set'
require 'spec_helper'
set :os, family: 'redhat', release: '9', arch: 'x86_64'

# TODO: Change it to 'redborder'
describe user('redBorder') do
  it { should exist }
  it { should have_login_shell '/bin/bash' }
end
