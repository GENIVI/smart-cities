TEMPLATE = subdirs

!desktop {
    SUBDIRS += applicationmodel \
               hmi-controller
}

SUBDIRS += com/genivi/rvitrafficservice \
           qtposition_gpsd \
           com/genivi/v2x
