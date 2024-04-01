use types::c;

export type Joystick     = opaque;
export type JoystickGUID = GUID;
export type JoystickID   = i32;

export type JoystickType = enum {
	JOYSTICK_TYPE_UNKNOWN,
	JOYSTICK_TYPE_GAMECONTROLLER,
	JOYSTICK_TYPE_WHEEL,
	JOYSTICK_TYPE_ARCADE_STICK,
	JOYSTICK_TYPE_FLIGHT_STICK,
	JOYSTICK_TYPE_DANCE_PAD,
	JOYSTICK_TYPE_GUITAR,
	JOYSTICK_TYPE_DRUM_KIT,
	JOYSTICK_TYPE_ARCADE_PAD,
	JOYSTICK_TYPE_THROTTLE,
};

export type JoystickPowerLevel = enum {
	JOYSTICK_POWER_UNKNOWN = -1,
	JOYSTICK_POWER_EMPTY,
	JOYSTICK_POWER_LOW,
	JOYSTICK_POWER_MEDIUM,
	JOYSTICK_POWER_FULL,
	JOYSTICK_POWER_WIRED,
	JOYSTICK_POWER_MAX,
};

export @symbol("SDL_NumJoysticks"                    ) fn NumJoysticks() int;
export @symbol("SDL_JoystickNameForIndex"            ) fn JoystickNameForIndex(device_index: int) const*c::char;
export @symbol("SDL_JoystickPathForIndex"            ) fn JoystickPathForIndex(device_index: int) const*c::char;
export @symbol("SDL_JoystickGetDevicePlayerIndex"    ) fn JoystickGetDevicePlayerIndex(device_index: int) int;
export @symbol("SDL_JoystickGetDeviceGUID"           ) fn JoystickGetDeviceGUID(device_index: int) JoystickGUID;
export @symbol("SDL_JoystickGetDeviceVendor"         ) fn JoystickGetDeviceVendor(device_index: int) u16;
export @symbol("SDL_JoystickGetDeviceProduct"        ) fn JoystickGetDeviceProduct(device_index: int) u16;
export @symbol("SDL_JoystickGetDeviceProductVersion" ) fn JoystickGetDeviceProductVersion(device_index: int) u16;
export @symbol("SDL_JoystickGetDeviceType"           ) fn JoystickGetDeviceType(device_index: int) JoystickType;
export @symbol("SDL_JoystickGetDeviceInstanceID"     ) fn JoystickGetDeviceInstanceID(device_index: int) JoystickID;
export @symbol("SDL_JoystickOpen"                    ) fn JoystickOpen(device_index: int) *Joystick;
export @symbol("SDL_JoystickFromInstanceID"          ) fn JoystickFromInstanceID(instance_id: JoystickID) *Joystick;
export @symbol("SDL_JoystickFromPlayerIndex"         ) fn JoystickFromPlayerIndex(player_index: int) *Joystick;
export @symbol("SDL_JoystickAttachVirtual"           ) fn JoystickAttachVirtual(_type: JoystickType, naxes: int, nbuttons: int, nhats: int) int;

export type VirtualJoystickDesc = struct {
	version:     u16,
	_type:        u16,
	naxes:       u16,
	nbuttons:    u16,
	nhats:       u16,
	vendor_id:   u16,
	product_id:  u16,
	padding:     u16,
	button_mask: u32,
	axis_mask:   u32,
	name:        const*c::char,
	userdata:    *opaque,
	Update:         *fn(userdata: *opaque) void,
	SetPlayerIndex: *fn(userdata: *opaque, player_index: int) void,
	Rumble:         *fn(userdata: *opaque, low_frequency_rumble: u16, high_frequency_rumble: u16) int,
	RumbleTriggers: *fn(userdata: *opaque, left_rumble: u16, right_rumble: u16) int,
	SetLED:         *fn(userdata: *opaque, red: u8, green: u8, blue: u8) int,
	SendEffect:     *fn(userdata: *opaque, data: const*opaque, _size: int) int,
};

export @symbol("SDL_JoystickAttachVirtualEx"     ) fn JoystickAttachVirtualEx(desc: const*VirtualJoystickDesc) int;
export @symbol("SDL_JoystickDetachVirtual"       ) fn JoystickDetachVirtual(device_index: int) int;
export @symbol("SDL_JoystickIsVirtual"           ) fn JoystickIsVirtual(device_index: int) Bool;
export @symbol("SDL_JoystickSetVirtualAxis"      ) fn JoystickSetVirtualAxis(joystick: *Joystick, axis: int, value: i16) int;
export @symbol("SDL_JoystickSetVirtualButton"    ) fn JoystickSetVirtualButton(joystick: *Joystick, button: int, value: u8) int;
export @symbol("SDL_JoystickSetVirtualHat"       ) fn JoystickSetVirtualHat(joystick: *Joystick, hat: int, value: u8) int;
export @symbol("SDL_JoystickName"                ) fn JoystickName(joystick: *Joystick) const*c::char;
export @symbol("SDL_JoystickPath"                ) fn JoystickPath(joystick: *Joystick) const*c::char;
export @symbol("SDL_JoystickGetPlayerIndex"      ) fn JoystickGetPlayerIndex(joystick: *Joystick) int;
export @symbol("SDL_JoystickSetPlayerIndex"      ) fn JoystickSetPlayerIndex(joystick: *Joystick, player_index: int) void;
export @symbol("SDL_JoystickGetGUID"             ) fn JoystickGetGUID(joystick: *Joystick) JoystickGUID;
export @symbol("SDL_JoystickGetVendor"           ) fn JoystickGetVendor(joystick: *Joystick) u16;
export @symbol("SDL_JoystickGetProduct"          ) fn JoystickGetProduct(joystick: *Joystick) u16;
export @symbol("SDL_JoystickGetProductVersion"   ) fn JoystickGetProductVersion(joystick: *Joystick) u16;
export @symbol("SDL_JoystickGetFirmwareVersion"  ) fn JoystickGetFirmwareVersion(joystick: *Joystick) u16;
export @symbol("SDL_JoystickGetSerial"           ) fn JoystickGetSerial(joystick: *Joystick) const*c::char;
export @symbol("SDL_JoystickGetType"             ) fn JoystickGetType(joystick: *Joystick) JoystickType;
export @symbol("SDL_JoystickGetGUIDString"       ) fn JoystickGetGUIDString(guid: JoystickGUID, pszGUID: *c::char, cbGUID: int) void;
export @symbol("SDL_JoystickGetGUIDFromString"   ) fn JoystickGetGUIDFromString(pchGUID: const*c::char) JoystickGUID;
export @symbol("SDL_GetJoystickGUIDInfo"         ) fn GetJoystickGUIDInfo(guid: JoystickGUID, vendor: *u16, product: *u16, version: *u16, crc16: *u16) void;
export @symbol("SDL_JoystickGetAttached"         ) fn JoystickGetAttached(joystick: *Joystick) Bool;
export @symbol("SDL_JoystickInstanceID"          ) fn JoystickInstanceID(joystick: *Joystick) JoystickID;
export @symbol("SDL_JoystickNumAxes"             ) fn JoystickNumAxes(joystick: *Joystick) int;
export @symbol("SDL_JoystickNumBalls"            ) fn JoystickNumBalls(joystick: *Joystick) int;
export @symbol("SDL_JoystickNumHats"             ) fn JoystickNumHats(joystick: *Joystick) int;
export @symbol("SDL_JoystickNumButtons"          ) fn JoystickNumButtons(joystick: *Joystick) int;
export @symbol("SDL_JoystickUpdate"              ) fn JoystickUpdate() void;
export @symbol("SDL_JoystickEventState"          ) fn JoystickEventState(state: int) int;
export @symbol("SDL_JoystickGetAxis"             ) fn JoystickGetAxis(joystick: *Joystick, axis: int) i16;
export @symbol("SDL_JoystickGetAxisInitialState" ) fn JoystickGetAxisInitialState(joystick: *Joystick, axis: int, state: *i16) Bool;
export @symbol("SDL_JoystickGetHat"              ) fn JoystickGetHat(joystick: *Joystick, hat: int) u8;
export @symbol("SDL_JoystickGetBall"             ) fn JoystickGetBall(joystick: *Joystick, ball: int, dx: *int, dy: *int) int;
export @symbol("SDL_JoystickGetButton"           ) fn JoystickGetButton(joystick: *Joystick, button: int) u8;
export @symbol("SDL_JoystickRumble"              ) fn JoystickRumble(joystick: *Joystick, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_JoystickRumbleTriggers"      ) fn JoystickRumbleTriggers(joystick: *Joystick, left_rumble: u16, right_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_JoystickHasLED"              ) fn JoystickHasLED(joystick: *Joystick) Bool;
export @symbol("SDL_JoystickHasRumble"           ) fn JoystickHasRumble(joystick: *Joystick) Bool;
export @symbol("SDL_JoystickHasRumbleTriggers"   ) fn JoystickHasRumbleTriggers(joystick: *Joystick) Bool;
export @symbol("SDL_JoystickSetLED"              ) fn JoystickSetLED(joystick: *Joystick, red: u8, green: u8, blue: u8) int;
export @symbol("SDL_JoystickSendEffect"          ) fn JoystickSendEffect(joystick: *Joystick, data: const*opaque, _size: int) int;
export @symbol("SDL_JoystickClose"               ) fn JoystickClose(joystick: *Joystick) void;
export @symbol("SDL_JoystickCurrentPowerLevel"   ) fn JoystickCurrentPowerLevel(joystick: *Joystick) JoystickPowerLevel;
