use types::c;

export type SDL_TouchID  = i64;
export type SDL_FingerID = i64;

export type SDL_TouchDeviceType = enum {
	SDL_TOUCH_DEVICE_INVALID = -1,
	SDL_TOUCH_DEVICE_DIRECT,
	SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
	SDL_TOUCH_DEVICE_INDIRECT_RELATIVE,
};

export type SDL_Finger = struct {
	id:       SDL_FingerID,
	x:        f32,
	y:        f32,
	pressure: f32,
};

export @symbol("SDL_GetNumTouchDevices" ) fn GetNumTouchDevices() int;
export @symbol("SDL_GetTouchDevice"     ) fn GetTouchDevice(index: int) SDL_TouchID;
export @symbol("SDL_GetTouchName"       ) fn GetTouchName(index: int) const*c::char;
export @symbol("SDL_GetTouchDeviceType" ) fn GetTouchDeviceType(touchID: SDL_TouchID) SDL_TouchDeviceType;
export @symbol("SDL_GetNumTouchFingers" ) fn GetNumTouchFingers(touchID: SDL_TouchID) int;
export @symbol("SDL_GetTouchFinger"     ) fn GetTouchFinger(touchID: SDL_TouchID, index: int) *SDL_Finger;
