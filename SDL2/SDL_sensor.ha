use types::c;

export type SDL_Sensor = opaque;

export type SDL_SensorID = i32;

export type SDL_SensorType = enum {
	SDL_SENSOR_INVALID = -1,
	SDL_SENSOR_UNKNOWN,
	SDL_SENSOR_ACCEL,
	SDL_SENSOR_GYRO,
	SDL_SENSOR_ACCEL_L,
	SDL_SENSOR_GYRO_L,
	SDL_SENSOR_ACCEL_R,
	SDL_SENSOR_GYRO_R
};

export @symbol("SDL_LockSensors"                    ) fn LockSensors() void;
export @symbol("SDL_UnlockSensors"                  ) fn UnlockSensors() void;
export @symbol("SDL_NumSensors"                     ) fn NumSensors() int;
export @symbol("SDL_SensorGetDeviceName"            ) fn SensorGetDeviceName(device_index: int) const*c::char;
export @symbol("SDL_SensorGetDeviceType"            ) fn SensorGetDeviceType(device_index: int) SDL_SensorType;
export @symbol("SDL_SensorGetDeviceNonPortableType" ) fn SensorGetDeviceNonPortableType(device_index: int) int;
export @symbol("SDL_SensorGetDeviceInstanceID"      ) fn SensorGetDeviceInstanceID(device_index: int) SDL_SensorID;
export @symbol("SDL_SensorOpen"                     ) fn SensorOpen(device_index: int) *SDL_Sensor;
export @symbol("SDL_SensorFromInstanceID"           ) fn SensorFromInstanceID(instance_id: SDL_SensorID) *SDL_Sensor;
export @symbol("SDL_SensorGetName"                  ) fn SensorGetName(sensor: *SDL_Sensor) const*c::char;
export @symbol("SDL_SensorGetType"                  ) fn SensorGetType(sensor: *SDL_Sensor) SDL_SensorType;
export @symbol("SDL_SensorGetNonPortableType"       ) fn SensorGetNonPortableType(sensor: *SDL_Sensor) int;
export @symbol("SDL_SensorGetInstanceID"            ) fn SensorGetInstanceID(sensor: *SDL_Sensor) SDL_SensorID;
export @symbol("SDL_SensorGetData"                  ) fn SensorGetData(sensor: *SDL_Sensor, data: *f32, num_values: int) int;
export @symbol("SDL_SensorGetDataWithTimestamp"     ) fn SensorGetDataWithTimestamp(sensor: *SDL_Sensor, timestamp: *u64, data: *f32, num_values: int) int;
export @symbol("SDL_SensorClose"                    ) fn SensorClose(sensor: *SDL_Sensor) void;
export @symbol("SDL_SensorUpdate"                   ) fn SensorUpdate() void;
