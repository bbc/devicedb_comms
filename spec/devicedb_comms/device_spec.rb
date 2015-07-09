require 'spec_helper'
require 'devicedb_comms'
require 'devicedb_comms/device'

describe DeviceDBComms::Device do
  before(:each) do
    DeviceDBComms.configure do |config|
      config.url = 'http://devicedb.test'
    end
  end

  let(:devicedb) { DeviceDBComms::Device.new }

  describe '#get_application' do
    it 'returns the application of a device' do
      stub_request(:get, 'http://devicedb.test/devices/1/application.json').to_return(
        status: 200,
        body: '{"application":"Test application"}'
      )
      expect(devicedb.get_application(1)).to eq 'Test application'
    end
  end

  describe '#find_disconnected_by_type' do
    it 'returns an empty array with network error' do
      stub_request(:post, 'http://devicedb.test/devices/search.json').to_timeout     
      expect(devicedb.find_disconnected_by_type('tv')).to include('devices' => [])
    end

    it 'returns an array containing a single device' do
      stub_request(:post, 'http://devicedb.test/devices/search.json').to_return(
        status: 200,
        body: '{"devices":[{"id":1}]}'
      )
      expect(devicedb.find_disconnected_by_type('tv')).to include('devices' => [{'id' => 1}])
    end

    it 'returns an array containing two devices' do
      stub_request(:post, 'http://devicedb.test/devices/search.json').to_return(
        status: 200,
        body: '{"devices":[{"id":1},{"id":2}]}'
      )
      expect(devicedb.find_disconnected_by_type('tv')).to include('devices' => [{'id' => 1}, {'id' => 2}])
    end

    it 'returns an array containing correct devices' do
      stub_request(:post, 'http://devicedb.test/devices/search.json').with(body: "device_type=tv&hive_id=-1&status=idle").to_return(
        status: 200,
        body: '{"devices":[{"id":1}]}'
      )
      stub_request(:post, 'http://devicedb.test/devices/search.json').with(body: "device_type=mobile&hive_id=-1&status=idle").to_return(
        status: 200,
        body: '{"devices":[{"id":2}]}'
      )
      expect(devicedb.find_disconnected_by_type('tv')).to include('devices' => [{'id' => 1}])
    end
  end
end
