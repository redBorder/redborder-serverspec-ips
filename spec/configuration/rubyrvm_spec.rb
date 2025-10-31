# frozen_string_literal: true

require 'spec_helper'
set :os, family: 'redhat', release: '9', arch: 'x86_64'

describe file('/usr/lib/redborder/bin/rb_rubywrapper.sh'), :rubywrapper do
  it { should exist }
  it { should be_file }
  it { should be_executable }
end

describe 'Script behavior with -c argument', :rubywrapper do
  it 'runs script with only -c argument' do
    cmd = '/usr/lib/redborder/bin/rb_rubywrapper.sh -c'
    result = command(cmd)
    expect(result.exit_status).to eq(0)
  end
end
