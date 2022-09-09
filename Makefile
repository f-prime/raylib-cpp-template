CPP := clang++
EMCC := ./emsdk/upstream/emscripten/em++

MAC_FOLDER := macos
WEB_FOLDER := web

OUT := game

CPP_VERSION := -std=c++11

HEADERS := -I. 	\
	   -I include \
	   -I src \
	   -I include

PLATFORM_WEB := -D PLATFORM_WEB
PLATFORM_DESKTOP := -D PLATFORM_DESKTOP

MAC_LIBS := -L ./lib/mac-x86_64 -l raylib -rpath ./lib/mac-x86_64
MAC_OUT_FILE := $(MAC_FOLDER)/$(OUT) 

WEB_LIBS := ./lib/web/libraylib.a  
WEB_OUT_FILE := $(WEB_FOLDER)/$(OUT).html
WEB_FLAGS := --preload-file assets \
	     -DGRAPHICS_API_OPENGL_ES2 \
	     -DPLATFORM_WEB \
	     -s ENVIRONMENT=web \
	     -s USE_GLFW=3 \
	     -s ASYNCIFY \
	     -s TOTAL_MEMORY=67108864 \
	     -s FORCE_FILESYSTEM=1 \
	     -s ASSERTIONS=1 

OPTIMIZATIONS := -Os

SOURCE_FILES := src/main.cpp

build-macos:
	mkdir -p $(MAC_FOLDER) && $(CPP) $(CPP_VERSION) $(MAC_LIBS) $(HEADERS) $(MAC_FLAGS) $(OPTIMIZATIONS) -o $(MAC_OUT_FILE) $(PLATFORM_DESKTOP) $(SOURCE_FILES)

build-wasm32:
	mkdir -p $(WEB_FOLDER) && $(EMCC) -o $(WEB_OUT_FILE) $(SOURCE_FILES) $(OPTIMIZATIONS) $(WEB_LIBS) $(HEADERS) $(PLATFORM_WEB) $(WEB_FLAGS)
