#ifndef LKVS_KEYVALUESTORE_H_
#define LKVS_KEYVALUESTORE_H_

#include <sstream>

#include <boost/assert.hpp>

#include <boost/lexical_cast.hpp>
#include <boost/archive/text_iarchive.hpp>
#include <boost/archive/text_oarchive.hpp>
#include <boost/serialization/array.hpp>

#include <leveldb/db.h>

#include <lkvs/KeyValueIterator.h>

namespace lkvs {

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
    class KeyValueStore {
        friend KeyValueIterator ;
    public:

        KeyValueStore( const std::string & path ):
            _db(NULL)
        {
            leveldb::Options options;
            options.create_if_missing = true;
            leveldb::Status status = leveldb::DB::Open(options,path,&_db);
        }

        KeyValueStore(const KeyValueStore& other) = delete;

        ~KeyValueStore()
        {
            delete _db ;
        }

        /**
         * Put a value for a given key
         */
        template < typename KeyType, typename ValueType >
        void put( const KeyType & key, const ValueType & value ) {
            std::ostringstream oss ;
            boost::archive::text_oarchive oa( oss ) ;
            oa & value ;

            _db->Put(
                leveldb::WriteOptions(),
                leveldb::Slice(boost::lexical_cast<std::string>(key)),
                oss.str()
            );
        }

        /**
         * Get a value for a given key
         * @return true is key is found
         */
        template < typename KeyType, typename ValueType >
        bool get( const KeyType & key, ValueType & value ){
            std::string data;
            leveldb::Status s = _db->Get(
                leveldb::ReadOptions(),
                leveldb::Slice(boost::lexical_cast<std::string>(key)),
                &data
            );
            if ( s.ok() ){
                std::istringstream iss(data) ;
                boost::archive::text_iarchive ia( iss ) ;
                ia & value ;
                return true ;
            }else{
                return false ;
            }
        }

        /**
         * Erase a value for a given key
         */
        template < typename KeyType >
        void remove( const KeyType& key ){
            leveldb::Status s = _db->Delete(
                leveldb::WriteOptions(),
                leveldb::Slice(boost::lexical_cast<std::string>(key))
            ) ;
            BOOST_ASSERT(s.ok());
        }


        KeyValueIterator iterator(){
            return KeyValueIterator(std::shared_ptr< leveldb::Iterator >(
                _db->NewIterator(leveldb::ReadOptions())
            )) ;
        }


    private:
        leveldb::DB* _db ;

        /**
         * low/level access
         */
        leveldb::DB* db() {
            return _db ;
        }

    } ;


} // lkvs

#endif
