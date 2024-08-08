# frozen_string_literal: true

require 'spec_helper'
set :os, family: 'redhat', release: '9', arch: 'x86_64'

instances_group = %w[0] # This is the default name of the first instances group

describe 'Snort config' do
  instances_group.each do |group|
    describe file("/etc/snort/#{group}/snort.conf") do
      it { should exist }
      it { should be_file }
      it { should be_readable }
    end
  end
end
