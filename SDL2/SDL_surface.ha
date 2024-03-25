
export type SDL_BlitMap = opaque;

export type SDL_Surface = struct {
	flags:        u32,
	format:       *SDL_PixelFormat,
	w:            int,
	h:            int,
	pitch:        int,
	pixels:       *opaque,
	userdata:     *opaque,
	locked:       int,
	list_blitmap: *opaque,
	clip_rect:    SDL_Rect,
	map:          *SDL_BlitMap,
	refcount:     int,
};

export type SDL_blit = *fn(src: *SDL_Surface, srcrect: *SDL_Rect, dst: *SDL_Surface, dstrect: *SDL_Rect) int;

export type SDL_YUV_CONVERSION_MODE = enum {
	SDL_YUV_CONVERSION_JPEG,
	SDL_YUV_CONVERSION_BT601,
	SDL_YUV_CONVERSION_BT709,
	SDL_YUV_CONVERSION_AUTOMATIC,
};

export @symbol("SDL_CreateRGBSurface"                  ) fn CreateRGBSurface(flags: u32, width: int, height: int, depth: int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) *SDL_Surface;
export @symbol("SDL_CreateRGBSurfaceWithFormat"        ) fn CreateRGBSurfaceWithFormat(flags: u32, width: int, height: int, depth: int, format: u32) *SDL_Surface;
export @symbol("SDL_CreateRGBSurfaceFrom"              ) fn CreateRGBSurfaceFrom(pixels: *opaque, width: int, height: int, depth: int, pitch: int, Rmask: u32, Gmask: u32, Bmask: u32, Amask: u32) *SDL_Surface;
export @symbol("SDL_CreateRGBSurfaceWithFormatFrom"    ) fn CreateRGBSurfaceWithFormatFrom(pixels: *opaque, width: int, height: int, depth: int, pitch: int, format: u32) *SDL_Surface;
export @symbol("SDL_FreeSurface"                       ) fn FreeSurface(surface: *SDL_Surface) void;
export @symbol("SDL_SetSurfacePalette"                 ) fn SetSurfacePalette(surface: *SDL_Surface, palette: *SDL_Palette) int;
export @symbol("SDL_LockSurface"                       ) fn LockSurface(surface: *SDL_Surface) int;
export @symbol("SDL_UnlockSurface"                     ) fn UnlockSurface(surface: *SDL_Surface) void;
export @symbol("SDL_LoadBMP_RW"                        ) fn LoadBMP_RW(src: *SDL_RWops, freesrc: int) *SDL_Surface;
export @symbol("SDL_SaveBMP_RW"                        ) fn SaveBMP_RW(surface: *SDL_Surface, dst: *SDL_RWops, freedst: int) int;
export @symbol("SDL_SetSurfaceRLE"                     ) fn SetSurfaceRLE(surface: *SDL_Surface, flag: int) int;
export @symbol("SDL_HasSurfaceRLE"                     ) fn HasSurfaceRLE(surface: *SDL_Surface) SDL_bool;
export @symbol("SDL_SetColorKey"                       ) fn SetColorKey(surface: *SDL_Surface, flag: int, key: u32) int;
export @symbol("SDL_HasColorKey"                       ) fn HasColorKey(surface: *SDL_Surface) SDL_bool;
export @symbol("SDL_GetColorKey"                       ) fn GetColorKey(surface: *SDL_Surface, key: *u32) int;
export @symbol("SDL_SetSurfaceColorMod"                ) fn SetSurfaceColorMod(surface: *SDL_Surface, r: u8, g: u8, b: u8) int;
export @symbol("SDL_GetSurfaceColorMod"                ) fn GetSurfaceColorMod(surface: *SDL_Surface, r: *u8, g: *u8, b: *u8) int;
export @symbol("SDL_SetSurfaceAlphaMod"                ) fn SetSurfaceAlphaMod(surface: *SDL_Surface, alpha: u8) int;
export @symbol("SDL_GetSurfaceAlphaMod"                ) fn GetSurfaceAlphaMod(surface: *SDL_Surface, alpha: *u8) int;
export @symbol("SDL_SetSurfaceBlendMode"               ) fn SetSurfaceBlendMode(surface: *SDL_Surface, blendMode: SDL_BlendMode) int;
export @symbol("SDL_GetSurfaceBlendMode"               ) fn GetSurfaceBlendMode(surface: *SDL_Surface, blendMode: *SDL_BlendMode) int;
export @symbol("SDL_SetClipRect"                       ) fn SetClipRect(surface: *SDL_Surface, rect: const*SDL_Rect) SDL_bool;
export @symbol("SDL_GetClipRect"                       ) fn GetClipRect(surface: *SDL_Surface, rect: *SDL_Rect) void;
export @symbol("SDL_DuplicateSurface"                  ) fn DuplicateSurface(surface: *SDL_Surface) *SDL_Surface;
export @symbol("SDL_ConvertSurface"                    ) fn ConvertSurface(src: *SDL_Surface, fmt: const*SDL_PixelFormat, flags: u32) *SDL_Surface;
export @symbol("SDL_ConvertSurfaceFormat"              ) fn ConvertSurfaceFormat(src: *SDL_Surface, pixel_format: u32, flags: u32) *SDL_Surface;
export @symbol("SDL_ConvertPixels"                     ) fn ConvertPixels(width: int, height: int, src_format: u32, src: const*opaque, src_pitch: int, dst_format: u32, dst: *opaque, dst_pitch: int) int;
export @symbol("SDL_PremultiplyAlpha"                  ) fn PremultiplyAlpha(width: int, height: int, src_format: u32, src: const*opaque, src_pitch: int, dst_format: u32, dst: *opaque, dst_pitch: int) int;
export @symbol("SDL_FillRect"                          ) fn FillRect(dst: *SDL_Surface, rect: const*SDL_Rect, color: u32) int;
export @symbol("SDL_FillRects"                         ) fn FillRects(dst: *SDL_Surface, rects: const*SDL_Rect, count: int, color: u32) int;
export @symbol("SDL_UpperBlit"                         ) fn UpperBlit(src: *SDL_Surface, srcrect: const*SDL_Rect, dst: *SDL_Surface, dstrect: *SDL_Rect) int;
export @symbol("SDL_LowerBlit"                         ) fn LowerBlit(src: *SDL_Surface, srcrect: *SDL_Rect, dst: *SDL_Surface, dstrect: *SDL_Rect) int;
export @symbol("SDL_SoftStretch"                       ) fn SoftStretch(src: *SDL_Surface, srcrect: const*SDL_Rect, dst: *SDL_Surface, dstrect: const*SDL_Rect) int;
export @symbol("SDL_SoftStretchLinear"                 ) fn SoftStretchLinear(src: *SDL_Surface, srcrect: const*SDL_Rect, dst: *SDL_Surface, dstrect: const*SDL_Rect) int;
export @symbol("SDL_UpperBlitScaled"                   ) fn UpperBlitScaled(src: *SDL_Surface, srcrect: const*SDL_Rect, dst: *SDL_Surface, dstrect: *SDL_Rect) int;
export @symbol("SDL_LowerBlitScaled"                   ) fn LowerBlitScaled(src: *SDL_Surface, srcrect: *SDL_Rect, dst: *SDL_Surface, dstrect: *SDL_Rect) int;
export @symbol("SDL_SetYUVConversionMode"              ) fn SetYUVConversionMode(mode: SDL_YUV_CONVERSION_MODE) void;
export @symbol("SDL_GetYUVConversionMode"              ) fn GetYUVConversionMode() SDL_YUV_CONVERSION_MODE;
export @symbol("SDL_GetYUVConversionModeForResolution" ) fn GetYUVConversionModeForResolution(width: int, height: int) SDL_YUV_CONVERSION_MODE;
