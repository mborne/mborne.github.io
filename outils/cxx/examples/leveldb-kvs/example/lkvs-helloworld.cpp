#include <iostream>

#include <lkvs/KeyValueStore.h>

#include <array>

using namespace lkvs;

using Point = std::array<double,2>;

int main(){
    KeyValueStore store("./helloworld-store");
    for ( int i = 0; i < 5; i++ ){
        Point p;
        p[0] = static_cast<double>(i);
        p[1] = static_cast<double>(i);
        store.put(i, p);
    }

    KeyValueIterator it = store.iterator();
    int key ;
    Point value ;
    while ( it.next(key,value) ){
        std::cout << key << " -> " << value[0] << " " << value[1] << std::endl;
    }

    return 0;
}

