include core/arch/$(ARCH)/plat-$(PLATFORM)/platform_flags.mk

core-platform-cppflags = -I$(arch-dir)/include
core-platform-subdirs += \
	$(addprefix $(arch-dir)/, kernel mm tee sta) $(platform-dir)
core-platform-subdirs += $(arch-dir)/sm

$(call force,CFG_ARM32_core,y)
$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
$(call force,CFG_SUNXI_UART,y)
$(call force,CFG_MMU_V7_TTB,y)
$(call force,CFG_PM_STUBS,y)
$(call force,CFG_GIC,y)

CFG_NUM_THREADS ?= 4
CFG_TEE_CORE_EMBED_INTERNAL_TESTS ?= y
CFG_WITH_STACK_CANARIES ?= y
CFG_WITH_STATS ?= y

include mk/config.mk
