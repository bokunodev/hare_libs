use types::c;

export type SDL_Joystick     = opaque;
export type SDL_JoystickGUID = SDL_GUID;
export type SDL_JoystickID   = i32;

export type SDL_JoystickType = enum {
	SDL_JOYSTICK_TYPE_UNKNOWN,
	SDL_JOYSTICK_TYPE_GAMECONTROLLER,
	SDL_JOYSTICK_TYPE_WHEEL,
	SDL_JOYSTICK_TYPE_ARCADE_STICK,
	SDL_JOYSTICK_TYPE_FLIGHT_STICK,
	SDL_JOYSTICK_TYPE_DANCE_PAD,
	SDL_JOYSTICK_TYPE_GUITAR,
	SDL_JOYSTICK_TYPE_DRUM_KIT,
	SDL_JOYSTICK_TYPE_ARCADE_PAD,
	SDL_JOYSTICK_TYPE_THROTTLE,
};

export type SDL_JoystickPowerLevel = enum {
	SDL_JOYSTICK_POWER_UNKNOWN = -1,
	SDL_JOYSTICK_POWER_EMPTY,
	SDL_JOYSTICK_POWER_LOW,
	SDL_JOYSTICK_POWER_MEDIUM,
	SDL_JOYSTICK_POWER_FULL,
	SDL_JOYSTICK_POWER_WIRED,
	SDL_JOYSTICK_POWER_MAX,
};

export @symbol("SDL_NumJoysticks"                    ) fn NumJoysticks() int;
export @symbol("SDL_JoystickNameForIndex"            ) fn JoystickNameForIndex(device_index: int) const*c::char;
export @symbol("SDL_JoystickPathForIndex"            ) fn JoystickPathForIndex(device_index: int) const*c::char;
export @symbol("SDL_JoystickGetDevicePlayerIndex"    ) fn JoystickGetDevicePlayerIndex(device_index: int) int;
export @symbol("SDL_JoystickGetDeviceGUID"           ) fn JoystickGetDeviceGUID(device_index: int) SDL_JoystickGUID;
export @symbol("SDL_JoystickGetDeviceVendor"         ) fn JoystickGetDeviceVendor(device_index: int) u16;
export @symbol("SDL_JoystickGetDeviceProduct"        ) fn JoystickGetDeviceProduct(device_index: int) u16;
export @symbol("SDL_JoystickGetDeviceProductVersion" ) fn JoystickGetDeviceProductVersion(device_index: int) u16;
export @symbol("SDL_JoystickGetDeviceType"           ) fn JoystickGetDeviceType(device_index: int) SDL_JoystickType;
export @symbol("SDL_JoystickGetDeviceInstanceID"     ) fn JoystickGetDeviceInstanceID(device_index: int) SDL_JoystickID;
export @symbol("SDL_JoystickOpen"                    ) fn JoystickOpen(device_index: int) *SDL_Joystick;
export @symbol("SDL_JoystickFromInstanceID"          ) fn JoystickFromInstanceID(instance_id: SDL_JoystickID) *SDL_Joystick;
export @symbol("SDL_JoystickFromPlayerIndex"         ) fn JoystickFromPlayerIndex(player_index: int) *SDL_Joystick;
export @symbol("SDL_JoystickAttachVirtual"           ) fn JoystickAttachVirtual(_type: SDL_JoystickType, naxes: int, nbuttons: int, nhats: int) int;

export type SDL_VirtualJoystickDesc = struct {
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

export @symbol("SDL_JoystickAttachVirtualEx"     ) fn JoystickAttachVirtualEx(desc: const*SDL_VirtualJoystickDesc) int;
export @symbol("SDL_JoystickDetachVirtual"       ) fn JoystickDetachVirtual(device_index: int) int;
export @symbol("SDL_JoystickIsVirtual"           ) fn JoystickIsVirtual(device_index: int) SDL_bool;
export @symbol("SDL_JoystickSetVirtualAxis"      ) fn JoystickSetVirtualAxis(joystick: *SDL_Joystick, axis: int, value: i16) int;
export @symbol("SDL_JoystickSetVirtualButton"    ) fn JoystickSetVirtualButton(joystick: *SDL_Joystick, button: int, value: u8) int;
export @symbol("SDL_JoystickSetVirtualHat"       ) fn JoystickSetVirtualHat(joystick: *SDL_Joystick, hat: int, value: u8) int;
export @symbol("SDL_JoystickName"                ) fn JoystickName(joystick: *SDL_Joystick) const*c::char;
export @symbol("SDL_JoystickPath"                ) fn JoystickPath(joystick: *SDL_Joystick) const*c::char;
export @symbol("SDL_JoystickGetPlayerIndex"      ) fn JoystickGetPlayerIndex(joystick: *SDL_Joystick) int;
export @symbol("SDL_JoystickSetPlayerIndex"      ) fn JoystickSetPlayerIndex(joystick: *SDL_Joystick, player_index: int) void;
export @symbol("SDL_JoystickGetGUID"             ) fn JoystickGetGUID(joystick: *SDL_Joystick) SDL_JoystickGUID;
export @symbol("SDL_JoystickGetVendor"           ) fn JoystickGetVendor(joystick: *SDL_Joystick) u16;
export @symbol("SDL_JoystickGetProduct"          ) fn JoystickGetProduct(joystick: *SDL_Joystick) u16;
export @symbol("SDL_JoystickGetProductVersion"   ) fn JoystickGetProductVersion(joystick: *SDL_Joystick) u16;
export @symbol("SDL_JoystickGetFirmwareVersion"  ) fn JoystickGetFirmwareVersion(joystick: *SDL_Joystick) u16;
export @symbol("SDL_JoystickGetSerial"           ) fn JoystickGetSerial(joystick: *SDL_Joystick) const*c::char;
export @symbol("SDL_JoystickGetType"             ) fn JoystickGetType(joystick: *SDL_Joystick) SDL_JoystickType;
export @symbol("SDL_JoystickGetGUIDString"       ) fn JoystickGetGUIDString(guid: SDL_JoystickGUID, pszGUID: *c::char, cbGUID: int) void;
export @symbol("SDL_JoystickGetGUIDFromString"   ) fn JoystickGetGUIDFromString(pchGUID: const*c::char) SDL_JoystickGUID;
export @symbol("SDL_GetJoystickGUIDInfo"         ) fn GetJoystickGUIDInfo(guid: SDL_JoystickGUID, vendor: *u16, product: *u16, version: *u16, crc16: *u16) void;
export @symbol("SDL_JoystickGetAttached"         ) fn JoystickGetAttached(joystick: *SDL_Joystick) SDL_bool;
export @symbol("SDL_JoystickInstanceID"          ) fn JoystickInstanceID(joystick: *SDL_Joystick) SDL_JoystickID;
export @symbol("SDL_JoystickNumAxes"             ) fn JoystickNumAxes(joystick: *SDL_Joystick) int;
export @symbol("SDL_JoystickNumBalls"            ) fn JoystickNumBalls(joystick: *SDL_Joystick) int;
export @symbol("SDL_JoystickNumHats"             ) fn JoystickNumHats(joystick: *SDL_Joystick) int;
export @symbol("SDL_JoystickNumButtons"          ) fn JoystickNumButtons(joystick: *SDL_Joystick) int;
export @symbol("SDL_JoystickUpdate"              ) fn JoystickUpdate() void;
export @symbol("SDL_JoystickEventState"          ) fn JoystickEventState(state: int) int;
export @symbol("SDL_JoystickGetAxis"             ) fn JoystickGetAxis(joystick: *SDL_Joystick, axis: int) i16;
export @symbol("SDL_JoystickGetAxisInitialState" ) fn JoystickGetAxisInitialState(joystick: *SDL_Joystick, axis: int, state: *i16) SDL_bool;
export @symbol("SDL_JoystickGetHat"              ) fn JoystickGetHat(joystick: *SDL_Joystick, hat: int) u8;
export @symbol("SDL_JoystickGetBall"             ) fn JoystickGetBall(joystick: *SDL_Joystick, ball: int, dx: *int, dy: *int) int;
export @symbol("SDL_JoystickGetButton"           ) fn JoystickGetButton(joystick: *SDL_Joystick, button: int) u8;
export @symbol("SDL_JoystickRumble"              ) fn JoystickRumble(joystick: *SDL_Joystick, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_JoystickRumbleTriggers"      ) fn JoystickRumbleTriggers(joystick: *SDL_Joystick, left_rumble: u16, right_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_JoystickHasLED"              ) fn JoystickHasLED(joystick: *SDL_Joystick) SDL_bool;
export @symbol("SDL_JoystickHasRumble"           ) fn JoystickHasRumble(joystick: *SDL_Joystick) SDL_bool;
export @symbol("SDL_JoystickHasRumbleTriggers"   ) fn JoystickHasRumbleTriggers(joystick: *SDL_Joystick) SDL_bool;
export @symbol("SDL_JoystickSetLED"              ) fn JoystickSetLED(joystick: *SDL_Joystick, red: u8, green: u8, blue: u8) int;
export @symbol("SDL_JoystickSendEffect"          ) fn JoystickSendEffect(joystick: *SDL_Joystick, data: const*opaque, _size: int) int;
export @symbol("SDL_JoystickClose"               ) fn JoystickClose(joystick: *SDL_Joystick) void;
export @symbol("SDL_JoystickCurrentPowerLevel"   ) fn JoystickCurrentPowerLevel(joystick: *SDL_Joystick) SDL_JoystickPowerLevel;
