use types::c;

export type AudioFormat = u16;
export type AudioCallback = *fn(userdata: *opaque, stream: *u8, _len: int) void;

export type AudioSpec = struct {
	freq:     int,
	format:   AudioFormat,
	channels: u8,
	silence:  u8,
	samples:  u16,
	padding:  u16,
	_size:    u32,
	callback: AudioCallback,
	userdata: *opaque,
};

export type AudioCVT = struct {
	needed:       int,
	src_format:   AudioFormat,
	dst_format:   AudioFormat,
	rate_incr:    f64,
	buf:          *u8,
	_len:         int,
	len_cvt:      int,
	len_mult:     int,
	len_ratio:    f64,
	filters:      [9 + 1]AudioFilter,
	filter_index: int,
};

export type AudioFilter = *fn(cvt: *AudioCVT, format: AudioFormat) void;

export @symbol("SDL_GetNumAudioDrivers"    ) fn GetNumAudioDrivers() int;
export @symbol("SDL_GetAudioDriver"        ) fn GetAudioDriver(index: int) const*c::char;
export @symbol("SDL_AudioInit"             ) fn AudioInit(driver_name: const*c::char) int;
export @symbol("SDL_AudioQuit"             ) fn AudioQuit() void;
export @symbol("SDL_GetCurrentAudioDriver" ) fn GetCurrentAudioDriver() const*c::char;
export @symbol("SDL_OpenAudio"             ) fn OpenAudio(desired: *AudioSpec, obtained: *AudioSpec) int;

export type AudioDeviceID = u32;

export @symbol("SDL_GetNumAudioDevices"  ) fn GetNumAudioDevices(iscapture: int) int;
export @symbol("SDL_GetAudioDeviceName"  ) fn GetAudioDeviceName(index: int, iscapture: int) const*c::char;
export @symbol("SDL_GetAudioDeviceSpec"  ) fn GetAudioDeviceSpec(index: int, iscapture: int, spec: *AudioSpec) int;
export @symbol("SDL_GetDefaultAudioInfo" ) fn GetDefaultAudioInfo(name: **c::char, spec: *AudioSpec, iscapture: int) int;
export @symbol("SDL_OpenAudioDevice"     ) fn OpenAudioDevice(device: const*c::char, iscapture: int, desired: const*AudioSpec, obtained: *AudioSpec, allowed_changes: int) AudioDeviceID;

export type AudioStatus = enum {
	AUDIO_STOPPED = 0,
	AUDIO_PLAYING,
	AUDIO_PAUSED,
};

export @symbol("SDL_GetAudioStatus"       ) fn GetAudioStatus() AudioStatus;
export @symbol("SDL_GetAudioDeviceStatus" ) fn GetAudioDeviceStatus(dev: AudioDeviceID) AudioStatus;
export @symbol("SDL_PauseAudio"           ) fn PauseAudio(pause_on: int) void;
export @symbol("SDL_PauseAudioDevice"     ) fn PauseAudioDevice(dev: AudioDeviceID, pause_on: int) void;
export @symbol("SDL_LoadWAV_RW"           ) fn LoadWAV_RW(src: *RWops, freesrc: int, spec: *AudioSpec, audio_buf: **u8, audio__len: *u32) *AudioSpec;
export @symbol("SDL_FreeWAV"              ) fn FreeWAV(audio_buf: *u8) void;
export @symbol("SDL_BuildAudioCVT"        ) fn BuildAudioCVT(cvt: *AudioCVT, src_format: AudioFormat, src_channels: u8, src_rate: int, dst_format: AudioFormat, dst_channels: u8, dst_rate: int) int;
export @symbol("SDL_ConvertAudio"         ) fn ConvertAudio(cvt: *AudioCVT) int;

export type AudioStream = opaque;

export @symbol("SDL_NewAudioStream"       ) fn NewAudioStream(src_format: const AudioFormat, src_channels: const u8, src_rate: const int, dst_format: const AudioFormat, dst_channels: const u8, dst_rate: const int) *AudioStream;
export @symbol("SDL_AudioStreamPut"       ) fn AudioStreamPut(stream: *AudioStream, buf: const*opaque, _len: int) int;
export @symbol("SDL_AudioStreamGet"       ) fn AudioStreamGet(stream: *AudioStream, buf: *opaque, _len: int) int;
export @symbol("SDL_AudioStreamAvailable" ) fn AudioStreamAvailable(stream: *AudioStream) int;
export @symbol("SDL_AudioStreamFlush"     ) fn AudioStreamFlush(stream: *AudioStream) int;
export @symbol("SDL_AudioStreamClear"     ) fn AudioStreamClear(stream: *AudioStream) void;
export @symbol("SDL_FreeAudioStream"      ) fn FreeAudioStream(stream: *AudioStream) void;
export @symbol("SDL_MixAudio"             ) fn MixAudio(dst: *u8, src: const*u8, _len: u32, volume: int) void;
export @symbol("SDL_MixAudioFormat"       ) fn MixAudioFormat(dst: *u8, src: *u8, format: AudioFormat, _len: u32, volume: int) void;
export @symbol("SDL_QueueAudio"           ) fn QueueAudio(dev: AudioDeviceID, data: const*opaque, _len: u32) int;
export @symbol("SDL_DequeueAudio"         ) fn DequeueAudio(dev: AudioDeviceID, data: *opaque, _len: u32) u32;
export @symbol("SDL_GetQueuedAudioSize"   ) fn GetQueuedAudioSize(dev: AudioDeviceID) u32;
export @symbol("SDL_ClearQueuedAudio"     ) fn ClearQueuedAudio(dev: AudioDeviceID) void;
export @symbol("SDL_LockAudio"            ) fn LockAudio() void;
export @symbol("SDL_LockAudioDevice"      ) fn LockAudioDevice(dev: AudioDeviceID) void;
export @symbol("SDL_UnlockAudio"          ) fn UnlockAudio() void;
export @symbol("SDL_UnlockAudioDevice"    ) fn UnlockAudioDevice(dev: AudioDeviceID) void;
export @symbol("SDL_CloseAudio"           ) fn CloseAudio() void;
export @symbol("SDL_CloseAudioDevice"     ) fn CloseAudioDevice(dev: AudioDeviceID) void;
