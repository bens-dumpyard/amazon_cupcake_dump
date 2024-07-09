#!/system/bin/sh

HALO_PATH=/vendor/bin
VETC_PATH=/vendor/etc/halo_config
DETC_PATH=/mnt/halo/etc

[ -f ${HALO_PATH}/halo_common_lib.sh ] && . ${HALO_PATH}/halo_common_lib.sh

LOG_TAG="sidewalk-services"

halo_log_info $LOG_TAG  "*** >>> Sidewalk Services Start <<< ***"

cp -aRfP $VETC_PATH/* $DETC_PATH/.

echo $(getprop ro.product.config.type) > $MFG/gateway_device_type;

sync /mnt/halo

if [ "$(ls $DETC_PATH/hub-core.conf.d/*.conf)" != "" ]; then
    setprop vendor.halo.hubcore.config true
fi
halo_log_info $LOG_TAG  "*** >>> Sidewalk Services Exit <<< ***"
