
#-------------------------------------------------------------------
# What to build?
#-------------------------------------------------------------------
BUILDDIRS := $(BUILDDIRS) tools/cii

BUILDDIRS := $(BUILDDIRS) app/test

#-------------------------------------------------------------------
# multithreading
#-------------------------------------------------------------------
ifeq ($(NOMULTI),)
ifeq ($(NUMJOBS),)
ifdef NUMBER_OF_PROCESSORS
NUMJOBS := -j$(NUMBER_OF_PROCESSORS)
else
NUMJOBS := -j2
endif
endif
endif

.PHONY: all $(BUILDDIRS)
all: $(BUILDDIRS)

$(BUILDDIRS) :
	$(MAKE) $(NUMJOBS) -C $@ $(BUILDTYPE)
