#include <iostream>

#include <string>

#include <boost/multi_index_container.hpp>
#include <boost/multi_index/member.hpp>
#include <boost/multi_index/ordered_index.hpp>

struct item_t {

	item_t( int id_ = 0 , std::string name_ = "" ):
		id(id_),
		name(name_)
	{

	}

	item_t( const item_t & other )
	{
		(*this) = other ;
	}

	item_t & operator = ( const item_t& other ){
		id = other.id ;
		name = other.name ;
		return *this ;
	}

	inline bool operator < ( const item_t& other ) const
	{
		return id < other.id ;
	}

	int id ;
	std::string name ;
};


inline std::ostream& operator << ( std::ostream& s, const item_t & i ) {
	s << i.id << " " << i.name ;
	return s ;
}


// define a multiply indexed set with indices by id and name
typedef boost::multi_index_container<
	item_t,
	boost::multi_index::indexed_by<
		// sort by item::operator<
		boost::multi_index::ordered_unique< boost::multi_index::identity<item_t> >,
		// sort by less<string> on name
		boost::multi_index::ordered_non_unique< boost::multi_index::member< item_t, std::string, &item_t::name > >
	>
> item_set;

void print_out_by_name(const item_set& items)
{
	// get a view to index #1 (name)
	typedef item_set::nth_index<1>::type name_index_t ;
	const name_index_t& name_index=items.get<1>();

	for ( name_index_t::const_iterator it = name_index.begin(); it != name_index.end(); ++it ){
		std::cout << (*it) << std::endl ;
	}
}



int main( int argc, char* argv[] ){
	item_set items ;

	// name id
	typedef item_set::nth_index<0>::type id_index_t ;
	id_index_t & id_index = items.get<0>() ;

	// name index
	typedef item_set::nth_index<1>::type name_index_t ;
	name_index_t & name_index = items.get<1>() ;


	std::cout << "-- insert items" << std::endl ;
	items.insert( item_t(0,"toto") );
	items.insert( item_t(1,"aboc") );
	print_out_by_name( items );


	std::cout << "-- find an item by name" << std::endl ;
	{
		name_index_t::iterator it = name_index.find( "aboc" ) ;
		if ( it != name_index.end() ){
			item_t aboc = *it ;
			std::cout << "aboc : " << aboc << std::endl ;
		}
	}

	std::cout << "-- replace an item" << std::endl ;
	{
		name_index_t::iterator it = name_index.find( "aboc" ) ;
		name_index.replace( it, item_t(5,"previously aboc") );
	}

	print_out_by_name( items );

	return 0 ;
}
