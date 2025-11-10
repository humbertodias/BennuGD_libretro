#!/bin/bash
set -euo pipefail

# Build BennuGD libretro core for Nintendo Switch (libnx)
# Ref: https://docs.libretro.com/development/retroarch/compilation/switch-libnx/

BUILD_TYPE=Debug
CURDIR="$(pwd)"
BUILD_DIR="$CURDIR/build"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

echo "🔧 Building BennuGD ($BUILD_TYPE)..."
cmake -B "$BUILD_DIR" \
  -DCMAKE_TOOLCHAIN_FILE="$DEVKITPRO/cmake/Switch.cmake" \
  -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
  -DCMAKE_C_FLAGS_DEBUG="-g3 -O0" \
  -DCMAKE_CXX_FLAGS_DEBUG="-g3 -O0"
cmake --build "$BUILD_DIR" --config "$BUILD_TYPE" -j"$(nproc)"

echo "📦 Combining static libraries..."
cd "$TMPDIR"
for lib in "$BUILD_DIR"/lib/*.a "$BUILD_DIR"/bennugd_libretro.a; do
  ar x "$lib"
done
ar rcs "$CURDIR/libretro_libnx.a" ./*.o
echo "✅ Created: $CURDIR/libretro_libnx.a"

cd "$CURDIR"
if [ ! -d retroarch ]; then
  echo "🌐 Cloning RetroArch..."
  git clone --depth=1 --branch v1.21.0 https://github.com/libretro/RetroArch.git retroarch
fi

cp "$CURDIR/libretro_libnx.a" retroarch/
cd retroarch

echo "🏗️ Building RetroArch NRO..."

make -f Makefile.libnx clean
make -f Makefile.libnx -j"$(nproc)" DEBUG=1

rm -f $CURDIR/libretro_libnx.a $CURDIR/bennugd_libretro_libnx.nro $CURDIR/bennugd_libretro_libnx.elf

OUTPUT="$CURDIR/bennugd_libretro_libnx.nro"
cp retroarch_switch.nro "$OUTPUT"

echo "🔗 Creating ELF (libretro_libnx.elf)..."
cp retroarch_switch.elf "$CURDIR/bennugd_libretro_libnx.elf"

echo
echo "🎉 Build completed successfully!"
echo "📦 Output: $OUTPUT"
echo "✅ You can now load it in RetroArch on your Nintendo Switch."