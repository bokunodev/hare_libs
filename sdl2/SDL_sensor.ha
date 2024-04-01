use types::c;

export type Sensor = opaque;

export type SensorID = i32;

export type SensorType = enum {
	SENSOR_INVALID = -1,
	SENSOR_UNKNOWN,
	SENSOR_ACCEL,
	SENSOR_GYRO,
	SENSOR_ACCEL_L,
	SENSOR_GYRO_L,
	SENSOR_ACCEL_R,
	SENSOR_GYRO_R
};

export @symbol("SDL_LockSensors"                    ) fn LockSensors() void;
export @symbol("SDL_UnlockSensors"                  ) fn UnlockSensors() void;
export @symbol("SDL_NumSensors"                     ) fn NumSensors() int;
export @symbol("SDL_SensorGetDeviceName"            ) fn SensorGetDeviceName(device_index: int) const*c::char;
export @symbol("SDL_SensorGetDeviceType"            ) fn SensorGetDeviceType(device_index: int) SensorType;
export @symbol("SDL_SensorGetDeviceNonPortableType" ) fn SensorGetDeviceNonPortableType(device_index: int) int;
export @symbol("SDL_SensorGetDeviceInstanceID"      ) fn SensorGetDeviceInstanceID(device_index: int) SensorID;
export @symbol("SDL_SensorOpen"                     ) fn SensorOpen(device_index: int) *Sensor;
export @symbol("SDL_SensorFromInstanceID"           ) fn SensorFromInstanceID(instance_id: SensorID) *Sensor;
export @symbol("SDL_SensorGetName"                  ) fn SensorGetName(sensor: *Sensor) const*c::char;
export @symbol("SDL_SensorGetType"                  ) fn SensorGetType(sensor: *Sensor) SensorType;
export @symbol("SDL_SensorGetNonPortableType"       ) fn SensorGetNonPortableType(sensor: *Sensor) int;
export @symbol("SDL_SensorGetInstanceID"            ) fn SensorGetInstanceID(sensor: *Sensor) SensorID;
export @symbol("SDL_SensorGetData"                  ) fn SensorGetData(sensor: *Sensor, data: *f32, num_values: int) int;
export @symbol("SDL_SensorGetDataWithTimestamp"     ) fn SensorGetDataWithTimestamp(sensor: *Sensor, timestamp: *u64, data: *f32, num_values: int) int;
export @symbol("SDL_SensorClose"                    ) fn SensorClose(sensor: *Sensor) void;
export @symbol("SDL_SensorUpdate"                   ) fn SensorUpdate() void;
