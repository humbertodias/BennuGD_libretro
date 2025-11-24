emcmake cmake -B build -DCMAKE_BUILD_TYPE=Debug -DSIZEOF_LONG_LONG=8 -DSDL=1
cmake --build build --config Debug

# if(INT16_SIZE EQUAL 2)
#     set(SIZE16 "int16_t")
# elseif(SHORT_SIZE EQUAL 2)
#     set(SIZE16 "short")
# elseif(INT_SIZE EQUAL 2)
#     set(SIZE16 "int")