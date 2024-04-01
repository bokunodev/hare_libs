export type PowerState = enum {
	POWERSTATE_UNKNOWN,
	POWERSTATE_ON_BATTERY,
	POWERSTATE_NO_BATTERY,
	POWERSTATE_CHARGING,
	POWERSTATE_CHARGED
};

export @symbol("SDL_GetPowerInfo") fn GetPowerInfo(seconds: *int, percent: *int) PowerState;
