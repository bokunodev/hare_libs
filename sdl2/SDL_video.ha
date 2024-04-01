use types::c;

export type DisplayMode = struct {
	format:       u32,
	w:            int,
	h:            int,
	refresh_rate: int,
	driverdata:   *opaque,
};

export type Window = opaque;

export type  WindowFlags = enum {
	WINDOW_FULLSCREEN         = 0x00000001,
	WINDOW_OPENGL             = 0x00000002,
	WINDOW_SHOWN              = 0x00000004,
	WINDOW_HIDDEN             = 0x00000008,
	WINDOW_BORDERLESS         = 0x00000010,
	WINDOW_RESIZABLE          = 0x00000020,
	WINDOW_MINIMIZED          = 0x00000040,
	WINDOW_MAXIMIZED          = 0x00000080,
	WINDOW_MOUSE_GRABBED      = 0x00000100,
	WINDOW_INPUT_FOCUS        = 0x00000200,
	WINDOW_MOUSE_FOCUS        = 0x00000400,
	WINDOW_FULLSCREEN_DESKTOP = (WINDOW_FULLSCREEN | 0x00001000),
	WINDOW_FOREIGN            = 0x00000800,
	WINDOW_ALLOW_HIGHDPI      = 0x00002000,
	WINDOW_MOUSE_CAPTURE      = 0x00004000,
	WINDOW_ALWAYS_ON_TOP      = 0x00008000,
	WINDOW_SKIP_TASKBAR       = 0x00010000,
	WINDOW_UTILITY            = 0x00020000,
	WINDOW_TOOLTIP            = 0x00040000,
	WINDOW_POPUP_MENU         = 0x00080000,
	WINDOW_KEYBOARD_GRABBED   = 0x00100000,
	WINDOW_VULKAN             = 0x10000000,
	WINDOW_METAL              = 0x20000000,
	WINDOW_INPUT_GRABBED      = WINDOW_MOUSE_GRABBED,
};

export type WindowEventID = enum {
	WINDOWEVENT_NONE,
	WINDOWEVENT_SHOWN,
	WINDOWEVENT_HIDDEN,
	WINDOWEVENT_EXPOSED,
	WINDOWEVENT_MOVED,
	WINDOWEVENT_RESIZED,
	WINDOWEVENT_SIZE_CHANGED,
	WINDOWEVENT_MINIMIZED,
	WINDOWEVENT_MAXIMIZED,
	WINDOWEVENT_RESTORED,
	WINDOWEVENT_ENTER,
	WINDOWEVENT_LEAVE,
	WINDOWEVENT_FOCUS_GAINED,
	WINDOWEVENT_FOCUS_LOST,
	WINDOWEVENT_CLOSE,
	WINDOWEVENT_TAKE_FOCUS,
	WINDOWEVENT_HIT_TEST,
	WINDOWEVENT_ICCPROF_CHANGED,
	WINDOWEVENT_DISPLAY_CHANGED,
};

export type DisplayEventID = enum {
	DISPLAYEVENT_NONE,
	DISPLAYEVENT_ORIENTATION,
	DISPLAYEVENT_CONNECTED,
	DISPLAYEVENT_DISCONNECTED,
	DISPLAYEVENT_MOVED,
};

export type DisplayOrientation = enum {
	ORIENTATION_UNKNOWN,
	ORIENTATION_LANDSCAPE,
	ORIENTATION_LANDSCAPE_FLIPPED,
	ORIENTATION_PORTRAIT,
	ORIENTATION_PORTRAIT_FLIPPED,
};

export type FlashOperation = enum {
	FLASH_CANCEL,
	FLASH_BRIEFLY,
	FLASH_UNTIL_FOCUSED,
};

export type GLattr = enum {
	GL_RED_SIZE,
	GL_GREEN_SIZE,
	GL_BLUE_SIZE,
	GL_ALPHA_SIZE,
	GL_BUFFER_SIZE,
	GL_DOUBLEBUFFER,
	GL_DEPTH_SIZE,
	GL_STENCIL_SIZE,
	GL_ACCUM_RED_SIZE,
	GL_ACCUM_GREEN_SIZE,
	GL_ACCUM_BLUE_SIZE,
	GL_ACCUM_ALPHA_SIZE,
	GL_STEREO,
	GL_MULTISAMPLEBUFFERS,
	GL_MULTISAMPLESAMPLES,
	GL_ACCELERATED_VISUAL,
	GL_RETAINED_BACKING,
	GL_CONTEXT_MAJOR_VERSION,
	GL_CONTEXT_MINOR_VERSION,
	GL_CONTEXT_EGL,
	GL_CONTEXT_FLAGS,
	GL_CONTEXT_PROFILE_MASK,
	GL_SHARE_WITH_CURRENT_CONTEXT,
	GL_FRAMEBUFFER_SRGB_CAPABLE,
	GL_CONTEXT_RELEASE_BEHAVIOR,
	GL_CONTEXT_RESET_NOTIFICATION,
	GL_CONTEXT_NO_ERROR,
	GL_FLOATBUFFERS,
};

export type GLContext = *opaque;

export type GLprofile = enum {
	GL_CONTEXT_PROFILE_CORE          = 0x0001,
	GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002,
	GL_CONTEXT_PROFILE_ES            = 0x0004,
};

export type GLcontextFlag = enum {
	GL_CONTEXT_DEBUG_FLAG              = 0x0001,
	GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
	GL_CONTEXT_ROBUST_ACCESS_FLAG      = 0x0004,
	GL_CONTEXT_RESET_ISOLATION_FLAG    = 0x0008,
};

export type GLcontextReleaseFlag = enum {
	GL_CONTEXT_RELEASE_BEHAVIOR_NONE  = 0x0000,
	GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001,
};

export type GLContextResetNotification = enum {
	GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000,
	GL_CONTEXT_RESET_LOSE_CONTEXT    = 0x0001,
};

export @symbol("SDL_GetNumVideoDrivers"       ) fn GetNumVideoDrivers() int;
export @symbol("SDL_GetVideoDriver"           ) fn GetVideoDriver(index: int) const*c::char;
export @symbol("SDL_VideoInit"                ) fn VideoInit(driver_name: const*c::char) int;
export @symbol("SDL_VideoQuit"                ) fn VideoQuit() void;
export @symbol("SDL_GetCurrentVideoDriver"    ) fn GetCurrentVideoDriver() const*c::char;
export @symbol("SDL_GetNumVideoDisplays"      ) fn GetNumVideoDisplays() int;
export @symbol("SDL_GetDisplayName"           ) fn GetDisplayName(displayIndex: int) const*c::char;
export @symbol("SDL_GetDisplayBounds"         ) fn GetDisplayBounds(displayIndex: int, rect: *Rect) int;
export @symbol("SDL_GetDisplayUsableBounds"   ) fn GetDisplayUsableBounds(displayIndex: int, rect: *Rect) int;
export @symbol("SDL_GetDisplayDPI"            ) fn GetDisplayDPI(displayIndex: int, ddpi: *f32, hdpi: *f32, vdpi: *f32) int;
export @symbol("SDL_GetDisplayOrientation"    ) fn GetDisplayOrientation(displayIndex: int) DisplayOrientation;
export @symbol("SDL_GetNumDisplayModes"       ) fn GetNumDisplayModes(displayIndex: int) int;
export @symbol("SDL_GetDisplayMode"           ) fn GetDisplayMode(displayIndex: int, modeIndex: int, mode: *DisplayMode) int;
export @symbol("SDL_GetDesktopDisplayMode"    ) fn GetDesktopDisplayMode(displayIndex: int, mode: *DisplayMode) int;
export @symbol("SDL_GetCurrentDisplayMode"    ) fn GetCurrentDisplayMode(displayIndex: int, mode: *DisplayMode) int;
export @symbol("SDL_GetClosestDisplayMode"    ) fn GetClosestDisplayMode(displayIndex: int, mode: const*DisplayMode, closest: *DisplayMode) *DisplayMode;
export @symbol("SDL_GetPointDisplayIndex"     ) fn GetPointDisplayIndex(point: const*Point) int;
export @symbol("SDL_GetRectDisplayIndex"      ) fn GetRectDisplayIndex(rect: const*Rect) int;
export @symbol("SDL_GetWindowDisplayIndex"    ) fn GetWindowDisplayIndex(window: *Window) int;
export @symbol("SDL_SetWindowDisplayMode"     ) fn SetWindowDisplayMode(window: *Window, mode: const*DisplayMode) int;
export @symbol("SDL_GetWindowDisplayMode"     ) fn GetWindowDisplayMode(window: *Window, mode: *DisplayMode) int;
export @symbol("SDL_GetWindowICCProfile"      ) fn GetWindowICCProfile(window: *Window, _size: *size) *opaque;
export @symbol("SDL_GetWindowPixelFormat"     ) fn GetWindowPixelFormat(window: *Window) u32;
export @symbol("SDL_CreateWindow"             ) fn CreateWindow(title: const*c::char, x: int, y: int, w: int, h: int, flags: WindowFlags) *Window;
export @symbol("SDL_CreateWindowFrom"         ) fn CreateWindowFrom(data: const*opaque) *Window;
export @symbol("SDL_GetWindowID"              ) fn GetWindowID(window: *Window) u32;
export @symbol("SDL_GetWindowFromID"          ) fn GetWindowFromID(id: u32) *Window;
export @symbol("SDL_GetWindowFlags"           ) fn GetWindowFlags(window: *Window) u32;
export @symbol("SDL_SetWindowTitle"           ) fn SetWindowTitle(window: *Window, title: const*c::char) void;
export @symbol("SDL_GetWindowTitle"           ) fn GetWindowTitle(window: *Window) const*c::char;
export @symbol("SDL_SetWindowIcon"            ) fn SetWindowIcon(window: *Window, icon: *Surface) void;
export @symbol("SDL_SetWindowData"            ) fn SetWindowData(window: *Window, name: const*c::char, userdata: *opaque) *opaque;
export @symbol("SDL_GetWindowData"            ) fn GetWindowData(window: *Window, name: const*c::char) *opaque;
export @symbol("SDL_SetWindowPosition"        ) fn SetWindowPosition(window: *Window, x: int, y: int) void;
export @symbol("SDL_GetWindowPosition"        ) fn GetWindowPosition(window: *Window, x: *int, y: *int) void;
export @symbol("SDL_SetWindowSize"            ) fn SetWindowSize(window: *Window, w: int, h: int) void;
export @symbol("SDL_GetWindowSize"            ) fn GetWindowSize(window: *Window, w: *int, h: *int) void;
export @symbol("SDL_GetWindowBordersSize"     ) fn GetWindowBordersSize(window: *Window, top: *int, left: *int, bottom: *int, right: *int) int;
export @symbol("SDL_GetWindowSizeInPixels"    ) fn GetWindowSizeInPixels(window: *Window, w: *int, h: *int) void;
export @symbol("SDL_SetWindowMinimumSize"     ) fn SetWindowMinimumSize(window: *Window, min_w: int, min_h: int) void;
export @symbol("SDL_GetWindowMinimumSize"     ) fn GetWindowMinimumSize(window: *Window, w: *int, h: *int) void;
export @symbol("SDL_SetWindowMaximumSize"     ) fn SetWindowMaximumSize(window: *Window, max_w: int, max_h: int) void;
export @symbol("SDL_GetWindowMaximumSize"     ) fn GetWindowMaximumSize(window: *Window, w: *int, h: *int) void;
export @symbol("SDL_SetWindowBordered"        ) fn SetWindowBordered(window: *Window, bordered: Bool) void;
export @symbol("SDL_SetWindowResizable"       ) fn SetWindowResizable(window: *Window, resizable: Bool) void;
export @symbol("SDL_SetWindowAlwaysOnTop"     ) fn SetWindowAlwaysOnTop(window: *Window, on_top: Bool) void;
export @symbol("SDL_ShowWindow"               ) fn ShowWindow(window: *Window) void;
export @symbol("SDL_HideWindow"               ) fn HideWindow(window: *Window) void;
export @symbol("SDL_RaiseWindow"              ) fn RaiseWindow(window: *Window) void;
export @symbol("SDL_MaximizeWindow"           ) fn MaximizeWindow(window: *Window) void;
export @symbol("SDL_MinimizeWindow"           ) fn MinimizeWindow(window: *Window) void;
export @symbol("SDL_RestoreWindow"            ) fn RestoreWindow(window: *Window) void;
export @symbol("SDL_SetWindowFullscreen"      ) fn SetWindowFullscreen(window: *Window, flags: WindowFlags) int;
export @symbol("SDL_HasWindowSurface"         ) fn HasWindowSurface(window: *Window) Bool;
export @symbol("SDL_GetWindowSurface"         ) fn GetWindowSurface(window: *Window) *Surface;
export @symbol("SDL_UpdateWindowSurface"      ) fn UpdateWindowSurface(window: *Window) int;
export @symbol("SDL_UpdateWindowSurfaceRects" ) fn UpdateWindowSurfaceRects(window: *Window, rects: const*Rect, numrects: int) int;
export @symbol("SDL_DestroyWindowSurface"     ) fn DestroyWindowSurface(window: *Window) int;
export @symbol("SDL_SetWindowGrab"            ) fn SetWindowGrab(window: *Window, grabbed: Bool) void;
export @symbol("SDL_SetWindowKeyboardGrab"    ) fn SetWindowKeyboardGrab(window: *Window, grabbed: Bool) void;
export @symbol("SDL_SetWindowMouseGrab"       ) fn SetWindowMouseGrab(window: *Window, grabbed: Bool) void;
export @symbol("SDL_GetWindowGrab"            ) fn GetWindowGrab(window: *Window) Bool;
export @symbol("SDL_GetWindowKeyboardGrab"    ) fn GetWindowKeyboardGrab(window: *Window) Bool;
export @symbol("SDL_GetWindowMouseGrab"       ) fn GetWindowMouseGrab(window: *Window) Bool;
export @symbol("SDL_GetGrabbedWindow"         ) fn GetGrabbedWindow() *Window;
export @symbol("SDL_SetWindowMouseRect"       ) fn SetWindowMouseRect(window: *Window, rect: const*Rect) int;
export @symbol("SDL_GetWindowMouseRect"       ) fn GetWindowMouseRect(window: *Window) const *Rect;
export @symbol("SDL_SetWindowBrightness"      ) fn SetWindowBrightness(window: *Window, brightness: f32) int;
export @symbol("SDL_GetWindowBrightness"      ) fn GetWindowBrightness(window: *Window) f32;
export @symbol("SDL_SetWindowOpacity"         ) fn SetWindowOpacity(window: *Window, opacity: f32) int;
export @symbol("SDL_GetWindowOpacity"         ) fn GetWindowOpacity(window: *Window, out_opacity: *f32) int;
export @symbol("SDL_SetWindowModalFor"        ) fn SetWindowModalFor(modal_window: *Window, parent_window: *Window) int;
export @symbol("SDL_SetWindowInputFocus"      ) fn SetWindowInputFocus(window: *Window) int;
export @symbol("SDL_SetWindowGammaRamp"       ) fn SetWindowGammaRamp(window: *Window, red: const*u16, green: const*u16, blue: const*u16) int;
export @symbol("SDL_GetWindowGammaRamp"       ) fn GetWindowGammaRamp(window: *Window, red: *u16, green: *u16, blue: *u16) int;

export type HitTestResult = enum {
	HITTEST_NORMAL,
	HITTEST_DRAGGABLE,
	HITTEST_RESIZE_TOPLEFT,
	HITTEST_RESIZE_TOP,
	HITTEST_RESIZE_TOPRIGHT,
	HITTEST_RESIZE_RIGHT,
	HITTEST_RESIZE_BOTTOMRIGHT,
	HITTEST_RESIZE_BOTTOM,
	HITTEST_RESIZE_BOTTOMLEFT,
	HITTEST_RESIZE_LEFT,
};

export type HitTest = *fn(win: *Window, area: const*Point, data: *opaque) HitTestResult;

export @symbol("SDL_SetWindowHitTest"      ) fn SetWindowHitTest(window: *Window, callback: HitTest, callback_data: *opaque) int;
export @symbol("SDL_FlashWindow"           ) fn FlashWindow(window: *Window, operation: FlashOperation) int;
export @symbol("SDL_DestroyWindow"         ) fn DestroyWindow(window: *Window) void;
export @symbol("SDL_IsScreenSaverEnabled"  ) fn IsScreenSaverEnabled() Bool;
export @symbol("SDL_EnableScreenSaver"     ) fn EnableScreenSaver() void;
export @symbol("SDL_DisableScreenSaver"    ) fn DisableScreenSaver() void;
export @symbol("SDL_GL_LoadLibrary"        ) fn GL_LoadLibrary(path: const*c::char) int;
export @symbol("SDL_GL_GetProcAddress"     ) fn GL_GetProcAddress(proc: const*c::char) *opaque;
export @symbol("SDL_GL_UnloadLibrary"      ) fn GL_UnloadLibrary() void;
export @symbol("SDL_GL_ExtensionSupported" ) fn GL_ExtensionSupported(extension: const*c::char) Bool;
export @symbol("SDL_GL_ResetAttributes"    ) fn GL_ResetAttributes() void;
export @symbol("SDL_GL_SetAttribute"       ) fn GL_SetAttribute(attr: GLattr, value: int) int;
export @symbol("SDL_GL_GetAttribute"       ) fn GL_GetAttribute(attr: GLattr, value: *int) int;
export @symbol("SDL_GL_CreateContext"      ) fn GL_CreateContext(window: *Window) GLContext;
export @symbol("SDL_GL_MakeCurrent"        ) fn GL_MakeCurrent(window: *Window, context: GLContext) int;
export @symbol("SDL_GL_GetCurrentWindow"   ) fn GL_GetCurrentWindow() *Window;
export @symbol("SDL_GL_GetCurrentContext"  ) fn GL_GetCurrentContext() GLContext;
export @symbol("SDL_GL_GetDrawableSize"    ) fn GL_GetDrawableSize(window: *Window, w: *int, h: *int) void;
export @symbol("SDL_GL_SetSwapInterval"    ) fn GL_SetSwapInterval(interval: int) int;
export @symbol("SDL_GL_GetSwapInterval"    ) fn GL_GetSwapInterval() int;
export @symbol("SDL_GL_SwapWindow"         ) fn GL_SwapWindow(window: *Window) void;
export @symbol("SDL_GL_DeleteContext"      ) fn GL_DeleteContext(context: GLContext) void;
