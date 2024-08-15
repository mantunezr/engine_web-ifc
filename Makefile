<<<<<<< HEAD
###################################################################################
### MACROS
###################################################################################

#$(1) : compiler
#$(2) : object file
#$(3) : source file
#$(4) : others dependencies
#$(5) : compiler flags
#$(eval $(call COMPILE,g++,file.o,file.cpp,file.hpp,-Wall -pedantic))
define COMPILE
$(2) : $(3) $(4)
	$(MKDIR) $(dir $(2))
	$(1) -c -o $(2) $(3) $(5)
endef

#$(1) source file
define C2O
$(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(patsubst $(SRC)%,$(OBJ)%,$(1))))
endef

#$(1) source file
define C2H
$(patsubst %.c,%.h,$(patsubst %.cpp,%.hpp,$(1)))
endef

#$(1): dir to remove
define RM_DIR
@if [ -d $(1) ]; then \
  $(RMDIR) $(1); \
fi
endef
###################################################################################
### CONFIG
###################################################################################

NAME				:= thatopen
APP 				:= lib${NAME}.a
OUT					:= out
SRC					:= ./src/cpp
OBJ					:= ../obj/${NAME}
CC					:= g++
AR					:= ar
ARFLAGS			:= -crs
RANLIB			:= ranlib
STD					:= c++20
FLAGS				:= -Wall -Wextra -Wpedantic -pedantic -std=$(STD) -mcmodel=large -DSPDLOG_COMPILED_LIB
INCLUDES 		:= ./src/cpp ../../../../cpp-third-party-libraries/include ../../../../cpp-third-party-libraries/include/CDT

ifndef PR
	INCLUDES += ../src
endif

ifdef RELEASE
	FLAGS += -O3
else
	FLAGS += -g -DDEBUG
endif

SUBDIRS			:= $(shell find $(SRC)/ -type d)
OBJ_DIRS		:= $(patsubst $(SRC)%,$(OBJ)%,$(SUBDIRS))
NOTFILES		:= web-ifc-wasm.cpp main.cpp *test*
EXCLUDES		:= $(foreach F, $(NOTFILES),$(patsubst %, -not -name %,'$(F)'))
CPPS				:= $(shell find $(SRC)/ -type f -iname *.cpp $(EXCLUDES))
OBJS				:= $(foreach F, $(CPPS),$(call C2O,$(F)))

MKDIR				:= mkdir -p
RMDIR				:= rm -R
RM					:= rm

###################################################################################
### TARGET
###################################################################################

.PHONY : info clean

# LINKER
$(APP) : $(OBJ_DIRS) $(OBJS) $(OUT)
	$(info  )
	$(info ===================================================================)
	$(info === LIBRARY $(APP) CREATION)
	$(info ===================================================================)
	$(info  )
	$(AR) $(ARFLAGS) $(OUT)/$@ $(OBJS)
	$(RANLIB) $(OUT)/$@

# COMPILER
$(foreach F,$(CPPS),$(eval $(call COMPILE,$(CC),$(call C2O,$(F)),$(F),,$(FLAGS) $(patsubst %,-I%,$(INCLUDES)))))

$(OUT) :
	$(MKDIR) $(OUT)

$(OBJ_DIRS) :
	$(MKDIR) $(OBJ_DIRS)

# UTILS
	
clean : 
	$(call RM_DIR,$(OBJ))
	$(call RM_DIR,$(OUT))

# DEBUG
info :
	$(info SUBDIRS ===============)
	$(info $(SUBDIRS))
	$(info =======================)
	$(info  )
	$(info OBJ_DIRS===============)
	$(info $(OBJ_DIRS))
	$(info =======================)
	$(info  )
	$(info CPPS===================)
	$(info $(CPPS))
	$(info =======================)
	$(info  )
	$(info OBJS===================)
	$(info $(OBJS))
	$(info =======================)
	$(info  )
	$(info EXCLUDES FILES===================)
	$(info $(EXCLUDES))
	$(info =======================)
=======
###################################################################################
### MACROS
###################################################################################

#$(1) : compiler
#$(2) : object file
#$(3) : source file
#$(4) : others dependencies
#$(5) : compiler flags
#$(eval $(call COMPILE,g++,file.o,file.cpp,file.hpp,-Wall -pedantic))
define COMPILE
$(2) : $(3) $(4)
	$(MKDIR) $(dir $(2))
	$(1) -c -o $(2) $(3) $(5)
endef

#$(1) source file
define C2O
$(patsubst %.c,%.o,$(patsubst %.cpp,%.o,$(patsubst $(SRC)%,$(OBJ)%,$(1))))
endef

#$(1) source file
define C2H
$(patsubst %.c,%.h,$(patsubst %.cpp,%.hpp,$(1)))
endef

#$(1): dir to remove
define RM_DIR
@if [ -d $(1) ]; then \
  $(RMDIR) $(1); \
fi
endef
###################################################################################
### CONFIG
###################################################################################

NAME				:= thatopen
APP 				:= lib${NAME}.a
OUT					:= ../out
SRC					:= ./src/cpp
OBJ					:= obj
CC					:= g++
AR					:= ar
ARFLAGS			:= -crs
RANLIB			:= ranlib
STD					:= c++20
FLAGS				:= -Wall -Wextra -Wpedantic -pedantic -std=$(STD) -mcmodel=large -DSPDLOG_COMPILED_LIB
INCLUDES 		:= ./src/cpp ../../../../cpp-third-party-libraries/include ../../../../cpp-third-party-libraries/include/CDT

ifndef PR
	INCLUDES += ../src
endif

ifdef RELEASE
	FLAGS += -O3
else
	FLAGS += -g -DDEBUG
endif

SUBDIRS			:= $(shell find $(SRC)/ -type d)
OBJ_DIRS		:= $(patsubst $(SRC)%,$(OBJ)%,$(SUBDIRS))
NOTFILES		:= web-ifc-wasm.cpp main.cpp *test*
EXCLUDES		:= $(foreach F, $(NOTFILES),$(patsubst %, -not -name %,'$(F)'))
CPPS				:= $(shell find $(SRC)/ -type f -iname *.cpp $(EXCLUDES))
OBJS				:= $(foreach F, $(CPPS),$(call C2O,$(F)))

MKDIR				:= mkdir -p
RMDIR				:= rm -R
RM					:= rm

###################################################################################
### TARGET
###################################################################################

.PHONY : info clean

# LINKER
$(APP) : $(OBJ_DIRS) $(OBJS) $(OUT)
	$(info  )
	$(info ===================================================================)
	$(info === LIBRARY $(APP) CREATION)
	$(info ===================================================================)
	$(info  )
	$(AR) $(ARFLAGS) $(OUT)/$@ $(OBJS)
	$(RANLIB) $(OUT)/$@

# COMPILER
$(foreach F,$(CPPS),$(eval $(call COMPILE,$(CC),$(call C2O,$(F)),$(F),,$(FLAGS) $(patsubst %,-I%,$(INCLUDES)))))

$(OUT) :
	$(MKDIR) $(OUT)

$(OBJ_DIRS) :
	$(MKDIR) $(OBJ_DIRS)

# UTILS
	
clean : 
	$(call RM_DIR,$(OBJ))
	$(call RM_DIR,$(OUT))

# DEBUG
info :
	$(info SUBDIRS ===============)
	$(info $(SUBDIRS))
	$(info =======================)
	$(info  )
	$(info OBJ_DIRS===============)
	$(info $(OBJ_DIRS))
	$(info =======================)
	$(info  )
	$(info CPPS===================)
	$(info $(CPPS))
	$(info =======================)
	$(info  )
	$(info OBJS===================)
	$(info $(OBJS))
	$(info =======================)
	$(info  )
	$(info EXCLUDES FILES===================)
	$(info $(EXCLUDES))
	$(info =======================)
>>>>>>> 06c5e84a (add boolean engine)
	$(info  )