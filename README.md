# DeviceDB Comms

The API for communicating with the Device Database for the Hive

## Usage

Configure with:

```ruby
DeviceDBComms.configure do |config|
  config.url = 'https://devicedb.url'
  config.pem_file = '/location/of/certificate'
  config.ssl_verify_mode = OpenSSL::SSL::VERIFY_PEER
end
```

### Working with a Hive

```ruby
hive = DeviceDBComms::Hive.new()

# Register a new hive
hive.register( hive_name, mac_address, ip_address )

# Find details about a hive
hive.find( hive_id )

# Poll a hive
hive.poll( hive_id )
```

### Working with a Device

```ruby
device = DeviceDBComms::Device.new()

# Register a new device
device.register( device_parameters )

# Find details about a device
device.find( device_id )

# Poll a device
device.poll( device_id )

# Set the current application of a device
device.set_application( device_id, application_name )

# Find the recorded application for a device
device.get_application( device_id )

# Attach a device to a hive
device.hive_connect( device_id, hive_id )

# Detach a device from a hive
device.hive_disconnect( device_id )

# Send an action to a device
device_action( device_id, action_type, action_body, number_of_retries )
```
