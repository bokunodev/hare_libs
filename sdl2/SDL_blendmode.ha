export type BlendMode = enum {
	BLENDMODE_NONE    = 0x00000000,
	BLENDMODE_BLEND   = 0x00000001,
	BLENDMODE_ADD     = 0x00000002,
	BLENDMODE_MOD     = 0x00000004,
	BLENDMODE_MUL     = 0x00000008,
	BLENDMODE_INVALID = 0x7FFFFFFF,
};

export type BlendOperation = enum {
	BLENDOPERATION_ADD          = 0x1,
	BLENDOPERATION_SUBTRACT     = 0x2,
	BLENDOPERATION_REV_SUBTRACT = 0x3,
	BLENDOPERATION_MINIMUM      = 0x4,
	BLENDOPERATION_MAXIMUM      = 0x5,
};

export type BlendFactor = enum {
	BLENDFACTOR_ZERO                = 0x1,
	BLENDFACTOR_ONE                 = 0x2,
	BLENDFACTOR_SRC_COLOR           = 0x3,
	BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,
	BLENDFACTOR_SRC_ALPHA           = 0x5,
	BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,
	BLENDFACTOR_DST_COLOR           = 0x7,
	BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,
	BLENDFACTOR_DST_ALPHA           = 0x9,
	BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA,
};

export @symbol("SDL_ComposeCustomBlendMode") fn ComposeCustomBlendMode(srcColorFactor: BlendFactor, dstColorFactor: BlendFactor, colorOperation: BlendOperation, srcAlphaFactor: BlendFactor, dstAlphaFactor: BlendFactor, alphaOperation: BlendOperation) BlendMode;
