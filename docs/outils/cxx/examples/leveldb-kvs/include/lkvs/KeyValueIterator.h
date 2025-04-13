#ifndef LKVS_KEYVALUEITERATOR_H_
#define LKVS_KEYVALUEITERATOR_H_

#include <sstream>

#include <boost/assert.hpp>

#include <boost/lexical_cast.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/archive/text_oarchive.hpp>

#include <leveldb/db.h>

namespace lkvs {

    class KeyValueStore ;

    /**
     * <Key->Value> store based on LevelDB and Boost serialization
     *
     * Requirements :
     * <ul>
     *    <li>KeyType must support lexical_cast from and to std::string</li>
     *    <li>ValueType must support text_archive serialization</li>
     * </ul>
     *
     */
    class KeyValueIterator {
    public:
        KeyValueIterator(std::shared_ptr< leveldb::Iterator > it ):
            _it(it)
        {
            _it->SeekToFirst();
        }


        /**
         * Indicates if iterator has next
         */
        bool hasNext() const {
            return _it->Valid() ;
        }

        template < typename KeyType, typename ValueType >
        bool next( KeyType & key, ValueType & value ) {
            if ( ! _it->Valid() ){
                return false ;
            }

            key = boost::lexical_cast< KeyType >( _it->key().ToString() ) ;

            std::istringstream iss( _it->value().ToString() ) ;
            boost::archive::text_iarchive iar(iss) ;
            iar & value ;

            _it->Next() ;
            return true ;
        }
    private:
        std::shared_ptr< leveldb::Iterator > _it ;
    } ;


} // lkvs

#endif
