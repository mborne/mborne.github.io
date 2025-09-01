#include <iostream>

#include <gmpxx.h>

#include <boost/timer/timer.hpp>

/**
 * Test de prise en main de la bibliothèque GMP (~2012)
 */
int main( int argc, char* argv[] ){
	{
		boost::timer::cpu_timer timer ;
		timer.start();
		mpz_class value = 1 ;
		for ( size_t i = 0; i < 10000; i++ ){
			value *= 2 ;
		}
		timer.stop() ;
		std::cout << timer.elapsed().wall * 1.0e-9 << std::endl ;
	}
	{
		boost::timer::cpu_timer timer ;
		timer.start();
		mpq_class value = 1 ;
		for ( size_t i = 0; i < 10000; i++ ){
			value *= 2 ;
		}
		timer.stop() ;
		std::cout << timer.elapsed().wall * 1.0e-9 << std::endl ;
	}
	return 0 ;
}
