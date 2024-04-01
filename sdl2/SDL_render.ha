use types::c;

export type RendererFlags = enum {
	RENDERER_SOFTWARE      = 0x00000001,
	RENDERER_ACCELERATED   = 0x00000002,
	RENDERER_PRESENTVSYNC  = 0x00000004,
	RENDERER_TARGETTEXTURE = 0x00000008,
};

export type RendererInfo = struct {
	name:                const*c::char,
	flags:               RendererFlags,
	num_texture_formats: u32,
	texture_formats: [16]u32,
	max_texture_width:   int,
	max_texture_height:  int,
};

export type Vertex = struct {
	position:  FPoint,
	color:     Color,
	tex_coord: FPoint,
};

export type ScaleMode = enum {
	ScaleModeNearest,
	ScaleModeLinear,
	ScaleModeBest,
};

export type TextureAccess = enum {
	TEXTUREACCESS_STATIC,
	TEXTUREACCESS_STREAMING,
	TEXTUREACCESS_TARGET,
};

export type TextureModulate = enum {
	TEXTUREMODULATE_NONE = 0x00000000,
	TEXTUREMODULATE_COLOR = 0x00000001,
	TEXTUREMODULATE_ALPHA = 0x00000002,
};

export type RendererFlip = enum {
	FLIP_NONE       = 0x00000000,
	FLIP_HORIZONTAL = 0x00000001,
	FLIP_VERTICAL   = 0x00000002,
};

export type Renderer = opaque;
export type Texture  = opaque;
export @symbol("SDL_GetNumRenderDrivers"          ) fn GetNumRenderDrivers() int;
export @symbol("SDL_GetRenderDriverInfo"          ) fn GetRenderDriverInfo(index: int, info: *RendererInfo) int;
export @symbol("SDL_CreateWindowAndRenderer"      ) fn CreateWindowAndRenderer(width: int, height: int, window_flags: u32, window: **Window, renderer: **Renderer) int;
export @symbol("SDL_CreateRenderer"               ) fn CreateRenderer(window: *Window, index: int, flags: RendererFlags) *Renderer;
export @symbol("SDL_CreateSoftwareRenderer"       ) fn CreateSoftwareRenderer(surface: *Surface) *Renderer;
export @symbol("SDL_GetRenderer"                  ) fn GetRenderer(window: *Window) *Renderer;
export @symbol("SDL_RenderGetWindow"              ) fn RenderGetWindow(renderer: *Renderer) *Window;
export @symbol("SDL_GetRendererInfo"              ) fn GetRendererInfo(renderer: *Renderer, info: *RendererInfo) int;
export @symbol("SDL_GetRendererOutputSize"        ) fn GetRendererOutputSize(renderer: *Renderer, w: *int, h: *int) int;
export @symbol("SDL_CreateTexture"                ) fn CreateTexture(renderer: *Renderer, format: u32, access: int, w: int, h: int) *Texture;
export @symbol("SDL_CreateTextureFromSurface"     ) fn CreateTextureFromSurface(renderer: *Renderer, surface: *Surface) *Texture;
export @symbol("SDL_QueryTexture"                 ) fn QueryTexture(texture: *Texture, format: *u32, access: *int, w: *int, h: *int) int;
export @symbol("SDL_SetTextureColorMod"           ) fn SetTextureColorMod(texture: *Texture, r: u8, g: u8, b: u8) int;
export @symbol("SDL_GetTextureColorMod"           ) fn GetTextureColorMod(texture: *Texture, r: *u8, g: *u8, b: *u8) int;
export @symbol("SDL_SetTextureAlphaMod"           ) fn SetTextureAlphaMod(texture: *Texture, alpha: u8) int;
export @symbol("SDL_GetTextureAlphaMod"           ) fn GetTextureAlphaMod(texture: *Texture, alpha: *u8) int;
export @symbol("SDL_SetTextureBlendMode"          ) fn SetTextureBlendMode(texture: *Texture, blendMode: BlendMode) int;
export @symbol("SDL_GetTextureBlendMode"          ) fn GetTextureBlendMode(texture: *Texture, blendMode: *BlendMode) int;
export @symbol("SDL_SetTextureScaleMode"          ) fn SetTextureScaleMode(texture: *Texture, scaleMode: ScaleMode) int;
export @symbol("SDL_GetTextureScaleMode"          ) fn GetTextureScaleMode(texture: *Texture, scaleMode: *ScaleMode) int;
export @symbol("SDL_SetTextureUserData"           ) fn SetTextureUserData(texture: *Texture, userdata: *opaque) int;
export @symbol("SDL_GetTextureUserData"           ) fn GetTextureUserData(texture: *Texture) *opaque;
export @symbol("SDL_UpdateTexture"                ) fn UpdateTexture(texture: *Texture, rect: const*Rect, pixels: const*opaque, pitch: int) int;
export @symbol("SDL_UpdateYUVTexture"             ) fn UpdateYUVTexture(texture: *Texture, rect: const*Rect, Yplane: const*u8, Ypitch: int, Uplane: const*u8, Upitch: int, Vplane: const*u8, Vpitch: int) int;
export @symbol("SDL_UpdateNVTexture"              ) fn UpdateNVTexture(texture: *Texture, rect: const*Rect, Yplane: const*u8, Ypitch: int, UVplane: const*u8, UVpitch: int) int;
export @symbol("SDL_LockTexture"                  ) fn LockTexture(texture: *Texture, rect: const*Rect, pixels: **opaque, pitch: *int) int;
export @symbol("SDL_LockTextureToSurface"         ) fn LockTextureToSurface(texture: *Texture, rect: const*Rect, surface: **Surface) int;
export @symbol("SDL_UnlockTexture"                ) fn UnlockTexture(texture: *Texture) void;
export @symbol("SDL_RenderTargetSupported"        ) fn RenderTargetSupported(renderer: *Renderer) Bool;
export @symbol("SDL_SetRenderTarget"              ) fn SetRenderTarget(renderer: *Renderer, texture: *Texture) int;
export @symbol("SDL_GetRenderTarget"              ) fn GetRenderTarget(renderer: *Renderer) *Texture;
export @symbol("SDL_RenderSetLogicalSize"         ) fn RenderSetLogicalSize(renderer: *Renderer, w: int, h: int) int;
export @symbol("SDL_RenderGetLogicalSize"         ) fn RenderGetLogicalSize(renderer: *Renderer, w: *int, h: *int) void;
export @symbol("SDL_RenderSetIntegerScale"        ) fn RenderSetIntegerScale(renderer: *Renderer, enable: Bool) int;
export @symbol("SDL_RenderGetIntegerScale"        ) fn RenderGetIntegerScale(renderer: *Renderer) Bool;
export @symbol("SDL_RenderSetViewport"            ) fn RenderSetViewport(renderer: *Renderer, rect: const*Rect) int;
export @symbol("SDL_RenderGetViewport"            ) fn RenderGetViewport(renderer: *Renderer, rect: *Rect) void;
export @symbol("SDL_RenderSetClipRect"            ) fn RenderSetClipRect(renderer: *Renderer, rect: const*Rect) int;
export @symbol("SDL_RenderGetClipRect"            ) fn RenderGetClipRect(renderer: *Renderer, rect: *Rect) void;
export @symbol("SDL_RenderIsClipEnabled"          ) fn RenderIsClipEnabled(renderer: *Renderer) Bool;
export @symbol("SDL_RenderSetScale"               ) fn RenderSetScale(renderer: *Renderer, scaleX: f32, scaleY: f32) int;
export @symbol("SDL_RenderGetScale"               ) fn RenderGetScale(renderer: *Renderer, scaleX: *f32, scaleY: *f32) void;
export @symbol("SDL_RenderWindowToLogical"        ) fn RenderWindowToLogical(renderer: *Renderer, windowX: int, windowY: int, logicalX: *f32, logicalY: *f32) void;
export @symbol("SDL_RenderLogicalToWindow"        ) fn RenderLogicalToWindow(renderer: *Renderer, logicalX: f32, logicalY: f32, windowX: *int, windowY: *int) void;
export @symbol("SDL_SetRenderDrawColor"           ) fn SetRenderDrawColor(renderer: *Renderer, r: u8, g: u8, b: u8, a: u8) int;
export @symbol("SDL_GetRenderDrawColor"           ) fn GetRenderDrawColor(renderer: *Renderer, r: *u8, g: *u8, b: *u8, a: *u8) int;
export @symbol("SDL_SetRenderDrawBlendMode"       ) fn SetRenderDrawBlendMode(renderer: *Renderer, blendMode: BlendMode) int;
export @symbol("SDL_GetRenderDrawBlendMode"       ) fn GetRenderDrawBlendMode(renderer: *Renderer, blendMode: *BlendMode) int;
export @symbol("SDL_RenderClear"                  ) fn RenderClear(renderer: *Renderer) int;
export @symbol("SDL_RenderDrawPoint"              ) fn RenderDrawPoint(renderer: *Renderer, x: int, y: int) int;
export @symbol("SDL_RenderDrawPoints"             ) fn RenderDrawPoints(renderer: *Renderer, points: const*Point, count: int) int;
export @symbol("SDL_RenderDrawLine"               ) fn RenderDrawLine(renderer: *Renderer, x1: int, y1: int, x2: int, y2: int) int;
export @symbol("SDL_RenderDrawLines"              ) fn RenderDrawLines(renderer: *Renderer, points: const*Point, count: int) int;
export @symbol("SDL_RenderDrawRect"               ) fn RenderDrawRect(renderer: *Renderer, rect: const*Rect) int;
export @symbol("SDL_RenderDrawRects"              ) fn RenderDrawRects(renderer: *Renderer, rects: const*Rect, count: int) int;
export @symbol("SDL_RenderFillRect"               ) fn RenderFillRect(renderer: *Renderer, rect: const*Rect) int;
export @symbol("SDL_RenderFillRects"              ) fn RenderFillRects(renderer: *Renderer, rects: const*Rect, count: int) int;
export @symbol("SDL_RenderCopy"                   ) fn RenderCopy(renderer: *Renderer, texture: *Texture, srcrect: const*Rect, dstrect: const*Rect) int;
export @symbol("SDL_RenderCopyEx"                 ) fn RenderCopyEx(renderer: *Renderer, texture: *Texture, srcrect: const*Rect, dstrect: const*Rect, angle: const f64, center: const*Point, flip: const RendererFlip) int;
export @symbol("SDL_RenderDrawPointF"             ) fn RenderDrawPointF(renderer: *Renderer, x: f32, y: f32) int;
export @symbol("SDL_RenderDrawPointsF"            ) fn RenderDrawPointsF(renderer: *Renderer, points: const*FPoint, count: int) int;
export @symbol("SDL_RenderDrawLineF"              ) fn RenderDrawLineF(renderer: *Renderer, x1: f32, y1: f32, x2: f32, y2: f32) int;
export @symbol("SDL_RenderDrawLinesF"             ) fn RenderDrawLinesF(renderer: *Renderer, points: const*FPoint, count: int) int;
export @symbol("SDL_RenderDrawRectF"              ) fn RenderDrawRectF(renderer: *Renderer, rect: const*FRect) int;
export @symbol("SDL_RenderDrawRectsF"             ) fn RenderDrawRectsF(renderer: *Renderer, rects: const*FRect, count: int) int;
export @symbol("SDL_RenderFillRectF"              ) fn RenderFillRectF(renderer: *Renderer, rect: const*FRect) int;
export @symbol("SDL_RenderFillRectsF"             ) fn RenderFillRectsF(renderer: *Renderer, rects: const*FRect, count: int) int;
export @symbol("SDL_RenderCopyF"                  ) fn RenderCopyF(renderer: *Renderer, texture: *Texture, srcrect: const*Rect, dstrect: const*FRect) int;
export @symbol("SDL_RenderCopyExF"                ) fn RenderCopyExF(renderer: *Renderer, texture: *Texture, srcrect: const*Rect, dstrect: const*FRect, angle: const f64, center: const*FPoint, flip: const RendererFlip) int;
export @symbol("SDL_RenderGeometry"               ) fn RenderGeometry(renderer: *Renderer, texture: *Texture, vertices: const*Vertex, num_vertices: int, indices: const*int, num_indices: int) int;
export @symbol("SDL_RenderGeometryRaw"            ) fn RenderGeometryRaw(renderer: *Renderer, texture: *Texture, xy: const*f32, xy_stride: int, color: const*Color, color_stride: int, uv: const*f32, uv_stride: int, num_vertices: int, indices: const*opaque, num_indices: int, size_indices: int) int;
export @symbol("SDL_RenderReadPixels"             ) fn RenderReadPixels(renderer: *Renderer, rect: const*Rect, format: u32, pixels: *opaque, pitch: int) int;
export @symbol("SDL_RenderPresent"                ) fn RenderPresent(renderer: *Renderer) void;
export @symbol("SDL_DestroyTexture"               ) fn DestroyTexture(texture: *Texture) void;
export @symbol("SDL_DestroyRenderer"              ) fn DestroyRenderer(renderer: *Renderer) void;
export @symbol("SDL_RenderFlush"                  ) fn RenderFlush(renderer: *Renderer) int;
export @symbol("SDL_GL_BindTexture"               ) fn GL_BindTexture(texture: *Texture, texw: *f32, texh: *f32) int;
export @symbol("SDL_GL_UnbindTexture"             ) fn GL_UnbindTexture(texture: *Texture) int;
export @symbol("SDL_RenderGetMetalLayer"          ) fn RenderGetMetalLayer(renderer: *Renderer) *opaque;
export @symbol("SDL_RenderGetMetalCommandEncoder" ) fn RenderGetMetalCommandEncoder(renderer: *Renderer) *opaque;
export @symbol("SDL_RenderSetVSync"               ) fn RenderSetVSync(renderer: *Renderer, vsync: int) int;
