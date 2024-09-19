# frozen_string_literal: true

require 'spec_helper'
set :os, family: 'redhat', release: '9', arch: 'x86_64'

interfaces = command('ip link show | grep "^[0-9]" | cut -d" " -f2 | sed "s/:$//"').stdout.split("\n")

describe 'All interfaces: ' do
  interfaces.each do |interface|
    describe interface(interface) do
      it { should exist }
      # it { should be_up }
    end
  end
end

describe 'At least one non-loopback interface' do
  it 'should exist and be up' do
    non_loopback_interfaces = interfaces.reject { |iface| iface == 'lo' }
    expect(non_loopback_interfaces).not_to be_empty

    working_interface = non_loopback_interfaces.find do |iface|
      interface(iface).exists? && interface(iface).up?
    end

    expect(working_interface).not_to be_nil
  end
end
