use types::c;

export type GameController = opaque;

export type GameControllerType = enum {
	CONTROLLER_TYPE_UNKNOWN = 0,
	CONTROLLER_TYPE_XBOX360,
	CONTROLLER_TYPE_XBOXONE,
	CONTROLLER_TYPE_PS3,
	CONTROLLER_TYPE_PS4,
	CONTROLLER_TYPE_NINTENDO_SWITCH_PRO,
	CONTROLLER_TYPE_VIRTUAL,
	CONTROLLER_TYPE_PS5,
	CONTROLLER_TYPE_AMAZON_LUNA,
	CONTROLLER_TYPE_GOOGLE_STADIA,
	CONTROLLER_TYPE_NVIDIA_SHIELD,
	CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
	CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
	CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
	CONTROLLER_TYPE_MAX,
};

export type GameControllerBindType = enum {
	CONTROLLER_BINDTYPE_NONE = 0,
	CONTROLLER_BINDTYPE_BUTTON,
	CONTROLLER_BINDTYPE_AXIS,
	CONTROLLER_BINDTYPE_HAT,
};

export type GameControllerButtonBind = struct {
	bindType: GameControllerBindType,
	value: union {
		button: int,
		axis:   int,
		hat: struct {
			hat:      int,
			hat_mask: int,
		},
	},
};

export @symbol("SDL_GameControllerAddMappingsFromRW"     ) fn GameControllerAddMappingsFromRW(rw: *RWops, freerw: int) int;
export @symbol("SDL_GameControllerAddMapping"            ) fn GameControllerAddMapping(mappingString: const*c::char) int;
export @symbol("SDL_GameControllerNumMappings"           ) fn GameControllerNumMappings() int;
export @symbol("SDL_GameControllerMappingForIndex"       ) fn GameControllerMappingForIndex(mapping_index: int) *c::char;
export @symbol("SDL_GameControllerMappingForGUID"        ) fn GameControllerMappingForGUID(guid: JoystickGUID) *c::char;
export @symbol("SDL_GameControllerMapping"               ) fn GameControllerMapping(gamecontroller: *GameController) *c::char;
export @symbol("SDL_IsGameController"                    ) fn IsGameController(joystick_index: int) Bool;
export @symbol("SDL_GameControllerNameForIndex"          ) fn GameControllerNameForIndex(joystick_index: int) const*c::char;
export @symbol("SDL_GameControllerPathForIndex"          ) fn GameControllerPathForIndex(joystick_index: int) const*c::char;
export @symbol("SDL_GameControllerTypeForIndex"          ) fn GameControllerTypeForIndex(joystick_index: int) GameControllerType;
export @symbol("SDL_GameControllerMappingForDeviceIndex" ) fn GameControllerMappingForDeviceIndex(joystick_index: int) *c::char;
export @symbol("SDL_GameControllerOpen"                  ) fn GameControllerOpen(joystick_index: int) *GameController;
export @symbol("SDL_GameControllerFromInstanceID"        ) fn GameControllerFromInstanceID(joyid: JoystickID) *GameController;
export @symbol("SDL_GameControllerFromPlayerIndex"       ) fn GameControllerFromPlayerIndex(player_index: int) *GameController;
export @symbol("SDL_GameControllerName"                  ) fn GameControllerName(gamecontroller: *GameController) const*c::char;
export @symbol("SDL_GameControllerPath"                  ) fn GameControllerPath(gamecontroller: *GameController) const*c::char;
export @symbol("SDL_GameControllerGetType"               ) fn GameControllerGetType(gamecontroller: *GameController) GameControllerType;
export @symbol("SDL_GameControllerGetPlayerIndex"        ) fn GameControllerGetPlayerIndex(gamecontroller: *GameController) int;
export @symbol("SDL_GameControllerSetPlayerIndex"        ) fn GameControllerSetPlayerIndex(gamecontroller: *GameController, player_index: int) void;
export @symbol("SDL_GameControllerGetVendor"             ) fn GameControllerGetVendor(gamecontroller: *GameController) u16;
export @symbol("SDL_GameControllerGetProduct"            ) fn GameControllerGetProduct(gamecontroller: *GameController) u16;
export @symbol("SDL_GameControllerGetProductVersion"     ) fn GameControllerGetProductVersion(gamecontroller: *GameController) u16;
export @symbol("SDL_GameControllerGetFirmwareVersion"    ) fn GameControllerGetFirmwareVersion(gamecontroller: *GameController) u16;
export @symbol("SDL_GameControllerGetSerial"             ) fn GameControllerGetSerial(gamecontroller: *GameController) const*c::char;
export @symbol("SDL_GameControllerGetSteamHandle"        ) fn GameControllerGetSteamHandle(gamecontroller: *GameController) u64;
export @symbol("SDL_GameControllerGetAttached"           ) fn GameControllerGetAttached(gamecontroller: *GameController) Bool;
export @symbol("SDL_GameControllerGetJoystick"           ) fn GameControllerGetJoystick(gamecontroller: *GameController) *Joystick;
export @symbol("SDL_GameControllerEventState"            ) fn GameControllerEventState(state: int) int;
export @symbol("SDL_GameControllerUpdate"                ) fn GameControllerUpdate() void;

export type GameControllerAxis = enum {
	CONTROLLER_AXIS_INVALID = -1,
	CONTROLLER_AXIS_LEFTX,
	CONTROLLER_AXIS_LEFTY,
	CONTROLLER_AXIS_RIGHTX,
	CONTROLLER_AXIS_RIGHTY,
	CONTROLLER_AXIS_TRIGGERLEFT,
	CONTROLLER_AXIS_TRIGGERRIGHT,
	CONTROLLER_AXIS_MAX,
};

export @symbol("SDL_GameControllerGetAxisFromString" ) fn GameControllerGetAxisFromString(_str: const*c::char) GameControllerAxis;
export @symbol("SDL_GameControllerGetStringForAxis"  ) fn GameControllerGetStringForAxis(axis: GameControllerAxis) const*c::char;
export @symbol("SDL_GameControllerGetBindForAxis"    ) fn GameControllerGetBindForAxis(gamecontroller: *GameController, axis: GameControllerAxis) GameControllerButtonBind;
export @symbol("SDL_GameControllerHasAxis"           ) fn GameControllerHasAxis(gamecontroller: *GameController, axis: GameControllerAxis) Bool;
export @symbol("SDL_GameControllerGetAxis"           ) fn GameControllerGetAxis(gamecontroller: *GameController, axis: GameControllerAxis) i16;

export type GameControllerButton = enum {
	CONTROLLER_BUTTON_INVALID = -1,
	CONTROLLER_BUTTON_A,
	CONTROLLER_BUTTON_B,
	CONTROLLER_BUTTON_X,
	CONTROLLER_BUTTON_Y,
	CONTROLLER_BUTTON_BACK,
	CONTROLLER_BUTTON_GUIDE,
	CONTROLLER_BUTTON_START,
	CONTROLLER_BUTTON_LEFTSTICK,
	CONTROLLER_BUTTON_RIGHTSTICK,
	CONTROLLER_BUTTON_LEFTSHOULDER,
	CONTROLLER_BUTTON_RIGHTSHOULDER,
	CONTROLLER_BUTTON_DPAD_UP,
	CONTROLLER_BUTTON_DPAD_DOWN,
	CONTROLLER_BUTTON_DPAD_LEFT,
	CONTROLLER_BUTTON_DPAD_RIGHT,
	CONTROLLER_BUTTON_MISC1,
	CONTROLLER_BUTTON_PADDLE1,
	CONTROLLER_BUTTON_PADDLE2,
	CONTROLLER_BUTTON_PADDLE3,
	CONTROLLER_BUTTON_PADDLE4,
	CONTROLLER_BUTTON_TOUCHPAD,
	CONTROLLER_BUTTON_MAX,
};

export @symbol("SDL_GameControllerGetButtonFromString"            ) fn GameControllerGetButtonFromString(_str: const*c::char) GameControllerButton;
export @symbol("SDL_GameControllerGetStringForButton"             ) fn GameControllerGetStringForButton(button: GameControllerButton) const*c::char;
export @symbol("SDL_GameControllerGetBindForButton"               ) fn GameControllerGetBindForButton(gamecontroller: *GameController, button: GameControllerButton) GameControllerButtonBind;
export @symbol("SDL_GameControllerHasButton"                      ) fn GameControllerHasButton(gamecontroller: *GameController, button: GameControllerButton) Bool;
export @symbol("SDL_GameControllerGetButton"                      ) fn GameControllerGetButton(gamecontroller: *GameController, button: GameControllerButton) u8;
export @symbol("SDL_GameControllerGetNumTouchpads"                ) fn GameControllerGetNumTouchpads(gamecontroller: *GameController) int;
export @symbol("SDL_GameControllerGetNumTouchpadFingers"          ) fn GameControllerGetNumTouchpadFingers(gamecontroller: *GameController, touchpad: int) int;
export @symbol("SDL_GameControllerGetTouchpadFinger"              ) fn GameControllerGetTouchpadFinger(gamecontroller: *GameController, touchpad: int, finger: int, state: *u8, x: *f32, y: *f32, pressure: *f32) int;
export @symbol("SDL_GameControllerHasSensor"                      ) fn GameControllerHasSensor(gamecontroller: *GameController, _type: SensorType) Bool;
export @symbol("SDL_GameControllerSetSensorEnabled"               ) fn GameControllerSetSensorEnabled(gamecontroller: *GameController, _type: SensorType, enabled: Bool) int;
export @symbol("SDL_GameControllerIsSensorEnabled"                ) fn GameControllerIsSensorEnabled(gamecontroller: *GameController, _type: SensorType) Bool;
export @symbol("SDL_GameControllerGetSensorDataRate"              ) fn GameControllerGetSensorDataRate(gamecontroller: *GameController, _type: SensorType) f32;
export @symbol("SDL_GameControllerGetSensorData"                  ) fn GameControllerGetSensorData(gamecontroller: *GameController, _type: SensorType, data: *f32, num_values: int) int;
export @symbol("SDL_GameControllerGetSensorDataWithTimestamp"     ) fn GameControllerGetSensorDataWithTimestamp(gamecontroller: *GameController, _type: SensorType, timestamp: *u64, data: *f32, num_values: int) int;
export @symbol("SDL_GameControllerRumble"                         ) fn GameControllerRumble(gamecontroller: *GameController, low_frequency_rumble: u16, high_frequency_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_GameControllerRumbleTriggers"                 ) fn GameControllerRumbleTriggers(gamecontroller: *GameController, left_rumble: u16, right_rumble: u16, duration_ms: u32) int;
export @symbol("SDL_GameControllerHasLED"                         ) fn GameControllerHasLED(gamecontroller: *GameController) Bool;
export @symbol("SDL_GameControllerHasRumble"                      ) fn GameControllerHasRumble(gamecontroller: *GameController) Bool;
export @symbol("SDL_GameControllerHasRumbleTriggers"              ) fn GameControllerHasRumbleTriggers(gamecontroller: *GameController) Bool;
export @symbol("SDL_GameControllerSetLED"                         ) fn GameControllerSetLED(gamecontroller: *GameController, red: u8, green: u8, blue: u8) int;
export @symbol("SDL_GameControllerSendEffect"                     ) fn GameControllerSendEffect(gamecontroller: *GameController, data: const*opaque, _size: int) int;
export @symbol("SDL_GameControllerClose"                          ) fn GameControllerClose(gamecontroller: *GameController) void;
export @symbol("SDL_GameControllerGetAppleSFSymbolsNameForButton" ) fn GameControllerGetAppleSFSymbolsNameForButton(gamecontroller: *GameController, button: GameControllerButton) const*c::char;
export @symbol("SDL_GameControllerGetAppleSFSymbolsNameForAxis"   ) fn GameControllerGetAppleSFSymbolsNameForAxis(gamecontroller: *GameController, axis: GameControllerAxis) const*c::char;
