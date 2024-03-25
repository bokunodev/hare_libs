use types::c;

export type SDL_AudioFormat = u16;
export type SDL_AudioCallback = *fn(userdata: *opaque, stream: *u8, _len: int) void;

export type SDL_AudioSpec = struct {
    freq:     int,
    format:   SDL_AudioFormat,
    channels: u8,
    silence:  u8,
    samples:  u16,
    padding:  u16,
    _size:    u32,
    callback: SDL_AudioCallback,
    userdata: *opaque,
};



export type SDL_AudioCVT = struct {
    needed:       int,
    src_format:   SDL_AudioFormat,
    dst_format:   SDL_AudioFormat,
    rate_incr:    f64,
    buf:          *u8,
    _len:         int,
    len_cvt:      int,
    len_mult:     int,
    len_ratio:    f64,
    filters:      [9 + 1]SDL_AudioFilter,
    filter_index: int,
};

export type SDL_AudioFilter = *fn(cvt: *SDL_AudioCVT, format: SDL_AudioFormat) void;

export @symbol("SDL_GetNumAudioDrivers"    ) fn GetNumAudioDrivers() int;
export @symbol("SDL_GetAudioDriver"        ) fn GetAudioDriver(index: int) const*c::char;
export @symbol("SDL_AudioInit"             ) fn AudioInit(driver_name: const*c::char) int;
export @symbol("SDL_AudioQuit"             ) fn AudioQuit() void;
export @symbol("SDL_GetCurrentAudioDriver" ) fn GetCurrentAudioDriver() const*c::char;
export @symbol("SDL_OpenAudio"             ) fn OpenAudio(desired: *SDL_AudioSpec, obtained: *SDL_AudioSpec) int;

export type SDL_AudioDeviceID = u32;

export @symbol("SDL_GetNumAudioDevices"  ) fn GetNumAudioDevices(iscapture: int) int;
export @symbol("SDL_GetAudioDeviceName"  ) fn GetAudioDeviceName(index: int, iscapture: int) const*c::char;
export @symbol("SDL_GetAudioDeviceSpec"  ) fn GetAudioDeviceSpec(index: int, iscapture: int, spec: *SDL_AudioSpec) int;
export @symbol("SDL_GetDefaultAudioInfo" ) fn GetDefaultAudioInfo(name: **c::char, spec: *SDL_AudioSpec, iscapture: int) int;
export @symbol("SDL_OpenAudioDevice"     ) fn OpenAudioDevice(device: const*c::char, iscapture: int, desired: const*SDL_AudioSpec, obtained: *SDL_AudioSpec, allowed_changes: int) SDL_AudioDeviceID;

export type SDL_AudioStatus = enum {
    SDL_AUDIO_STOPPED = 0,
    SDL_AUDIO_PLAYING,
    SDL_AUDIO_PAUSED,
};

export @symbol("SDL_GetAudioStatus"       ) fn GetAudioStatus() SDL_AudioStatus;
export @symbol("SDL_GetAudioDeviceStatus" ) fn GetAudioDeviceStatus(dev: SDL_AudioDeviceID) SDL_AudioStatus;
export @symbol("SDL_PauseAudio"           ) fn PauseAudio(pause_on: int) void;
export @symbol("SDL_PauseAudioDevice"     ) fn PauseAudioDevice(dev: SDL_AudioDeviceID, pause_on: int) void;
export @symbol("SDL_LoadWAV_RW"           ) fn LoadWAV_RW(src: *SDL_RWops, freesrc: int, spec: *SDL_AudioSpec, audio_buf: **u8, audio__len: *u32) *SDL_AudioSpec;
export @symbol("SDL_FreeWAV"              ) fn FreeWAV(audio_buf: *u8) void;
export @symbol("SDL_BuildAudioCVT"        ) fn BuildAudioCVT(cvt: *SDL_AudioCVT, src_format: SDL_AudioFormat, src_channels: u8, src_rate: int, dst_format: SDL_AudioFormat, dst_channels: u8, dst_rate: int) int;
export @symbol("SDL_ConvertAudio"         ) fn ConvertAudio(cvt: *SDL_AudioCVT) int;

export type SDL_AudioStream = opaque;

export @symbol("SDL_NewAudioStream"       ) fn NewAudioStream(src_format: const SDL_AudioFormat, src_channels: const u8, src_rate: const int, dst_format: const SDL_AudioFormat, dst_channels: const u8, dst_rate: const int) *SDL_AudioStream;
export @symbol("SDL_AudioStreamPut"       ) fn AudioStreamPut(stream: *SDL_AudioStream, buf: const*opaque, _len: int) int;
export @symbol("SDL_AudioStreamGet"       ) fn AudioStreamGet(stream: *SDL_AudioStream, buf: *opaque, _len: int) int;
export @symbol("SDL_AudioStreamAvailable" ) fn AudioStreamAvailable(stream: *SDL_AudioStream) int;
export @symbol("SDL_AudioStreamFlush"     ) fn AudioStreamFlush(stream: *SDL_AudioStream) int;
export @symbol("SDL_AudioStreamClear"     ) fn AudioStreamClear(stream: *SDL_AudioStream) void;
export @symbol("SDL_FreeAudioStream"      ) fn FreeAudioStream(stream: *SDL_AudioStream) void;
export @symbol("SDL_MixAudio"             ) fn MixAudio(dst: *u8, src: const*u8, _len: u32, volume: int) void;
export @symbol("SDL_MixAudioFormat"       ) fn MixAudioFormat(dst: *u8, src: *u8, format: SDL_AudioFormat, _len: u32, volume: int) void;
export @symbol("SDL_QueueAudio"           ) fn QueueAudio(dev: SDL_AudioDeviceID, data: const*opaque, _len: u32) int;
export @symbol("SDL_DequeueAudio"         ) fn DequeueAudio(dev: SDL_AudioDeviceID, data: *opaque, _len: u32) u32;
export @symbol("SDL_GetQueuedAudioSize"   ) fn GetQueuedAudioSize(dev: SDL_AudioDeviceID) u32;
export @symbol("SDL_ClearQueuedAudio"     ) fn ClearQueuedAudio(dev: SDL_AudioDeviceID) void;
export @symbol("SDL_LockAudio"            ) fn LockAudio() void;
export @symbol("SDL_LockAudioDevice"      ) fn LockAudioDevice(dev: SDL_AudioDeviceID) void;
export @symbol("SDL_UnlockAudio"          ) fn UnlockAudio() void;
export @symbol("SDL_UnlockAudioDevice"    ) fn UnlockAudioDevice(dev: SDL_AudioDeviceID) void;
export @symbol("SDL_CloseAudio"           ) fn CloseAudio() void;
export @symbol("SDL_CloseAudioDevice"     ) fn CloseAudioDevice(dev: SDL_AudioDeviceID) void;
