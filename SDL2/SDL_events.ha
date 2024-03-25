use types::c;

export type SDL_EventType = enum {
	SDL_FIRSTEVENT = 0,
	SDL_QUIT = 0x100,
	SDL_APP_TERMINATING,
	SDL_APP_LOWMEMORY,
	SDL_APP_WILLENTERBACKGROUND,
	SDL_APP_DIDENTERBACKGROUND,
	SDL_APP_WILLENTERFOREGROUND,
	SDL_APP_DIDENTERFOREGROUND,
	SDL_LOCALECHANGED,
	SDL_DISPLAYEVENT = 0x150,
	SDL_WINDOWEVENT = 0x200,
	SDL_SYSWMEVENT,
	SDL_KEYDOWN = 0x300,
	SDL_KEYUP,
	SDL_TEXTEDITING,
	SDL_TEXTINPUT,
	SDL_KEYMAPCHANGED,
	SDL_TEXTEDITING_EXT,
	SDL_MOUSEMOTION = 0x400,
	SDL_MOUSEBUTTONDOWN,
	SDL_MOUSEBUTTONUP,
	SDL_MOUSEWHEEL,
	SDL_JOYAXISMOTION = 0x600,
	SDL_JOYBALLMOTION,
	SDL_JOYHATMOTION,
	SDL_JOYBUTTONDOWN,
	SDL_JOYBUTTONUP,
	SDL_JOYDEVICEADDED,
	SDL_JOYDEVICEREMOVED,
	SDL_JOYBATTERYUPDATED,
	SDL_CONTROLLERAXISMOTION = 0x650,
	SDL_CONTROLLERBUTTONDOWN,
	SDL_CONTROLLERBUTTONUP,
	SDL_CONTROLLERDEVICEADDED,
	SDL_CONTROLLERDEVICEREMOVED,
	SDL_CONTROLLERDEVICEREMAPPED,
	SDL_CONTROLLERTOUCHPADDOWN,
	SDL_CONTROLLERTOUCHPADMOTION,
	SDL_CONTROLLERTOUCHPADUP,
	SDL_CONTROLLERSENSORUPDATE,
	SDL_CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3,
	SDL_CONTROLLERSTEAMHANDLEUPDATED,
	SDL_FINGERDOWN = 0x700,
	SDL_FINGERUP,
	SDL_FINGERMOTION,
	SDL_DOLLARGESTURE = 0x800,
	SDL_DOLLARRECORD,
	SDL_MULTIGESTURE,
	SDL_CLIPBOARDUPDATE = 0x900,
	SDL_DROPFILE = 0x1000,
	SDL_DROPTEXT,
	SDL_DROPBEGIN,
	SDL_DROPCOMPLETE,
	SDL_AUDIODEVICEADDED = 0x1100,
	SDL_AUDIODEVICEREMOVED,
	SDL_SENSORUPDATE = 0x1200,
	SDL_RENDER_TARGETS_RESET = 0x2000,
	SDL_RENDER_DEVICE_RESET,
	SDL_POLLSENTINEL = 0x7F00,
	SDL_USEREVENT = 0x8000,
	SDL_LASTEVENT = 0xFFFF,
};

export type SDL_CommonEvent = struct {
	_type:     u32,
	timestamp: u32,
};

export type SDL_DisplayEvent = struct {
	_type:     u32,
	timestamp: u32,
	display:   u32,
	event:     u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	data1:     i32,
};

export type SDL_WindowEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	event:     u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	data1:     i32,
	data2:     i32,
};

export type SDL_KeyboardEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	state:     u8,
	repeat:    u8,
	padding2:  u8,
	padding3:  u8,
	keysym:    SDL_Keysym,
};

export type SDL_TextEditingEvent = struct {
	_type:      u32,
	timestamp:  u32,
	windowID:   u32,
	text:       [32]c::char,
	start:      i32,
	length:     i32,
};

export type SDL_TextEditingExtEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	text:      *c::char,
	start:     i32,
	length:    i32,
};

export type SDL_TextInputEvent = struct {
	_type:      u32,
	timestamp: u32,
	windowID:  u32,
	text:      [32]c::char,
};

export type SDL_MouseMotionEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	which:     u32,
	state:     u32,
	x:         i32,
	y:         i32,
	xrel:      i32,
	yrel:      i32,
};

export type SDL_MouseButtonEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	which:     u32,
	button:    u8,
	state:     u8,
	clicks:    u8,
	padding1:  u8,
	x:         i32,
	y:         i32,
};

export type SDL_MouseWheelEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	which:     u32,
	x:         i32,
	y:         i32,
	direction: u32,
	preciseX:  f32,
	preciseY:  f32,
	mouseX:    i32,
	mouseY:    i32,
};

export type SDL_JoyAxisEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	axis:      u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	value:     i16,
	padding4:  u16,
};

export type SDL_JoyBallEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	ball:      u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	xrel:      i16,
	yrel:      i16,
};

export type SDL_JoyHatEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	hat:       u8,
	value:     u8,
	padding1:  u8,
	padding2:  u8,
};

export type SDL_JoyButtonEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	button:    u8,
	state:     u8,
	padding1:  u8,
	padding2:  u8,
};

export type SDL_JoyDeviceEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     i32,
};

export type SDL_JoyBatteryEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	level:     SDL_JoystickPowerLevel,
};

export type SDL_ControllerAxisEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	axis:      u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	value:     i16,
	padding4:  u16,
};

export type SDL_ControllerButtonEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	button:    u8,
	state:     u8,
	padding1:  u8,
	padding2:  u8,
};

export type SDL_ControllerDeviceEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     i32,
};

export type SDL_ControllerTouchpadEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     SDL_JoystickID,
	touchpad:  i32,
	finger:    i32,
	x:         f32,
	y:         f32,
	pressure:  f32,
};

export type SDL_ControllerSensorEvent = struct {
	_type:        u32,
	timestamp:    u32,
	which:        SDL_JoystickID,
	sensor:       i32,
	data:         [3]f32,
	timestamp_us: u64,
};

export type SDL_AudioDeviceEvent = struct {
	_type:     u32,
	timestamp: u32,
	which:     u32,
	iscapture: u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
};

export type SDL_TouchFingerEvent = struct {
	_type:     u32,
	timestamp: u32,
	touchId:   SDL_TouchID,
	fingerId:  SDL_FingerID,
	x:         f32,
	y:         f32,
	dx:        f32,
	dy:        f32,
	pressure:  f32,
	windowID:  u32,
};

export type SDL_MultiGestureEvent = struct {
	_type:      u32,
	timestamp:  u32,
	touchId:    SDL_TouchID,
	dTheta:     f32,
	dDist:      f32,
	x:          f32,
	y:          f32,
	numFingers: u16,
	padding:    u16,
};

export type SDL_DollarGestureEvent = struct {
	_type:      u32,
	timestamp:  u32,
	touchId:    SDL_TouchID,
	gestureId:  SDL_GestureID,
	numFingers: u32,
	error:      f32,
	x:          f32,
	y:          f32,
};

export type SDL_DropEvent = struct {
	_type:     u32,
	timestamp: u32,
	file:      *c::char,
	windowID:  u32,
};

export type SDL_SensorEvent = struct {
	_type:        u32,
	timestamp:    u32,
	which:        i32,
	data:         [6]f32,
	timestamp_us: u64,
};

export type SDL_QuitEvent = struct {
	_type:     u32,
	timestamp: u32,
};

export type SDL_UserEvent = struct {
	_type:     u32,
	timestamp: u32,
	windowID:  u32,
	code:      i32,
	data1:     *opaque,
	data2:     *opaque,
};

export type SDL_SysWMEvent = struct {
	_type:     u32,
	timestamp: u32,
	msg:       *SDL_SysWMmsg,
};

export type SDL_Event = union {
	_type:     u32,
	common:    SDL_CommonEvent,
	display:   SDL_DisplayEvent,
	window:    SDL_WindowEvent,
	key:       SDL_KeyboardEvent,
	edit:      SDL_TextEditingEvent,
	editExt:   SDL_TextEditingExtEvent,
	text:      SDL_TextInputEvent,
	motion:    SDL_MouseMotionEvent,
	button:    SDL_MouseButtonEvent,
	wheel:     SDL_MouseWheelEvent,
	jaxis:     SDL_JoyAxisEvent,
	jball:     SDL_JoyBallEvent,
	jhat:      SDL_JoyHatEvent,
	jbutton:   SDL_JoyButtonEvent,
	jdevice:   SDL_JoyDeviceEvent,
	jbattery:  SDL_JoyBatteryEvent,
	caxis:     SDL_ControllerAxisEvent,
	cbutton:   SDL_ControllerButtonEvent,
	cdevice:   SDL_ControllerDeviceEvent,
	ctouchpad: SDL_ControllerTouchpadEvent,
	csensor:   SDL_ControllerSensorEvent,
	adevice:   SDL_AudioDeviceEvent,
	sensor:    SDL_SensorEvent,
	quit:      SDL_QuitEvent,
	user:      SDL_UserEvent,
	syswm:     SDL_SysWMEvent,
	tfinger:   SDL_TouchFingerEvent,
	mgesture:  SDL_MultiGestureEvent,
	dgesture:  SDL_DollarGestureEvent,
	drop:      SDL_DropEvent,
	padding:   [56]u8,
};

export @symbol("SDL_PumpEvents") fn PumpEvents() void;

export type SDL_eventaction = enum {
	SDL_ADDEVENT,
	SDL_PEEKEVENT,
	SDL_GETEVENT,
};

export type SDL_EventFilter = *fn(userdata: *opaque, event: *SDL_Event) int;

export @symbol("SDL_PeepEvents"       ) fn PeepEvents(events: *SDL_Event, numevents: int, action: SDL_eventaction, minType: u32, maxType: u32) int;
export @symbol("SDL_HasEvent"         ) fn HasEvent(_type: u32) SDL_bool;
export @symbol("SDL_HasEvents"        ) fn HasEvents(minType: u32, maxType: u32) SDL_bool;
export @symbol("SDL_FlushEvent"       ) fn FlushEvent(_type: u32) void;
export @symbol("SDL_FlushEvents"      ) fn FlushEvents(minType: u32, maxType: u32) void;
export @symbol("SDL_PollEvent"        ) fn PollEvent(event: *SDL_Event) int;
export @symbol("SDL_WaitEvent"        ) fn WaitEvent(event: *SDL_Event) int;
export @symbol("SDL_WaitEventTimeout" ) fn WaitEventTimeout(event: *SDL_Event, timeout: int) int;
export @symbol("SDL_PushEvent"        ) fn PushEvent(event: *SDL_Event) int;
export @symbol("SDL_SetEventFilter"   ) fn SetEventFilter(filter: SDL_EventFilter, userdata: *opaque) void;
export @symbol("SDL_GetEventFilter"   ) fn GetEventFilter(filter: *SDL_EventFilter, userdata: **opaque) SDL_bool;
export @symbol("SDL_AddEventWatch"    ) fn AddEventWatch(filter: SDL_EventFilter, userdata: *opaque) void;
export @symbol("SDL_DelEventWatch"    ) fn DelEventWatch(filter: SDL_EventFilter, userdata: *opaque) void;
export @symbol("SDL_FilterEvents"     ) fn FilterEvents(filter: SDL_EventFilter, userdata: *opaque) void;
export @symbol("SDL_EventState"       ) fn EventState(_type: u32, state: int) u8;
export @symbol("SDL_RegisterEvents"   ) fn RegisterEvents(numevents: int) u32;
