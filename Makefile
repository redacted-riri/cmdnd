EXE = ./bin/cmdnd
SRC_DIR = ./src
BUILD_DIR = ./bin

SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(addprefix $(BUILD_DIR)/, $(notdir $(SOURCES:.c=.o)))

CC = gcc
CCFLAGS = -O3 -pipe -I$(SRC_DIR)
LIBS = -lm

## Build rules
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c:
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CCFLAGS) -c -o $@ $<

all: $(EXE) 

$(EXE): $(OBJS)
	$(CC) -o $@ $^ $(CCFLAGS) $(LIBS)

clean: 
	rm -rf $(BUILD_DIR)

install:
	cp $(EXE) /usr/bin/