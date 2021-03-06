CC = g++
CFLAGS = -g -Wall -Wextra -pedantic 
IPATH = -I/usr/X11/include -I/usr/pkg/include -I./include
LPATH = -L/usr/X11/lib -L/usr/pkg/lib
LDPATH = -Wl,-R/usr/pkg/lib

BUILD = ./build/
SRC = ./src/

all: $(BUILD)ProceduralClouds

$(BUILD)ProceduralClouds: $(BUILD)main.o $(BUILD)G308_Geometry.o $(BUILD)Simulation.o
	$(CC) -o $@ $^ -lm -lGL -lglut -lGLU $(LPATH) $(LDPATH)
	
$(BUILD)%.o: $(SRC)%.cpp
	$(CC) $(CFLAGS) -c -o $@ $^ $(IPATH)

clean:
	$(RM) -f $(BUILD)*.o $(BUILD)*.gch $(BUILD)ProceduralClouds


