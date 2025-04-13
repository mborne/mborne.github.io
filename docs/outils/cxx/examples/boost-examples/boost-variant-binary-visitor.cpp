// Test de boost variant avec visiteur binaire / double dispatching (~2013)
#include <iostream>

#include <boost/variant.hpp>

typedef boost::variant< int, double > variant_t ;


struct signature_visitor : public boost::static_visitor< std::string > {
	std::string operator () ( const int& a, const int& b ) const {
		return "(int,int)" ;
	} 
	std::string operator () ( const int& a, const double& b ) const {
		return "(int,double)" ;
	}
	std::string operator () ( const double& a, const int& b ) const {
		return "(double,int)" ;
	} 
	std::string operator () ( const double& a, const double& b ) const {
		return "(double,double)" ;
	}
};


int main( int argc, char* argv[] ){
	variant_t a(1);
	variant_t b(5.0);

	signature_visitor visitor ;
	std::cout << boost::apply_visitor(visitor,a,a) << std::endl ;
	std::cout << boost::apply_visitor(visitor,a,b) << std::endl ;
	std::cout << boost::apply_visitor(visitor,b,a) << std::endl ;
	std::cout << boost::apply_visitor(visitor,b,b) << std::endl ;
	return 0 ;
}

