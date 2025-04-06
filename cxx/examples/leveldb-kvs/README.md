# leveldb-kvs

## Description

Experimentation with leveldb and boost::serialization to provide a simple key-value store (2018)

## Build

```bash
# install dependencies
sudo apt-get install -y \
    libboost-serialization-dev libboost-timer-dev libboost-test-dev \
    libleveldb-dev

# build with cmake
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
./test/lkvs-test --log_level=all

./example/lkvs-bench
```


## Example

see [example/lkvs-helloworld.cpp](example/lkvs-helloworld.cpp)

