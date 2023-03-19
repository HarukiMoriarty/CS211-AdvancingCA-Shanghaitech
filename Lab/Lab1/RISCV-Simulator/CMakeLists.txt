cmake_minimum_required(VERSION 3.1)

project(RISCV-Simulator)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "-O2 -Wall")
SET(CMAKE_BUILD_TYPE "Debug")
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g2 -ggdb")
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")


include_directories(${CMAKE_SOURCE_DIR}/include)

add_executable(
    Simulator 
    src/MainCPU.cpp 
    src/MemoryManager.cpp 
    src/Simulator.cpp 
    src/BranchPredictor.cpp 
    src/Cache.cpp
)

add_executable(
    CacheSim 
    src/MainCache.cpp 
    src/MemoryManager.cpp 
    src/Cache.cpp
)

add_executable(
    CacheOptimized
    src/MainCacheOptimization.cpp
    src/MemoryManager.cpp
    src/Cache.cpp
)

add_executable(ToDirenoTrace src/ToDirenoTrace.cpp)