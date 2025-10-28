CMAKE := $(shell command -v cmake)
BUILD_TYPE ?= Debug

libretro:
	${CMAKE} -Bbuild -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
	${CMAKE} --build build

standalone:
	${CMAKE} -Bbuild -DCMAKE_BUILD_TYPE=${BUILD_TYPE} -Dlibretro_core=OFF -DNO_SYSTEM_DEPENDENCIES=OFF -DBUILD_SHARED_LIBS=ON
	${CMAKE} --build build

.PHONY: libretro

clean:
	rm -rf build