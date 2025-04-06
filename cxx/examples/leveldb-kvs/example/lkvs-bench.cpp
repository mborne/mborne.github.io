#include <iostream>

#include <lkvs/KeyValueStore.h>

#include <array>
#include <boost/timer/timer.hpp>
#include <boost/format.hpp>

using namespace lkvs;

using Point = std::array<double,2>;

using Timer = boost::timer::cpu_timer;

int main(){
    Timer timer;
    timer.start();
    KeyValueStore store("./bench-store");
    for ( int i = 0; i < 1000000; i++ ){
        Point p;
        p[0] = static_cast<double>(i);
        p[1] = static_cast<double>(i);
        store.put(i, p);
    }
    timer.stop();
    std::cout << "write 1 000 000 2D points : " << (timer.elapsed().wall*1.0e-9) << " (s)" << std::endl;

    timer.start();
    KeyValueIterator it = store.iterator();
    int key ;
    Point value ;
    while ( it.next(key,value) ){
        // ignore
    }
    timer.stop();
    std::cout << "read 1 000 000 2D points : " << (timer.elapsed().wall*1.0e-9) << " (s)"<< std::endl;

    return 0;
}