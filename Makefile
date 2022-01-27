# programs
# 	Compiler
CC=sdcc

# flags
CCFLAGS=-mpic16\
		 -p18f4550\
		 --use-non-free \
		 --debug \
		 --std-sdcc2x \
		#  --obanksel=1 \
		#  --optimize-df \
		#  --optimize-cmp


# paths
# 	root path of compiler
SDCC_HOME=/usr/local/share/sdcc
INCLUDE_DIR=${SDCC_HOME}/include/pic16/
LIBS= libsdcc.lib \
		libc18f.lib \
		libdev18f4550.lib
STDLIBPATH=${SDCC_HOME}/lib/pic16/
DEVLIBPATH=${SDCC_HOME}/non-free/lib/pic16/

# project
PROJECT= myproject

# files
SOURCES= main.c

OBJS=$(SOURCES:.c=.o)
OUTPUT_FILES=*.cod *.lst *.hex *.asm *.o *.adb

# move all auxiliary files to build folder
move: ${PROJECT}.hex
	mkdir -p build/hex
	mv -f ${OUTPUT_FILES} build/
	mv -f build/$< build/hex/

# Link project and build binary output
${PROJECT}.hex: ${OBJS}
	${CC} $^ -o $@  ${LIBS} -L ${STDLIBPATH} -L ${DEVLIBPATH} ${CCFLAGS}

# Compile .c files
%.o: %.c
	${CC}  -c $< -o $@ ${CCFLAGS} -I${INCLUDE_DIR}

# remove build folder and any leftover auxiliary files (in case of build fail)
clean:
	rm -rf build/ ${OUTPUT_FILES}

