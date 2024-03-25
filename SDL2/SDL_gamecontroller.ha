use types::c;

export type SDL_GameController = opaque;

export type SDL_GameControllerType = enum {
	SDL_CONTROLLER_TYPE_UNKNOWN = 0,
	SDL_CONTROLLER_TYPE_XBOX360,
	SDL_CONTROLLER_TYPE_XBOXONE,
	SDL_CONTROLLER_TYPE_PS3,
	SDL_CONTROLLER_TYPE_PS4,
	SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO,
	SDL_CONTROLLER_TYPE_VIRTUAL,
	SDL_CONTROLLER_TYPE_PS5,
	SDL_CONTROLLER_TYPE_AMAZON_LUNA,
	SDL_CONTROLLER_TYPE_GOOGLE_STADIA,
	SDL_CONTROLLER_TYPE_NVIDIA_SHIELD,
	SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
	SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
	SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
	SDL_CONTROLLER_TYPE_MAX,
};

export type SDL_GameControllerBindType = enum {
	SDL_CONTROLLER_BINDTYPE_NONE = 0,
	SDL_CONTROLLER_BINDTYPE_BUTTON,
	SDL_CONTROLLER_BINDTYPE_AXIS,
	SDL_CONTROLLER_BINDTYPE_HAT,
};

export type SDL_GameControllerButtonBind = struct {
	bindType: SDL_GameControllerBindType,
	value: union {
		button: int,
		axis:   int,
		hat: struct {
			hat:      int,
			hat_mask: int,
		},
	},
};

export @symbol("SDL_GameControllerAddMappingsFromRW"     ) fn GameControllerAddMappingsFromRW(rw: *SDL_RWops, freerw: int) int;
export @symbol("SDL_GameControllerAddMapping"            ) fn GameControllerAddMapping(mappingString: const*c::char) int;
export @symbol("SDL_GameControllerNumMappings"           ) fn GameControllerNumMappings() int;
export @symbol("SDL_GameControllerMappingForIndex"       ) fn GameControllerMappingForIndex(mapping_index: int) *c::char;
export @symbol("SDL_GameControllerMappingForGUID"        ) fn GameControllerMappingForGUID(guid: SDL_JoystickGUID) *c::char;
export @symbol("SDL_GameControllerMapping"               ) fn GameControllerMapping(gamecontroller: *SDL_GameController) *c::char;
export @symbol("SDL_IsGameController"                    ) fn IsGameController(joystick_index: int) SDL_bool;
export @symbol("SDL_GameControllerNameForIndex"          ) fn GameControllerNameForIndex(joystick_index: int) const*c::char;
export @symbol("SDL_GameControllerPathForIndex"          ) fn GameControllerPathForIndex(joystick_index: int) const*c::char;
export @symbol("SDL_GameControllerTypeForIndex"          ) fn GameControllerTypeForIndex(joystick_index: int) SDL_GameControllerType;
export @symbol("SDL_GameControllerMappingForDeviceIndex" ) fn GameControllerMappingForDeviceIndex(joystick_index: int) *c::char;
export @symbol("SDL_GameControllerOpen"                  ) fn GameControllerOpen(joystick_index: int) *SDL_GameController;
export @symbol("SDL_GameControllerFromInstanceID"        ) fn GameControllerFromInstanceID(joyid: SDL_JoystickID) *SDL_GameController;
export @symbol("SDL_GameControllerFromPlayerIndex"       ) fn GameControllerFromPlayerIndex(player_index: int) *SDL_GameController;
export @symbol("SDL_GameControllerName"                  ) fn GameControllerName(gamecontroller: *SDL_GameController) const*c::char;
export @symbol("SDL_GameControllerPath"                  ) fn GameControllerPath(gamecontroller: *SDL_GameController) const*c::char;
export @symbol("SDL_GameControllerGetType"               ) fn GameControllerGetType(gamecontroller: *SDL_GameController) SDL_GameControllerType;
export @symbol("SDL_GameControllerGetPlayerIndex"        ) fn GameControllerGetPlayerIndex(gamecontroller: *SDL_GameController) int;
export @symbol("SDL_GameControllerSetPlayerIndex"        ) fn GameControllerSetPlayerIndex(gamecontroller: *SDL_GameController, player_index: int) void;
export @symbol("SDL_GameControllerGetVendor"             ) fn GameControllerGetVendor(gamecontroller: *SDL_GameController) u16;
export @symbol("SDL_GameControllerGetProduct"            ) fn GameControllerGetProduct(gamecontroller: *SDL_GameController) u16;
export @symbol("SDL_GameControllerGetProductVersion"     ) fn GameControllerGetProductVersion(gamecontroller: *SDL_GameController) u16;
export @symbol("SDL_GameControllerGetFirmwareVersion"    ) fn GameControllerGetFirmwareVersion(gamecontroller: *SDL_GameController) u16;
export @symbol("SDL_GameControllerGetSerial"             ) fn GameControllerGetSerial(gamecontroller: *SDL_GameController) const*c::char;
export @symbol("SDL_GameControllerGetSteamHandle"        ) fn GameControllerGetSteamHandle(gamecontroller: *SDL_GameController) u64;
export @symbol("SDL_GameControllerGetAttached"           ) fn GameControllerGetAttached(gamecontroller: *SDL_GameController) SDL_bool;
export @symbol("SDL_GameControllerGetJoystick"           ) fn GameControllerGetJoystick(gamecontroller: *SDL_GameController) *SDL_Joystick;
export @symbol("SDL_GameControllerEventState"            ) fn GameControllerEventState(state: int) int;
export @symbol("SDL_GameControllerUpdate"                ) fn GameControllerUpdate() void;

export type SDL_GameControllerAxis = enum {
	SDL_CONTROLLER_AXIS_INVALID = -1,
	SDL_CONTROLLER_AXIS_LEFTX,
	SDL_CONTROLLER_AXIS_LEFTY,
	SDL_CONTROLLER_AXIS_RIGHTX,
	SDL_CONTROLLER_AXIS_RIGHTY,
	SDL_CONTROLLER_AXIS_TRIGGERLEFT,
	SDL_CONTROLLER_AXIS_TRIGGERRIGHT,
	SDL_CONTROLLER_AXIS_MAX,
};

export @symbol("SDL_GameControllerGetAxisFromString" ) fn GameControllerGetAxisFromString(_str: const*c::char) SDL_GameControllerAxis;
export @symbol("SDL_GameControllerGetStringForAxis"  ) fn GameControllerGetStringForAxis(axis: SDL_GameControllerAxis) const*c::char;
export @symbol("SDL_GameControllerGetBindForAxis"    ) fn GameControllerGetBindForAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) SDL_GameControllerButtonBind;
export @symbol("SDL_GameControllerHasAxis"           ) fn GameControllerHasAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) SDL_bool;
export @symbol("SDL_GameControllerGetAxis"           ) fn GameControllerGetAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) i16;

export type SDL_GameControllerButton = enum {
	SDL_CONTROLLER_BUTTON_INVALID = -1,
	SDL_CONTROLLER_BUTTON_A,
	SDL_CONTROLLER_BUTTON_B,
	SDL_CONTROLLER_BUTTON_X,
	SDL_CONTROLLER_BUTTON_Y,
	SDL_CONTROLLER_BUTTON_BACK,
	SDL_CONTROLLER_BUTTON_GUIDE,
	SDL_CONTROLLER_BUTTON_START,
	SDL_CONTROLLER_BUTTON_LEFTSTICK,
	SDL_CONTROLLER_BUTTON_RIGHTSTICK,
	SDL_CONTROLLER_BUTTON_LEFTSHOULDER,
	SDL_CONTROLLER_BUTTON_RIGHTSHOULDER,
	SDL_CONTROLLER_BUTTON_DPAD_UP,
	SDL_CONTROLLER_BUTTON_DPAD_DOWN,
	SDL_CONTROLLER_BUTTON_DPAD_LEFT,
	SDL_CONTROLLER_BUTTON_DPAD_RIGHT,
	SDL_CONTROLLER_BUTTON_MISC1,
	SDL_CONTROLLER_BUTTON_PADDLE1,
	SDL_CONTROLLER_BUTTON_PADDLE2,
	SDL_CONTROLLER_BUTTON_PADDLE3,
	SDL_CONTROLLER_BUTTON_PADDLE4,
	SDL_CONTROLLER_BUTTON_TOUCHPAD,
	SDL_CONTROLLER_BUTTON_MAX,
};

export @symbol("SDL_GameControllerGetButtonFromString"            ) fn GameControllerGetButtonFromString(_str: const*c::char) SDL_GameControllerButton;
export @symbol("SDL_GameControllerGetStringForButton"             ) fn GameControllerGetStringForButton(button: SDL_GameControllerButton) const*c::char;
export @symbol("SDL_GameControllerGetBindForButton"               ) fn GameControllerGetBindForButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) SDL_GameControllerButtonBind;
export @symbol("SDL_GameControllerHasButton"                      ) fn GameControllerHasButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) SDL_bool;
export @symbol("SDL_GameControllerGetButton"                      ) fn GameControllerGetButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) u8;
export @symbol("SDL_GameControllerGetNumTouchpads"                ) fn GameControllerGetNumTouchpads(gamecontroller: *SDL_GameController) int;
export @symbol("SDL_GameControllerGetNumTouchpadFingers"          ) fn GameControllerGetNumTouchpadFingers(gamecontroller: *SDL_GameController, touchpad: int) int;
export @symbol("SDL_GameControllerGetTouchpadFinger"              ) fn GameControllerGetTouchpadFinger(gamecontroller: *SDL_GameController, touchpad: int, finger: int, state: *u8, x: *f32, y: *f32, pressure: *f32) int;
export @symbol("SDL_GameControllerHasSensor"                      ) fn GameControllerHasSensor(gamecontroller: *SDL_GameController, _type: SDL_SensorType) SDL_bool;
export @symbol("SDL_GameControllerSetSensorEnabled"               ) fn GameControllerSetSensorEnabled(gamecontroller: *SDL_GameController, _type: SDL_SensorType, enabled: SDL_bool) int;
export @symbol("SDL_GameControllerIsSensorEnabled"                ) fn GameControllerIsSensorEnabled(gamecontroller: *SDL_GameController, _type: SDL_SensorType) SDL_bool;
export @symbol("SDL_GameControllerGetSensorDataRate"              ) fn GameControllerGetSensorDataRate(gamecontroller: *SDL_GameController, _type: SDL_SensorType) f32;
export @symbol("SDL_GameControllerGetSensorData"                  ) fn GameControllerGetSensorData(gamecontroller: *SDL_GameController, _type: SDL_SensorType, data: *f32, num_values: int) int;
export @symbol("SDL_GameControllerGetSensorDataWithTimestamp"     ) fn GameControllerGetSensorDataWithTimestamp(gamecontroller: *SDL_GameController, _type: SDL_SensorType, timestamp: *u64, data: *f32, num_values: int) int;
export @symbol("SDL_GameControllerRumble"                         ) fn GameControllerRumble(gamecontroller: *SDL_GameController, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_GameControllerRumbleTriggers"                 ) fn GameControllerRumbleTriggers(gamecontroller: *SDL_GameController, left_rumble: u16, right_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_GameControllerHasLED"                         ) fn GameControllerHasLED(gamecontroller: *SDL_GameController) SDL_bool;
export @symbol("SDL_GameControllerHasRumble"                      ) fn GameControllerHasRumble(gamecontroller: *SDL_GameController) SDL_bool;
export @symbol("SDL_GameControllerHasRumbleTriggers"              ) fn GameControllerHasRumbleTriggers(gamecontroller: *SDL_GameController) SDL_bool;
export @symbol("SDL_GameControllerSetLED"                         ) fn GameControllerSetLED(gamecontroller: *SDL_GameController, red: u8, green: u8, blue: u8) int;
export @symbol("SDL_GameControllerSendEffect"                     ) fn GameControllerSendEffect(gamecontroller: *SDL_GameController, data: const*opaque, _size: int) int;
export @symbol("SDL_GameControllerClose"                          ) fn GameControllerClose(gamecontroller: *SDL_GameController) void;
export @symbol("SDL_GameControllerGetAppleSFSymbolsNameForButton" ) fn GameControllerGetAppleSFSymbolsNameForButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) const*c::char;
export @symbol("SDL_GameControllerGetAppleSFSymbolsNameForAxis"   ) fn GameControllerGetAppleSFSymbolsNameForAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) const*c::char;
