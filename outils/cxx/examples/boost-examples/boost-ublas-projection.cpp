// Test de ublas pour la projection d'un point sur une droite (2013)
#include <iostream>

#include <boost/numeric/ublas/vector.hpp>
#include <boost/numeric/ublas/io.hpp>

namespace ublas = boost::numeric::ublas ;


template < typename T >
class Vector : public ublas::vector< T >{
public:
	typedef ublas::vector< T > parent ;

	/**
	 * @brief empty constructor
	 */
	Vector():
		parent(0)
	{
	}

	/**
	 * @brief XY constructor
	 */
	Vector( const T& x, const T& y ):
		parent(2)
	{
		(*this)[0] = x ;
		(*this)[1] = y ;
	}

	/**
	 * @brief XYZ constructor
	 */
	Vector( const T& x, const T& y, const T& z ):
		parent(3)
	{
		(*this)[0] = x ;
		(*this)[1] = y ;
		(*this)[2] = z ;
	}

	template < typename AE >
	Vector( const ublas::vector_expression< AE > & other ):
		parent(other)
	{

	}

	inline T & x() { return (*this)[0] ; }
	inline const T & x() const { return (*this)[0] ; }
	inline T & y() { return (*this)[1] ; }
	inline const T & y() const { return (*this)[1] ; }
	inline T & z() { return (*this)[2] ; }
	inline const T & z() const { return (*this)[2] ; }
};




int main( int argc, char* argv[] ){
	Vector< double > a(0.0,0.0);
	Vector< double > b(5.0,5.0);

	Vector< double > p(0.0,5.0);

	Vector< double > ab = b - a ;
	double t = ublas::inner_prod( ( p - a ) , ab ) / ublas::inner_prod( ab, ab ) ;
	Vector< double > proj = a + ab * t ;
	std::cout << proj << std::endl;
	return 0 ;
}

