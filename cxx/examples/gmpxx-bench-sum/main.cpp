/*
 * test de performance sur les sommes avec GMP (2013)
 */
#include <iostream>
#include <limits>
#include <cassert>

#include <gmpxx.h>

#include <boost/timer/timer.hpp>


template < typename T >
double toDouble( const T & v ){
	return (double)v ;
}

template <>
double toDouble( const mpz_class & v ){
	return v.get_d() ;
}
template <>
double toDouble( const mpq_class & v ){
	return v.get_d() ;
}


template < typename T >
T sum( const size_t n ){
	T result = (T)0 ;
	for ( size_t i = 0; i < n ; i++ ){
		result += T(i);
	}
	return result ;
}



template < typename T >
double sum2( const size_t n ){
	double result = 0.0 ;
	for ( size_t i = 0; i < n ; i++ ){
		result += toDouble(i) ;
	}
	return result ;
}




template < typename T >
double benchSum( size_t n ){
	boost::timer::cpu_timer timer ;
	timer.start();
	assert( sum2< T >(n) > 0 ) ;
	return timer.elapsed().wall * 1.0e-9 ;
}



int main( int argc, char* argv[] ){
	std::cout << std::fixed ;
	std::cout.precision( 5 );

	std::cout << "max,double,mpz_class,mpq_class" << std::endl;

	size_t max = 1000 ;
	for ( size_t i = 0; i < 18; i++ ){
		std::cout << max << "," ;
		std::cout.flush();
		std::cout << benchSum< double >(max) << "," ;
		std::cout.flush();
		std::cout << benchSum< mpz_class >(max) << "," ;
		std::cout.flush();
		std::cout << benchSum< mpq_class >(max) << std::endl ;

		max *= 2 ;
	}
	return 0 ;
}
