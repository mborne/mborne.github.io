// Test de boost ublas avec GMP pour la résolution exacte d'une équation avec des rationnels (~2013)

#include <iostream>

#define BOOST_UBLAS_TYPE_CHECK 0

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/matrix.hpp>
#include <boost/numeric/ublas/io.hpp>
#include <boost/numeric/ublas/lu.hpp>

#include <boost/multiprecision/gmp.hpp>
#include <boost/multiprecision/gmp.hpp>
using namespace boost::multiprecision ;


namespace ublas = boost::numeric::ublas ;

int main( int argc, char* argv[] ){
	ublas::matrix< mpq_rational > A = ublas::identity_matrix< mpq_rational >(20);
	ublas::vector<mpq_rational> b(A.size1());

	for ( size_t i = 0; i < A.size1(); i++ ){
		A(i,i) = i + 1 ;
		b[i] = mpq_rational(i) / 3 ;
	}

	ublas::permutation_matrix<> pm( A.size1() );
	ublas::matrix< mpq_rational > M = A;
	ublas::vector< mpq_rational > x = b;
	ublas::lu_factorize( M, pm );
	ublas::lu_substitute( M, pm, x );

	std::cout << "A : " << A << std::endl ;
	std::cout << "b : " << b << std::endl ;
	std::cout << "x : " << x << std::endl ;

	ublas::vector< mpq_rational > Ax = ublas::prod(A, x) ;
	std::cout << "A.x : " << Ax << std::endl ;

	return 0 ;
}
