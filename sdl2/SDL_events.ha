use types::c;

export type EventType = enum u32 {
	FIRSTEVENT = 0,
	QUIT = 0x100,
	APP_TERMINATING,
	APP_LOWMEMORY,
	APP_WILLENTERBACKGROUND,
	APP_DIDENTERBACKGROUND,
	APP_WILLENTERFOREGROUND,
	APP_DIDENTERFOREGROUND,
	LOCALECHANGED,
	DISPLAYEVENT = 0x150,
	WINDOWEVENT = 0x200,
	SYSWMEVENT,
	KEYDOWN = 0x300,
	KEYUP,
	TEXTEDITING,
	TEXTINPUT,
	KEYMAPCHANGED,
	TEXTEDITING_EXT,
	MOUSEMOTION = 0x400,
	MOUSEBUTTONDOWN,
	MOUSEBUTTONUP,
	MOUSEWHEEL,
	JOYAXISMOTION = 0x600,
	JOYBALLMOTION,
	JOYHATMOTION,
	JOYBUTTONDOWN,
	JOYBUTTONUP,
	JOYDEVICEADDED,
	JOYDEVICEREMOVED,
	JOYBATTERYUPDATED,
	CONTROLLERAXISMOTION = 0x650,
	CONTROLLERBUTTONDOWN,
	CONTROLLERBUTTONUP,
	CONTROLLERDEVICEADDED,
	CONTROLLERDEVICEREMOVED,
	CONTROLLERDEVICEREMAPPED,
	CONTROLLERTOUCHPADDOWN,
	CONTROLLERTOUCHPADMOTION,
	CONTROLLERTOUCHPADUP,
	CONTROLLERSENSORUPDATE,
	CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3,
	CONTROLLERSTEAMHANDLEUPDATED,
	FINGERDOWN = 0x700,
	FINGERUP,
	FINGERMOTION,
	DOLLARGESTURE = 0x800,
	DOLLARRECORD,
	MULTIGESTURE,
	CLIPBOARDUPDATE = 0x900,
	DROPFILE = 0x1000,
	DROPTEXT,
	DROPBEGIN,
	DROPCOMPLETE,
	AUDIODEVICEADDED = 0x1100,
	AUDIODEVICEREMOVED,
	SENSORUPDATE = 0x1200,
	RENDER_TARGETS_RESET = 0x2000,
	RENDER_DEVICE_RESET,
	POLLSENTINEL = 0x7F00,
	USEREVENT = 0x8000,
	LASTEVENT = 0xFFFF,
};

export type CommonEvent = struct {
	_type:     EventType,
	timestamp: u32,
};

export type DisplayEvent = struct {
	_type:     EventType,
	timestamp: u32,
	display:   u32,
	event:     u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	data1:     i32,
};

export type WindowEvent = struct {
	_type:     EventType,
	timestamp: u32,
	windowID:  u32,
	event:     u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	data1:     i32,
	data2:     i32,
};

export type KeyboardEvent = struct {
	_type:     EventType,
	timestamp: u32,
	windowID:  u32,
	state:     u8,
	repeat:    u8,
	padding2:  u8,
	padding3:  u8,
	keysym:    Keysym,
};

export type TextEditingEvent = struct {
	_type:      EventType,
	timestamp:  u32,
	windowID:   u32,
	text:       [32]c::char,
	start:      i32,
	length:     i32,
};

export type TextEditingExtEvent = struct {
	_type:     EventType,
	timestamp: u32,
	windowID:  u32,
	text:      *c::char,
	start:     i32,
	length:    i32,
};

export type TextInputEvent = struct {
	_type:      EventType,
	timestamp: u32,
	windowID:  u32,
	text:      [32]c::char,
};

export type MouseMotionEvent = struct {
	_type:     EventType,
	timestamp: u32,
	windowID:  u32,
	which:     u32,
	state:     u32,
	x:         i32,
	y:         i32,
	xrel:      i32,
	yrel:      i32,
};

export type MouseButtonEvent = struct {
	_type:     EventType,
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

export type MouseWheelEvent = struct {
	_type:     EventType,
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

export type JoyAxisEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	axis:      u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	value:     i16,
	padding4:  u16,
};

export type JoyBallEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	ball:      u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	xrel:      i16,
	yrel:      i16,
};

export type JoyHatEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	hat:       u8,
	value:     u8,
	padding1:  u8,
	padding2:  u8,
};

export type JoyButtonEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	button:    u8,
	state:     u8,
	padding1:  u8,
	padding2:  u8,
};

export type JoyDeviceEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     i32,
};

export type JoyBatteryEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	level:     JoystickPowerLevel,
};

export type ControllerAxisEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	axis:      u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
	value:     i16,
	padding4:  u16,
};

export type ControllerButtonEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	button:    u8,
	state:     u8,
	padding1:  u8,
	padding2:  u8,
};

export type ControllerDeviceEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     i32,
};

export type ControllerTouchpadEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     JoystickID,
	touchpad:  i32,
	finger:    i32,
	x:         f32,
	y:         f32,
	pressure:  f32,
};

export type ControllerSensorEvent = struct {
	_type:        EventType,
	timestamp:    u32,
	which:        JoystickID,
	sensor:       i32,
	data:         [3]f32,
	timestamp_us: u64,
};

export type AudioDeviceEvent = struct {
	_type:     EventType,
	timestamp: u32,
	which:     u32,
	iscapture: u8,
	padding1:  u8,
	padding2:  u8,
	padding3:  u8,
};

export type TouchFingerEvent = struct {
	_type:     EventType,
	timestamp: u32,
	touchId:   TouchID,
	fingerId:  FingerID,
	x:         f32,
	y:         f32,
	dx:        f32,
	dy:        f32,
	pressure:  f32,
	windowID:  u32,
};

export type MultiGestureEvent = struct {
	_type:      EventType,
	timestamp:  u32,
	touchId:    TouchID,
	dTheta:     f32,
	dDist:      f32,
	x:          f32,
	y:          f32,
	numFingers: u16,
	padding:    u16,
};

export type DollarGestureEvent = struct {
	_type:      EventType,
	timestamp:  u32,
	touchId:    TouchID,
	gestureId:  GestureID,
	numFingers: u32,
	error:      f32,
	x:          f32,
	y:          f32,
};

export type DropEvent = struct {
	_type:     EventType,
	timestamp: u32,
	file:      *c::char,
	windowID:  u32,
};

export type SensorEvent = struct {
	_type:        EventType,
	timestamp:    u32,
	which:        i32,
	data:         [6]f32,
	timestamp_us: u64,
};

export type QuitEvent = struct {
	_type:     EventType,
	timestamp: u32,
};

export type UserEvent = struct {
	_type:     EventType,
	timestamp: u32,
	windowID:  u32,
	code:      i32,
	data1:     *opaque,
	data2:     *opaque,
};

export type SysWMEvent = struct {
	_type:     EventType,
	timestamp: u32,
	msg:       *SysWMmsg,
};

export type Event = union {
	_type:     EventType,
	common:    CommonEvent,
	display:   DisplayEvent,
	window:    WindowEvent,
	key:       KeyboardEvent,
	edit:      TextEditingEvent,
	editExt:   TextEditingExtEvent,
	text:      TextInputEvent,
	motion:    MouseMotionEvent,
	button:    MouseButtonEvent,
	wheel:     MouseWheelEvent,
	jaxis:     JoyAxisEvent,
	jball:     JoyBallEvent,
	jhat:      JoyHatEvent,
	jbutton:   JoyButtonEvent,
	jdevice:   JoyDeviceEvent,
	jbattery:  JoyBatteryEvent,
	caxis:     ControllerAxisEvent,
	cbutton:   ControllerButtonEvent,
	cdevice:   ControllerDeviceEvent,
	ctouchpad: ControllerTouchpadEvent,
	csensor:   ControllerSensorEvent,
	adevice:   AudioDeviceEvent,
	sensor:    SensorEvent,
	quit:      QuitEvent,
	user:      UserEvent,
	syswm:     SysWMEvent,
	tfinger:   TouchFingerEvent,
	mgesture:  MultiGestureEvent,
	dgesture:  DollarGestureEvent,
	drop:      DropEvent,
	padding:   [56]u8,
};

export @symbol("SDL_PumpEvents") fn PumpEvents() void;

export type eventaction = enum {
	ADDEVENT,
	PEEKEVENT,
	GETEVENT,
};

export type EventFilter = *fn(userdata: *opaque, event: *Event) int;

export @symbol("SDL_PeepEvents"       ) fn PeepEvents(events: *Event, numevents: int, action: eventaction, minType: u32, maxType: u32) int;
export @symbol("SDL_HasEvent"         ) fn HasEvent(_type: u32) Bool;
export @symbol("SDL_HasEvents"        ) fn HasEvents(minType: u32, maxType: u32) Bool;
export @symbol("SDL_FlushEvent"       ) fn FlushEvent(_type: u32) void;
export @symbol("SDL_FlushEvents"      ) fn FlushEvents(minType: u32, maxType: u32) void;
export @symbol("SDL_PollEvent"        ) fn PollEvent(event: *Event) int;
export @symbol("SDL_WaitEvent"        ) fn WaitEvent(event: *Event) int;
export @symbol("SDL_WaitEventTimeout" ) fn WaitEventTimeout(event: *Event, timeout: int) int;
export @symbol("SDL_PushEvent"        ) fn PushEvent(event: *Event) int;
export @symbol("SDL_SetEventFilter"   ) fn SetEventFilter(filter: EventFilter, userdata: *opaque) void;
export @symbol("SDL_GetEventFilter"   ) fn GetEventFilter(filter: *EventFilter, userdata: **opaque) Bool;
export @symbol("SDL_AddEventWatch"    ) fn AddEventWatch(filter: EventFilter, userdata: *opaque) void;
export @symbol("SDL_DelEventWatch"    ) fn DelEventWatch(filter: EventFilter, userdata: *opaque) void;
export @symbol("SDL_FilterEvents"     ) fn FilterEvents(filter: EventFilter, userdata: *opaque) void;
export @symbol("SDL_EventState"       ) fn EventState(_type: EventType, state: int) u8;
export @symbol("SDL_RegisterEvents"   ) fn RegisterEvents(numevents: int) u32;
