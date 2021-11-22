# programs
CC=sdcc
LL=gplink

# flags
CCFLAGS=-mpic16 -p18f4550 --debug --std-sdcc2x --use-non-free
LLFLAGS=-r -w -m

# paths
SDCC_HOME=/usr/local/share/sdcc
SDCCLIB=${SDCC_HOME}/lib/pic16/libsdcc.lib
PICLIB=${SDCC_HOME}/non-free/lib/pic16/libdev18f4550.lib
INCLUDE_DIR=${SDCC_HOME}/include/pic16/

# project
PROJECT=myproject

# files
SOURCES=main.c
OBJS=$(SOURCES:.c=.o)
OUTPUT_FILES=*.cod *.lst *.hex *.asm *.o *.adb *.map

move: ${PROJECT}.hex
	mkdir -p build/hex
	mv ${OUTPUT_FILES} build/
	mv build/$< build/hex/

${PROJECT}.hex: ${OBJS}
	${LL} ${LLFLAGS} $^ -o $@ ${SDCCLIB} ${PICLIB}

%.o: %.c
	${CC} ${CCFLAGS} -c $< -o $@

clean:
	rm -rf build/

