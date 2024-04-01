use types::c;

export type TouchID  = i64;
export type FingerID = i64;

export type TouchDeviceType = enum {
	TOUCH_DEVICE_INVALID = -1,
	TOUCH_DEVICE_DIRECT,
	TOUCH_DEVICE_INDIRECT_ABSOLUTE,
	TOUCH_DEVICE_INDIRECT_RELATIVE,
};

export type Finger = struct {
	id:       FingerID,
	x:        f32,
	y:        f32,
	pressure: f32,
};

export @symbol("SDL_GetNumTouchDevices" ) fn GetNumTouchDevices() int;
export @symbol("SDL_GetTouchDevice"     ) fn GetTouchDevice(index: int) TouchID;
export @symbol("SDL_GetTouchName"       ) fn GetTouchName(index: int) const*c::char;
export @symbol("SDL_GetTouchDeviceType" ) fn GetTouchDeviceType(touchID: TouchID) TouchDeviceType;
export @symbol("SDL_GetNumTouchFingers" ) fn GetNumTouchFingers(touchID: TouchID) int;
export @symbol("SDL_GetTouchFinger"     ) fn GetTouchFinger(touchID: TouchID, index: int) *Finger;
