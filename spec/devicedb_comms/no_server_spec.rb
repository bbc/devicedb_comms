# Verify that sensible responses are returned when no server is configured

require 'spec_helper'
require 'devicedb_comms'
require 'devicedb_comms/device'

describe DeviceDBComms::Device do
  before(:each) do
    DeviceDBComms.configure do |config|
      config.url = nil
    end
  end

  let(:devicedb) { DeviceDBComms::Device.new }

  describe '#find' do
    it 'find returns error' do
      expect(devicedb.find(1)).to eq({ 'error' => 'No DeviceDB connection' })
    end
  end

  describe '#register' do
    it 'register returns error' do
      expect(devicedb.register({ 'param1' => 'var1' })).to eq({ 'error' => 'No DeviceDB connection' })
    end
  end

  describe '#edit' do
    it 'edit returns error' do
      expect(devicedb.edit(1, { 'param1' => 'var1' })).to eq({ 'error' => 'No DeviceDB connection' })
    end
  end

  describe '#poll' do
    it 'poll returns error' do
      expect(devicedb.poll(1)).to eq({ 'error' => 'No DeviceDB connection' })
    end

    it 'status update returns error' do
      expect(devicedb.edit(1, 'idle')).to eq({ 'error' => 'No DeviceDB connection' })
    end
  end

end
