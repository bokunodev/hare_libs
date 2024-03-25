use types::c;

export type SDL_RendererFlags = enum {
	SDL_RENDERER_SOFTWARE      = 0x00000001,
	SDL_RENDERER_ACCELERATED   = 0x00000002,
	SDL_RENDERER_PRESENTVSYNC  = 0x00000004,
	SDL_RENDERER_TARGETTEXTURE = 0x00000008,
};

export type SDL_RendererInfo = struct {
	name:                const*c::char,
	flags:               SDL_RendererFlags,
	num_texture_formats: u32,
	texture_formats: [16]u32,
	max_texture_width:   int,
	max_texture_height:  int,
};

export type SDL_Vertex = struct {
	position:  SDL_FPoint,
	color:     SDL_Color,
	tex_coord: SDL_FPoint,
};

export type SDL_ScaleMode = enum {
	SDL_ScaleModeNearest,
	SDL_ScaleModeLinear,
	SDL_ScaleModeBest,
};

export type SDL_TextureAccess = enum {
	SDL_TEXTUREACCESS_STATIC,
	SDL_TEXTUREACCESS_STREAMING,
	SDL_TEXTUREACCESS_TARGET,
};

export type SDL_TextureModulate = enum {
	SDL_TEXTUREMODULATE_NONE = 0x00000000,
	SDL_TEXTUREMODULATE_COLOR = 0x00000001,
	SDL_TEXTUREMODULATE_ALPHA = 0x00000002,
};

export type SDL_RendererFlip = enum {
	SDL_FLIP_NONE       = 0x00000000,
	SDL_FLIP_HORIZONTAL = 0x00000001,
	SDL_FLIP_VERTICAL   = 0x00000002,
};

export type SDL_Renderer = opaque;
export type SDL_Texture  = opaque;
export @symbol("SDL_GetNumRenderDrivers"          ) fn GetNumRenderDrivers() int;
export @symbol("SDL_GetRenderDriverInfo"          ) fn GetRenderDriverInfo(index: int, info: *SDL_RendererInfo) int;
export @symbol("SDL_CreateWindowAndRenderer"      ) fn CreateWindowAndRenderer(width: int, height: int, window_flags: u32, window: **SDL_Window, renderer: **SDL_Renderer) int;
export @symbol("SDL_CreateRenderer"               ) fn CreateRenderer(window: *SDL_Window, index: int, flags: SDL_RendererFlags) *SDL_Renderer;
export @symbol("SDL_CreateSoftwareRenderer"       ) fn CreateSoftwareRenderer(surface: *SDL_Surface) *SDL_Renderer;
export @symbol("SDL_GetRenderer"                  ) fn GetRenderer(window: *SDL_Window) *SDL_Renderer;
export @symbol("SDL_RenderGetWindow"              ) fn RenderGetWindow(renderer: *SDL_Renderer) *SDL_Window;
export @symbol("SDL_GetRendererInfo"              ) fn GetRendererInfo(renderer: *SDL_Renderer, info: *SDL_RendererInfo) int;
export @symbol("SDL_GetRendererOutputSize"        ) fn GetRendererOutputSize(renderer: *SDL_Renderer, w: *int, h: *int) int;
export @symbol("SDL_CreateTexture"                ) fn CreateTexture(renderer: *SDL_Renderer, format: u32, access: int, w: int, h: int) *SDL_Texture;
export @symbol("SDL_CreateTextureFromSurface"     ) fn CreateTextureFromSurface(renderer: *SDL_Renderer, surface: *SDL_Surface) *SDL_Texture;
export @symbol("SDL_QueryTexture"                 ) fn QueryTexture(texture: *SDL_Texture, format: *u32, access: *int, w: *int, h: *int) int;
export @symbol("SDL_SetTextureColorMod"           ) fn SetTextureColorMod(texture: *SDL_Texture, r: u8, g: u8, b: u8) int;
export @symbol("SDL_GetTextureColorMod"           ) fn GetTextureColorMod(texture: *SDL_Texture, r: *u8, g: *u8, b: *u8) int;
export @symbol("SDL_SetTextureAlphaMod"           ) fn SetTextureAlphaMod(texture: *SDL_Texture, alpha: u8) int;
export @symbol("SDL_GetTextureAlphaMod"           ) fn GetTextureAlphaMod(texture: *SDL_Texture, alpha: *u8) int;
export @symbol("SDL_SetTextureBlendMode"          ) fn SetTextureBlendMode(texture: *SDL_Texture, blendMode: SDL_BlendMode) int;
export @symbol("SDL_GetTextureBlendMode"          ) fn GetTextureBlendMode(texture: *SDL_Texture, blendMode: *SDL_BlendMode) int;
export @symbol("SDL_SetTextureScaleMode"          ) fn SetTextureScaleMode(texture: *SDL_Texture, scaleMode: SDL_ScaleMode) int;
export @symbol("SDL_GetTextureScaleMode"          ) fn GetTextureScaleMode(texture: *SDL_Texture, scaleMode: *SDL_ScaleMode) int;
export @symbol("SDL_SetTextureUserData"           ) fn SetTextureUserData(texture: *SDL_Texture, userdata: *opaque) int;
export @symbol("SDL_GetTextureUserData"           ) fn GetTextureUserData(texture: *SDL_Texture) *opaque;
export @symbol("SDL_UpdateTexture"                ) fn UpdateTexture(texture: *SDL_Texture, rect: const*SDL_Rect, pixels: const*opaque, pitch: int) int;
export @symbol("SDL_UpdateYUVTexture"             ) fn UpdateYUVTexture(texture: *SDL_Texture, rect: const*SDL_Rect, Yplane: const*u8, Ypitch: int, Uplane: const*u8, Upitch: int, Vplane: const*u8, Vpitch: int) int;
export @symbol("SDL_UpdateNVTexture"              ) fn UpdateNVTexture(texture: *SDL_Texture, rect: const*SDL_Rect, Yplane: const*u8, Ypitch: int, UVplane: const*u8, UVpitch: int) int;
export @symbol("SDL_LockTexture"                  ) fn LockTexture(texture: *SDL_Texture, rect: const*SDL_Rect, pixels: **opaque, pitch: *int) int;
export @symbol("SDL_LockTextureToSurface"         ) fn LockTextureToSurface(texture: *SDL_Texture, rect: const*SDL_Rect, surface: **SDL_Surface) int;
export @symbol("SDL_UnlockTexture"                ) fn UnlockTexture(texture: *SDL_Texture) void;
export @symbol("SDL_RenderTargetSupported"        ) fn RenderTargetSupported(renderer: *SDL_Renderer) SDL_bool;
export @symbol("SDL_SetRenderTarget"              ) fn SetRenderTarget(renderer: *SDL_Renderer, texture: *SDL_Texture) int;
export @symbol("SDL_GetRenderTarget"              ) fn GetRenderTarget(renderer: *SDL_Renderer) *SDL_Texture;
export @symbol("SDL_RenderSetLogicalSize"         ) fn RenderSetLogicalSize(renderer: *SDL_Renderer, w: int, h: int) int;
export @symbol("SDL_RenderGetLogicalSize"         ) fn RenderGetLogicalSize(renderer: *SDL_Renderer, w: *int, h: *int) void;
export @symbol("SDL_RenderSetIntegerScale"        ) fn RenderSetIntegerScale(renderer: *SDL_Renderer, enable: SDL_bool) int;
export @symbol("SDL_RenderGetIntegerScale"        ) fn RenderGetIntegerScale(renderer: *SDL_Renderer) SDL_bool;
export @symbol("SDL_RenderSetViewport"            ) fn RenderSetViewport(renderer: *SDL_Renderer, rect: const*SDL_Rect) int;
export @symbol("SDL_RenderGetViewport"            ) fn RenderGetViewport(renderer: *SDL_Renderer, rect: *SDL_Rect) void;
export @symbol("SDL_RenderSetClipRect"            ) fn RenderSetClipRect(renderer: *SDL_Renderer, rect: const*SDL_Rect) int;
export @symbol("SDL_RenderGetClipRect"            ) fn RenderGetClipRect(renderer: *SDL_Renderer, rect: *SDL_Rect) void;
export @symbol("SDL_RenderIsClipEnabled"          ) fn RenderIsClipEnabled(renderer: *SDL_Renderer) SDL_bool;
export @symbol("SDL_RenderSetScale"               ) fn RenderSetScale(renderer: *SDL_Renderer, scaleX: f32, scaleY: f32) int;
export @symbol("SDL_RenderGetScale"               ) fn RenderGetScale(renderer: *SDL_Renderer, scaleX: *f32, scaleY: *f32) void;
export @symbol("SDL_RenderWindowToLogical"        ) fn RenderWindowToLogical(renderer: *SDL_Renderer, windowX: int, windowY: int, logicalX: *f32, logicalY: *f32) void;
export @symbol("SDL_RenderLogicalToWindow"        ) fn RenderLogicalToWindow(renderer: *SDL_Renderer, logicalX: f32, logicalY: f32, windowX: *int, windowY: *int) void;
export @symbol("SDL_SetRenderDrawColor"           ) fn SetRenderDrawColor(renderer: *SDL_Renderer, r: u8, g: u8, b: u8, a: u8) int;
export @symbol("SDL_GetRenderDrawColor"           ) fn GetRenderDrawColor(renderer: *SDL_Renderer, r: *u8, g: *u8, b: *u8, a: *u8) int;
export @symbol("SDL_SetRenderDrawBlendMode"       ) fn SetRenderDrawBlendMode(renderer: *SDL_Renderer, blendMode: SDL_BlendMode) int;
export @symbol("SDL_GetRenderDrawBlendMode"       ) fn GetRenderDrawBlendMode(renderer: *SDL_Renderer, blendMode: *SDL_BlendMode) int;
export @symbol("SDL_RenderClear"                  ) fn RenderClear(renderer: *SDL_Renderer) int;
export @symbol("SDL_RenderDrawPoint"              ) fn RenderDrawPoint(renderer: *SDL_Renderer, x: int, y: int) int;
export @symbol("SDL_RenderDrawPoints"             ) fn RenderDrawPoints(renderer: *SDL_Renderer, points: const*SDL_Point, count: int) int;
export @symbol("SDL_RenderDrawLine"               ) fn RenderDrawLine(renderer: *SDL_Renderer, x1: int, y1: int, x2: int, y2: int) int;
export @symbol("SDL_RenderDrawLines"              ) fn RenderDrawLines(renderer: *SDL_Renderer, points: const*SDL_Point, count: int) int;
export @symbol("SDL_RenderDrawRect"               ) fn RenderDrawRect(renderer: *SDL_Renderer, rect: const*SDL_Rect) int;
export @symbol("SDL_RenderDrawRects"              ) fn RenderDrawRects(renderer: *SDL_Renderer, rects: const*SDL_Rect, count: int) int;
export @symbol("SDL_RenderFillRect"               ) fn RenderFillRect(renderer: *SDL_Renderer, rect: const*SDL_Rect) int;
export @symbol("SDL_RenderFillRects"              ) fn RenderFillRects(renderer: *SDL_Renderer, rects: const*SDL_Rect, count: int) int;
export @symbol("SDL_RenderCopy"                   ) fn RenderCopy(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: const*SDL_Rect, dstrect: const*SDL_Rect) int;
export @symbol("SDL_RenderCopyEx"                 ) fn RenderCopyEx(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: const*SDL_Rect, dstrect: const*SDL_Rect, angle: const f64, center: const*SDL_Point, flip: const SDL_RendererFlip) int;
export @symbol("SDL_RenderDrawPointF"             ) fn RenderDrawPointF(renderer: *SDL_Renderer, x: f32, y: f32) int;
export @symbol("SDL_RenderDrawPointsF"            ) fn RenderDrawPointsF(renderer: *SDL_Renderer, points: const*SDL_FPoint, count: int) int;
export @symbol("SDL_RenderDrawLineF"              ) fn RenderDrawLineF(renderer: *SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) int;
export @symbol("SDL_RenderDrawLinesF"             ) fn RenderDrawLinesF(renderer: *SDL_Renderer, points: const*SDL_FPoint, count: int) int;
export @symbol("SDL_RenderDrawRectF"              ) fn RenderDrawRectF(renderer: *SDL_Renderer, rect: const*SDL_FRect) int;
export @symbol("SDL_RenderDrawRectsF"             ) fn RenderDrawRectsF(renderer: *SDL_Renderer, rects: const*SDL_FRect, count: int) int;
export @symbol("SDL_RenderFillRectF"              ) fn RenderFillRectF(renderer: *SDL_Renderer, rect: const*SDL_FRect) int;
export @symbol("SDL_RenderFillRectsF"             ) fn RenderFillRectsF(renderer: *SDL_Renderer, rects: const*SDL_FRect, count: int) int;
export @symbol("SDL_RenderCopyF"                  ) fn RenderCopyF(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: const*SDL_Rect, dstrect: const*SDL_FRect) int;
export @symbol("SDL_RenderCopyExF"                ) fn RenderCopyExF(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: const*SDL_Rect, dstrect: const*SDL_FRect, angle: const f64, center: const*SDL_FPoint, flip: const SDL_RendererFlip) int;
export @symbol("SDL_RenderGeometry"               ) fn RenderGeometry(renderer: *SDL_Renderer, texture: *SDL_Texture, vertices: const*SDL_Vertex, num_vertices: int, indices: const*int, num_indices: int) int;
export @symbol("SDL_RenderGeometryRaw"            ) fn RenderGeometryRaw(renderer: *SDL_Renderer, texture: *SDL_Texture, xy: const*f32, xy_stride: int, color: const*SDL_Color, color_stride: int, uv: const*f32, uv_stride: int, num_vertices: int, indices: const*opaque, num_indices: int, size_indices: int) int;
export @symbol("SDL_RenderReadPixels"             ) fn RenderReadPixels(renderer: *SDL_Renderer, rect: const*SDL_Rect, format: u32, pixels: *opaque, pitch: int) int;
export @symbol("SDL_RenderPresent"                ) fn RenderPresent(renderer: *SDL_Renderer) void;
export @symbol("SDL_DestroyTexture"               ) fn DestroyTexture(texture: *SDL_Texture) void;
export @symbol("SDL_DestroyRenderer"              ) fn DestroyRenderer(renderer: *SDL_Renderer) void;
export @symbol("SDL_RenderFlush"                  ) fn RenderFlush(renderer: *SDL_Renderer) int;
export @symbol("SDL_GL_BindTexture"               ) fn GL_BindTexture(texture: *SDL_Texture, texw: *f32, texh: *f32) int;
export @symbol("SDL_GL_UnbindTexture"             ) fn GL_UnbindTexture(texture: *SDL_Texture) int;
export @symbol("SDL_RenderGetMetalLayer"          ) fn RenderGetMetalLayer(renderer: *SDL_Renderer) *opaque;
export @symbol("SDL_RenderGetMetalCommandEncoder" ) fn RenderGetMetalCommandEncoder(renderer: *SDL_Renderer) *opaque;
export @symbol("SDL_RenderSetVSync"               ) fn RenderSetVSync(renderer: *SDL_Renderer, vsync: int) int;
