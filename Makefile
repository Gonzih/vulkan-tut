CXX = clang++

CXXFLAGS = -Wall -Werror -g
CXXFLAGS = -DDEBUG
LDFLAGS += -std=c++2a
LDFLAGS += $(shell pkg-config --libs glew glfw3 glm vulkan)

# SHELLFLAGS = -I nixpkgs=/home/gnzh/mydev/nixpkgs

BIN_NAME = core

default: run

clean:
	rm -f ./$(BIN_NAME)

build: clean
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BIN_NAME) src/*.cpp
	chmod +x ./$(BIN_NAME)

build-nix:
	nix-shell $(SHELLFLAGS) shell.nix --run 'make build'

run: build
	./$(BIN_NAME)

run-nix: build-nix
	./$(BIN_NAME)

shell:
	nix-shell $(SHELLFLAGS) shell.nix
