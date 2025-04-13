#include <boost/test/unit_test.hpp>

#include <lkvs/KeyValueStore.h>

#include <array>

template < typename T, std::size_t N >
using Vector = std::array<T,N>;


BOOST_AUTO_TEST_SUITE(KeyValueStoreTest)

BOOST_AUTO_TEST_CASE( testPutGetRemove )
{
    std::string path = "./test-storage";

    lkvs::KeyValueStore store(path);

    Vector<double,2> v1 = {3.0,4.0} ;
    store.put(1,v1);

    Vector<double,2> rv1 ;
    BOOST_CHECK( store.get(1,rv1) );

    BOOST_CHECK_EQUAL(v1[0],rv1[0]);
    BOOST_CHECK_EQUAL(v1[1],rv1[1]);

    store.remove(1) ;
    BOOST_CHECK( ! store.get(1,rv1) );

    double v2 = 6.0 ;
    store.put(2,v2);
    double rv2 ;
    BOOST_CHECK( store.get(2,rv2) );
    BOOST_CHECK_EQUAL(v2,rv2);
}


BOOST_AUTO_TEST_CASE( testIterator )
{
    std::string path = "./test-storage";

    lkvs::KeyValueStore store(path);
    for ( int i = 0; i < 10; i++ ){
        store.put(i,2.0*i);
    }


    auto it = store.iterator() ;

    int    key ;
    double value ;
    int count = 0 ;
    while ( it.next( key, value ) ){
        BOOST_CHECK_EQUAL(key*2.0,value);
        count++ ;
    }
    BOOST_CHECK_EQUAL(10, count);
}

BOOST_AUTO_TEST_CASE( testIteratorEmpty )
{
    std::string path = "./test-storage";

    lkvs::KeyValueStore store(path);

    // ensure empty
    for ( int i = 0; i < 10; i++ ){
        store.remove(i);
    }

    auto it = store.iterator() ;
    BOOST_CHECK( ! it.hasNext() ) ;

    int count = 0 ;
    int    key ;
    double value ;
    while ( it.next( key, value ) ){
        count++ ;
    }
    BOOST_CHECK_EQUAL(0, count);
}




BOOST_AUTO_TEST_SUITE_END()
