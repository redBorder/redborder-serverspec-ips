# frozen_string_literal: true

require 'spec_helper'
set :os, family: 'redhat', release: '9', arch: 'x86_64'

instances_group = %w[0] # This is the default name of the first instances group

describe 'Barnyard2 config' do
  file_path = '/etc/snort/0/barnyard2.conf'
  if File.exist?(file_path)
    skip("File #{file_path} does not exist, but is expected to exist on running state")
  else
    instances_group.each do |group|
      file_path = "/etc/snort/#{group}/barnyard2.conf"
      describe file(file_path) do
        it { should exist }
        it { should be_file }
        it { should be_readable }
      end
    end
  end
end
