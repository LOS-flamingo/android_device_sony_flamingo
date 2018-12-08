ifeq ($(filter-out flamingo,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

root_init      := $(TARGET_ROOT_OUT)/init
root_init_real := $(TARGET_ROOT_OUT)/init.real
 	# If /init is a file and not a symlink then rename it to /init.real
	# and make /init be a symlink to /sbin/init_sony (which will execute
	# /init.real, if appropriate.
$(root_init_real): $(root_init) $(PRODUCT_OUT)/utilities/init_sony $(TARGET_RECOVERY_ROOT_OUT)/sbin/toybox_static $(PRODUCT_OUT)/utilities/keycheck
	cp $(TARGET_RECOVERY_ROOT_OUT)/sbin/toybox_static $(TARGET_ROOT_OUT)/sbin/toybox_init
	cp $(PRODUCT_OUT)/utilities/init_sony $(TARGET_ROOT_OUT)/sbin/init_sony
	cp $(PRODUCT_OUT)/utilities/keycheck $(TARGET_ROOT_OUT)/sbin/keycheck
	$(hide) if [ ! -L $(root_init) ]; then \
	  echo "/init $(root_init) isn't a symlink"; \
	  mv $(root_init) $(root_init_real); \
	  ln -s sbin/init_sony $(root_init); \
	else \
	  echo "/init $(root_init) is already a symlink"; \
	fi
 ALL_DEFAULT_INSTALLED_MODULES += $(root_init_real)

endif
