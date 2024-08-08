# frozen_string_literal: true

require 'spec_helper'

describe 'Default Route Interface' do
  cmd = "awk '/management_interface:/ { print $2 }' /etc/redborder/rb_init_conf.yml"
  management_interface = command(cmd).stdout.strip

  describe command('ip route show default') do
    its(:stdout) { should match(/default via .* dev #{management_interface}\s/) }
  end
end

describe 'Segment interfaces' do
  it 'should have at least one of br0 or vrbr0' do
    expect(command('ip link show br0').exit_status).to eq 0 or expect(command('ip link show vrbr0').exit_status).to eq 0
  end
end
