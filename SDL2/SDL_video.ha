use types::c;

export type SDL_DisplayMode = struct {
	format:       u32,
	w:            int,
	h:            int,
	refresh_rate: int,
	driverdata:   *opaque,
};

export type SDL_Window = opaque;

export type  SDL_WindowFlags = enum {
	SDL_WINDOW_FULLSCREEN         = 0x00000001,
	SDL_WINDOW_OPENGL             = 0x00000002,
	SDL_WINDOW_SHOWN              = 0x00000004,
	SDL_WINDOW_HIDDEN             = 0x00000008,
	SDL_WINDOW_BORDERLESS         = 0x00000010,
	SDL_WINDOW_RESIZABLE          = 0x00000020,
	SDL_WINDOW_MINIMIZED          = 0x00000040,
	SDL_WINDOW_MAXIMIZED          = 0x00000080,
	SDL_WINDOW_MOUSE_GRABBED      = 0x00000100,
	SDL_WINDOW_INPUT_FOCUS        = 0x00000200,
	SDL_WINDOW_MOUSE_FOCUS        = 0x00000400,
	SDL_WINDOW_FULLSCREEN_DESKTOP = (SDL_WINDOW_FULLSCREEN | 0x00001000),
	SDL_WINDOW_FOREIGN            = 0x00000800,
	SDL_WINDOW_ALLOW_HIGHDPI      = 0x00002000,
	SDL_WINDOW_MOUSE_CAPTURE      = 0x00004000,
	SDL_WINDOW_ALWAYS_ON_TOP      = 0x00008000,
	SDL_WINDOW_SKIP_TASKBAR       = 0x00010000,
	SDL_WINDOW_UTILITY            = 0x00020000,
	SDL_WINDOW_TOOLTIP            = 0x00040000,
	SDL_WINDOW_POPUP_MENU         = 0x00080000,
	SDL_WINDOW_KEYBOARD_GRABBED   = 0x00100000,
	SDL_WINDOW_VULKAN             = 0x10000000,
	SDL_WINDOW_METAL              = 0x20000000,
	SDL_WINDOW_INPUT_GRABBED      = SDL_WINDOW_MOUSE_GRABBED,
};


export type SDL_WindowEventID = enum {
	SDL_WINDOWEVENT_NONE,
	SDL_WINDOWEVENT_SHOWN,
	SDL_WINDOWEVENT_HIDDEN,
	SDL_WINDOWEVENT_EXPOSED,
	SDL_WINDOWEVENT_MOVED,
	SDL_WINDOWEVENT_RESIZED,
	SDL_WINDOWEVENT_SIZE_CHANGED,
	SDL_WINDOWEVENT_MINIMIZED,
	SDL_WINDOWEVENT_MAXIMIZED,
	SDL_WINDOWEVENT_RESTORED,
	SDL_WINDOWEVENT_ENTER,
	SDL_WINDOWEVENT_LEAVE,
	SDL_WINDOWEVENT_FOCUS_GAINED,
	SDL_WINDOWEVENT_FOCUS_LOST,
	SDL_WINDOWEVENT_CLOSE,
	SDL_WINDOWEVENT_TAKE_FOCUS,
	SDL_WINDOWEVENT_HIT_TEST,
	SDL_WINDOWEVENT_ICCPROF_CHANGED,
	SDL_WINDOWEVENT_DISPLAY_CHANGED,
};

export type SDL_DisplayEventID = enum {
	SDL_DISPLAYEVENT_NONE,
	SDL_DISPLAYEVENT_ORIENTATION,
	SDL_DISPLAYEVENT_CONNECTED,
	SDL_DISPLAYEVENT_DISCONNECTED,
	SDL_DISPLAYEVENT_MOVED,
};

export type SDL_DisplayOrientation = enum {
	SDL_ORIENTATION_UNKNOWN,
	SDL_ORIENTATION_LANDSCAPE,
	SDL_ORIENTATION_LANDSCAPE_FLIPPED,
	SDL_ORIENTATION_PORTRAIT,
	SDL_ORIENTATION_PORTRAIT_FLIPPED,
};

export type SDL_FlashOperation = enum {
	SDL_FLASH_CANCEL,
	SDL_FLASH_BRIEFLY,
	SDL_FLASH_UNTIL_FOCUSED,
};

export type SDL_GLattr = enum {
	SDL_GL_RED_SIZE,
	SDL_GL_GREEN_SIZE,
	SDL_GL_BLUE_SIZE,
	SDL_GL_ALPHA_SIZE,
	SDL_GL_BUFFER_SIZE,
	SDL_GL_DOUBLEBUFFER,
	SDL_GL_DEPTH_SIZE,
	SDL_GL_STENCIL_SIZE,
	SDL_GL_ACCUM_RED_SIZE,
	SDL_GL_ACCUM_GREEN_SIZE,
	SDL_GL_ACCUM_BLUE_SIZE,
	SDL_GL_ACCUM_ALPHA_SIZE,
	SDL_GL_STEREO,
	SDL_GL_MULTISAMPLEBUFFERS,
	SDL_GL_MULTISAMPLESAMPLES,
	SDL_GL_ACCELERATED_VISUAL,
	SDL_GL_RETAINED_BACKING,
	SDL_GL_CONTEXT_MAJOR_VERSION,
	SDL_GL_CONTEXT_MINOR_VERSION,
	SDL_GL_CONTEXT_EGL,
	SDL_GL_CONTEXT_FLAGS,
	SDL_GL_CONTEXT_PROFILE_MASK,
	SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
	SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
	SDL_GL_CONTEXT_RESET_NOTIFICATION,
	SDL_GL_CONTEXT_NO_ERROR,
	SDL_GL_FLOATBUFFERS,
};

export type SDL_GLContext = *opaque;

export type SDL_GLprofile = enum {
	SDL_GL_CONTEXT_PROFILE_CORE          = 0x0001,
	SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002,
	SDL_GL_CONTEXT_PROFILE_ES            = 0x0004,
};

export type SDL_GLcontextFlag = enum {
	SDL_GL_CONTEXT_DEBUG_FLAG              = 0x0001,
	SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
	SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      = 0x0004,
	SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    = 0x0008,
};

export type SDL_GLcontextReleaseFlag = enum {
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE  = 0x0000,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001,
};

export type SDL_GLContextResetNotification = enum {
	SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000,
	SDL_GL_CONTEXT_RESET_LOSE_CONTEXT    = 0x0001,
};

export @symbol("SDL_GetNumVideoDrivers"       ) fn GetNumVideoDrivers() int;
export @symbol("SDL_GetVideoDriver"           ) fn GetVideoDriver(index: int) const*c::char;
export @symbol("SDL_VideoInit"                ) fn VideoInit(driver_name: const*c::char) int;
export @symbol("SDL_VideoQuit"                ) fn VideoQuit() void;
export @symbol("SDL_GetCurrentVideoDriver"    ) fn GetCurrentVideoDriver() const*c::char;
export @symbol("SDL_GetNumVideoDisplays"      ) fn GetNumVideoDisplays() int;
export @symbol("SDL_GetDisplayName"           ) fn GetDisplayName(displayIndex: int) const*c::char;
export @symbol("SDL_GetDisplayBounds"         ) fn GetDisplayBounds(displayIndex: int, rect: *SDL_Rect) int;
export @symbol("SDL_GetDisplayUsableBounds"   ) fn GetDisplayUsableBounds(displayIndex: int, rect: *SDL_Rect) int;
export @symbol("SDL_GetDisplayDPI"            ) fn GetDisplayDPI(displayIndex: int, ddpi: *f32, hdpi: *f32, vdpi: *f32) int;
export @symbol("SDL_GetDisplayOrientation"    ) fn GetDisplayOrientation(displayIndex: int) SDL_DisplayOrientation;
export @symbol("SDL_GetNumDisplayModes"       ) fn GetNumDisplayModes(displayIndex: int) int;
export @symbol("SDL_GetDisplayMode"           ) fn GetDisplayMode(displayIndex: int, modeIndex: int, mode: *SDL_DisplayMode) int;
export @symbol("SDL_GetDesktopDisplayMode"    ) fn GetDesktopDisplayMode(displayIndex: int, mode: *SDL_DisplayMode) int;
export @symbol("SDL_GetCurrentDisplayMode"    ) fn GetCurrentDisplayMode(displayIndex: int, mode: *SDL_DisplayMode) int;
export @symbol("SDL_GetClosestDisplayMode"    ) fn GetClosestDisplayMode(displayIndex: int, mode: const*SDL_DisplayMode, closest: *SDL_DisplayMode) *SDL_DisplayMode;
export @symbol("SDL_GetPointDisplayIndex"     ) fn GetPointDisplayIndex(point: const*SDL_Point) int;
export @symbol("SDL_GetRectDisplayIndex"      ) fn GetRectDisplayIndex(rect: const*SDL_Rect) int;
export @symbol("SDL_GetWindowDisplayIndex"    ) fn GetWindowDisplayIndex(window: *SDL_Window) int;
export @symbol("SDL_SetWindowDisplayMode"     ) fn SetWindowDisplayMode(window: *SDL_Window, mode: const*SDL_DisplayMode) int;
export @symbol("SDL_GetWindowDisplayMode"     ) fn GetWindowDisplayMode(window: *SDL_Window, mode: *SDL_DisplayMode) int;
export @symbol("SDL_GetWindowICCProfile"      ) fn GetWindowICCProfile(window: *SDL_Window, _size: *size) *opaque;
export @symbol("SDL_GetWindowPixelFormat"     ) fn GetWindowPixelFormat(window: *SDL_Window) u32;
export @symbol("SDL_CreateWindow"             ) fn CreateWindow(title: const*c::char, x: int, y: int, w: int, h: int, flags: SDL_WindowFlags) *SDL_Window;
export @symbol("SDL_CreateWindowFrom"         ) fn CreateWindowFrom(data: const*opaque) *SDL_Window;
export @symbol("SDL_GetWindowID"              ) fn GetWindowID(window: *SDL_Window) u32;
export @symbol("SDL_GetWindowFromID"          ) fn GetWindowFromID(id: u32) *SDL_Window;
export @symbol("SDL_GetWindowFlags"           ) fn GetWindowFlags(window: *SDL_Window) u32;
export @symbol("SDL_SetWindowTitle"           ) fn SetWindowTitle(window: *SDL_Window, title: const*c::char) void;
export @symbol("SDL_GetWindowTitle"           ) fn GetWindowTitle(window: *SDL_Window) const*c::char;
export @symbol("SDL_SetWindowIcon"            ) fn SetWindowIcon(window: *SDL_Window, icon: *SDL_Surface) void;
export @symbol("SDL_SetWindowData"            ) fn SetWindowData(window: *SDL_Window, name: const*c::char, userdata: *opaque) *opaque;
export @symbol("SDL_GetWindowData"            ) fn GetWindowData(window: *SDL_Window, name: const*c::char) *opaque;
export @symbol("SDL_SetWindowPosition"        ) fn SetWindowPosition(window: *SDL_Window, x: int, y: int) void;
export @symbol("SDL_GetWindowPosition"        ) fn GetWindowPosition(window: *SDL_Window, x: *int, y: *int) void;
export @symbol("SDL_SetWindowSize"            ) fn SetWindowSize(window: *SDL_Window, w: int, h: int) void;
export @symbol("SDL_GetWindowSize"            ) fn GetWindowSize(window: *SDL_Window, w: *int, h: *int) void;
export @symbol("SDL_GetWindowBordersSize"     ) fn GetWindowBordersSize(window: *SDL_Window, top: *int, left: *int, bottom: *int, right: *int) int;
export @symbol("SDL_GetWindowSizeInPixels"    ) fn GetWindowSizeInPixels(window: *SDL_Window, w: *int, h: *int) void;
export @symbol("SDL_SetWindowMinimumSize"     ) fn SetWindowMinimumSize(window: *SDL_Window, min_w: int, min_h: int) void;
export @symbol("SDL_GetWindowMinimumSize"     ) fn GetWindowMinimumSize(window: *SDL_Window, w: *int, h: *int) void;
export @symbol("SDL_SetWindowMaximumSize"     ) fn SetWindowMaximumSize(window: *SDL_Window, max_w: int, max_h: int) void;
export @symbol("SDL_GetWindowMaximumSize"     ) fn GetWindowMaximumSize(window: *SDL_Window, w: *int, h: *int) void;
export @symbol("SDL_SetWindowBordered"        ) fn SetWindowBordered(window: *SDL_Window, bordered: SDL_bool) void;
export @symbol("SDL_SetWindowResizable"       ) fn SetWindowResizable(window: *SDL_Window, resizable: SDL_bool) void;
export @symbol("SDL_SetWindowAlwaysOnTop"     ) fn SetWindowAlwaysOnTop(window: *SDL_Window, on_top: SDL_bool) void;
export @symbol("SDL_ShowWindow"               ) fn ShowWindow(window: *SDL_Window) void;
export @symbol("SDL_HideWindow"               ) fn HideWindow(window: *SDL_Window) void;
export @symbol("SDL_RaiseWindow"              ) fn RaiseWindow(window: *SDL_Window) void;
export @symbol("SDL_MaximizeWindow"           ) fn MaximizeWindow(window: *SDL_Window) void;
export @symbol("SDL_MinimizeWindow"           ) fn MinimizeWindow(window: *SDL_Window) void;
export @symbol("SDL_RestoreWindow"            ) fn RestoreWindow(window: *SDL_Window) void;
export @symbol("SDL_SetWindowFullscreen"      ) fn SetWindowFullscreen(window: *SDL_Window, flags: SDL_WindowFlags) int;
export @symbol("SDL_HasWindowSurface"         ) fn HasWindowSurface(window: *SDL_Window) SDL_bool;
export @symbol("SDL_GetWindowSurface"         ) fn GetWindowSurface(window: *SDL_Window) *SDL_Surface;
export @symbol("SDL_UpdateWindowSurface"      ) fn UpdateWindowSurface(window: *SDL_Window) int;
export @symbol("SDL_UpdateWindowSurfaceRects" ) fn UpdateWindowSurfaceRects(window: *SDL_Window, rects: const*SDL_Rect, numrects: int) int;
export @symbol("SDL_DestroyWindowSurface"     ) fn DestroyWindowSurface(window: *SDL_Window) int;
export @symbol("SDL_SetWindowGrab"            ) fn SetWindowGrab(window: *SDL_Window, grabbed: SDL_bool) void;
export @symbol("SDL_SetWindowKeyboardGrab"    ) fn SetWindowKeyboardGrab(window: *SDL_Window, grabbed: SDL_bool) void;
export @symbol("SDL_SetWindowMouseGrab"       ) fn SetWindowMouseGrab(window: *SDL_Window, grabbed: SDL_bool) void;
export @symbol("SDL_GetWindowGrab"            ) fn GetWindowGrab(window: *SDL_Window) SDL_bool;
export @symbol("SDL_GetWindowKeyboardGrab"    ) fn GetWindowKeyboardGrab(window: *SDL_Window) SDL_bool;
export @symbol("SDL_GetWindowMouseGrab"       ) fn GetWindowMouseGrab(window: *SDL_Window) SDL_bool;
export @symbol("SDL_GetGrabbedWindow"         ) fn GetGrabbedWindow() *SDL_Window;
export @symbol("SDL_SetWindowMouseRect"       ) fn SetWindowMouseRect(window: *SDL_Window, rect: const*SDL_Rect) int;
export @symbol("SDL_GetWindowMouseRect"       ) fn GetWindowMouseRect(window: *SDL_Window) const *SDL_Rect;
export @symbol("SDL_SetWindowBrightness"      ) fn SetWindowBrightness(window: *SDL_Window, brightness: f32) int;
export @symbol("SDL_GetWindowBrightness"      ) fn GetWindowBrightness(window: *SDL_Window) f32;
export @symbol("SDL_SetWindowOpacity"         ) fn SetWindowOpacity(window: *SDL_Window, opacity: f32) int;
export @symbol("SDL_GetWindowOpacity"         ) fn GetWindowOpacity(window: *SDL_Window, out_opacity: *f32) int;
export @symbol("SDL_SetWindowModalFor"        ) fn SetWindowModalFor(modal_window: *SDL_Window, parent_window: *SDL_Window) int;
export @symbol("SDL_SetWindowInputFocus"      ) fn SetWindowInputFocus(window: *SDL_Window) int;
export @symbol("SDL_SetWindowGammaRamp"       ) fn SetWindowGammaRamp(window: *SDL_Window, red: const*u16, green: const*u16, blue: const*u16) int;
export @symbol("SDL_GetWindowGammaRamp"       ) fn GetWindowGammaRamp(window: *SDL_Window, red: *u16, green: *u16, blue: *u16) int;

export type SDL_HitTestResult = enum {
	SDL_HITTEST_NORMAL,
	SDL_HITTEST_DRAGGABLE,
	SDL_HITTEST_RESIZE_TOPLEFT,
	SDL_HITTEST_RESIZE_TOP,
	SDL_HITTEST_RESIZE_TOPRIGHT,
	SDL_HITTEST_RESIZE_RIGHT,
	SDL_HITTEST_RESIZE_BOTTOMRIGHT,
	SDL_HITTEST_RESIZE_BOTTOM,
	SDL_HITTEST_RESIZE_BOTTOMLEFT,
	SDL_HITTEST_RESIZE_LEFT,
};

export type SDL_HitTest = *fn(win: *SDL_Window, area: const*SDL_Point, data: *opaque) SDL_HitTestResult;

export @symbol("SDL_SetWindowHitTest"      ) fn SetWindowHitTest(window: *SDL_Window, callback: SDL_HitTest, callback_data: *opaque) int;
export @symbol("SDL_FlashWindow"           ) fn FlashWindow(window: *SDL_Window, operation: SDL_FlashOperation) int;
export @symbol("SDL_DestroyWindow"         ) fn DestroyWindow(window: *SDL_Window) void;
export @symbol("SDL_IsScreenSaverEnabled"  ) fn IsScreenSaverEnabled() SDL_bool;
export @symbol("SDL_EnableScreenSaver"     ) fn EnableScreenSaver() void;
export @symbol("SDL_DisableScreenSaver"    ) fn DisableScreenSaver() void;
export @symbol("SDL_GL_LoadLibrary"        ) fn GL_LoadLibrary(path: const*c::char) int;
export @symbol("SDL_GL_GetProcAddress"     ) fn GL_GetProcAddress(proc: const*c::char) *opaque;
export @symbol("SDL_GL_UnloadLibrary"      ) fn GL_UnloadLibrary() void;
export @symbol("SDL_GL_ExtensionSupported" ) fn GL_ExtensionSupported(extension: const*c::char) SDL_bool;
export @symbol("SDL_GL_ResetAttributes"    ) fn GL_ResetAttributes() void;
export @symbol("SDL_GL_SetAttribute"       ) fn GL_SetAttribute(attr: SDL_GLattr, value: int) int;
export @symbol("SDL_GL_GetAttribute"       ) fn GL_GetAttribute(attr: SDL_GLattr, value: *int) int;
export @symbol("SDL_GL_CreateContext"      ) fn GL_CreateContext(window: *SDL_Window) SDL_GLContext;
export @symbol("SDL_GL_MakeCurrent"        ) fn GL_MakeCurrent(window: *SDL_Window, context: SDL_GLContext) int;
export @symbol("SDL_GL_GetCurrentWindow"   ) fn GL_GetCurrentWindow() *SDL_Window;
export @symbol("SDL_GL_GetCurrentContext"  ) fn GL_GetCurrentContext() SDL_GLContext;
export @symbol("SDL_GL_GetDrawableSize"    ) fn GL_GetDrawableSize(window: *SDL_Window, w: *int, h: *int) void;
export @symbol("SDL_GL_SetSwapInterval"    ) fn GL_SetSwapInterval(interval: int) int;
export @symbol("SDL_GL_GetSwapInterval"    ) fn GL_GetSwapInterval() int;
export @symbol("SDL_GL_SwapWindow"         ) fn GL_SwapWindow(window: *SDL_Window) void;
export @symbol("SDL_GL_DeleteContext"      ) fn GL_DeleteContext(context: SDL_GLContext) void;
