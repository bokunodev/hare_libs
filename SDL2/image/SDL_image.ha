use types::c;
use SDL2;

export type IMG_InitFlags = enum {
	IMG_INIT_JPG  = 0x00000001,
	IMG_INIT_PNG  = 0x00000002,
	IMG_INIT_TIF  = 0x00000004,
	IMG_INIT_WEBP = 0x00000008,
	IMG_INIT_JXL  = 0x00000010,
	IMG_INIT_AVIF = 0x00000020,
};

export type IMG_Animation = struct {
	w:      int,
	h:      int,
	count:  int,
	frames: const**SDL::SDL_Surface,
	delays: *int,
};

export @symbol("IMG_Linked_Version"           ) fn Linked_Version() const*SDL::SDL_version;
export @symbol("IMG_Init"                     ) fn Init(flags: int) int;
export @symbol("IMG_Quit"                     ) fn Quit() void;
export @symbol("IMG_LoadTyped_RW"             ) fn LoadTyped_RW(src: *SDL::SDL_RWops, freesrc: int, _type: const*c::char) *SDL::SDL_Surface;
export @symbol("IMG_Load"                     ) fn Load(file: const*c::char) *SDL::SDL_Surface;
export @symbol("IMG_Load_RW"                  ) fn Load_RW(src: *SDL::SDL_RWops, freesrc: int) *SDL::SDL_Surface;
export @symbol("IMG_LoadTexture"              ) fn LoadTexture(renderer: *SDL::SDL_Renderer, file: const*c::char) *SDL::SDL_Texture;
export @symbol("IMG_LoadTexture_RW"           ) fn LoadTexture_RW(renderer: *SDL::SDL_Renderer, src: *SDL::SDL_RWops, freesrc: int) *SDL::SDL_Texture;
export @symbol("IMG_LoadTextureTyped_RW"      ) fn LoadTextureTyped_RW(renderer: *SDL::SDL_Renderer, src: *SDL::SDL_RWops, freesrc: int, _type: const*c::char) *SDL::SDL_Texture;
export @symbol("IMG_isAVIF"                   ) fn isAVIF(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isICO"                    ) fn isICO(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isCUR"                    ) fn isCUR(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isBMP"                    ) fn isBMP(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isGIF"                    ) fn isGIF(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isJPG"                    ) fn isJPG(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isJXL"                    ) fn isJXL(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isLBM"                    ) fn isLBM(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isPCX"                    ) fn isPCX(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isPNG"                    ) fn isPNG(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isPNM"                    ) fn isPNM(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isSVG"                    ) fn isSVG(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isQOI"                    ) fn isQOI(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isTIF"                    ) fn isTIF(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isXCF"                    ) fn isXCF(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isXPM"                    ) fn isXPM(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isXV"                     ) fn isXV(src: *SDL::SDL_RWops) int;
export @symbol("IMG_isWEBP"                   ) fn isWEBP(src: *SDL::SDL_RWops) int;
export @symbol("IMG_LoadAVIF_RW"              ) fn LoadAVIF_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadICO_RW"               ) fn LoadICO_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadCUR_RW"               ) fn LoadCUR_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadBMP_RW"               ) fn LoadBMP_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadGIF_RW"               ) fn LoadGIF_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadJPG_RW"               ) fn LoadJPG_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadJXL_RW"               ) fn LoadJXL_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadLBM_RW"               ) fn LoadLBM_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadPCX_RW"               ) fn LoadPCX_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadPNG_RW"               ) fn LoadPNG_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadPNM_RW"               ) fn LoadPNM_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadSVG_RW"               ) fn LoadSVG_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadQOI_RW"               ) fn LoadQOI_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadTGA_RW"               ) fn LoadTGA_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadTIF_RW"               ) fn LoadTIF_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadXCF_RW"               ) fn LoadXCF_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadXPM_RW"               ) fn LoadXPM_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadXV_RW"                ) fn LoadXV_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadWEBP_RW"              ) fn LoadWEBP_RW(src: *SDL::SDL_RWops) *SDL::SDL_Surface;
export @symbol("IMG_LoadSizedSVG_RW"          ) fn LoadSizedSVG_RW(src: *SDL::SDL_RWops, width: int, height: int) *SDL::SDL_Surface;
export @symbol("IMG_ReadXPMFromArray"         ) fn ReadXPMFromArray(xpm: const**c::char) *SDL::SDL_Surface;
export @symbol("IMG_ReadXPMFromArrayToRGB888" ) fn ReadXPMFromArrayToRGB888(xpm: const**c::char) *SDL::SDL_Surface;
export @symbol("IMG_SavePNG"                  ) fn SavePNG(surface: *SDL::SDL_Surface, file: const*c::char) int;
export @symbol("IMG_SavePNG_RW"               ) fn SavePNG_RW(surface: *SDL::SDL_Surface, dst: *SDL::SDL_RWops, freedst: int) int;
export @symbol("IMG_SaveJPG"                  ) fn SaveJPG(surface: *SDL::SDL_Surface, file: const*c::char, quality: int) int;
export @symbol("IMG_SaveJPG_RW"               ) fn SaveJPG_RW(surface: *SDL::SDL_Surface, dst: *SDL::SDL_RWops, freedst: int, quality: int) int;
export @symbol("IMG_LoadAnimation"            ) fn LoadAnimation(file: const*c::char) *IMG_Animation;
export @symbol("IMG_LoadAnimation_RW"         ) fn LoadAnimation_RW(src: *SDL::SDL_RWops, freesrc: int) *IMG_Animation;
export @symbol("IMG_LoadAnimationTyped_RW"    ) fn LoadAnimationTyped_RW(src: *SDL::SDL_RWops, freesrc: int, _type: const*c::char) *IMG_Animation;
export @symbol("IMG_FreeAnimation"            ) fn FreeAnimation(anim: *IMG_Animation) void;
export @symbol("IMG_LoadGIFAnimation_RW"      ) fn LoadGIFAnimation_RW(src: *SDL::SDL_RWops) *IMG_Animation;
export @symbol("IMG_LoadWEBPAnimation_RW"     ) fn LoadWEBPAnimation_RW(src: *SDL::SDL_RWops) *IMG_Animation;
