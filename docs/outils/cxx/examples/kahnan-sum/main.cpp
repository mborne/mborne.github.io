#include <iostream>
#include <algorithm>
#include <vector>

/*
 * Algorithme de la somme de Hahan (2012)
 */
template < typename T >
class KahanSum {
public:
	KahanSum( T const& initial = (T)0 ):
		_result(initial),
		_lastError((T)0)
	{
	}
	
	/// \brief add a number
	KahanSum & operator += ( T const& v )
	{
		//add v and lastError
		T vAndLastError = v + _lastError;
		//add a big and a small value
		T newResult = _result + vAndLastError;
		//estimate error (sum and result are same order values)
		_lastError = (newResult - _result) - vAndLastError ;
		//affect result
		_result = newResult;
	}	
	
	/// \brief return the value
	T 	const& getResult() const 
	{
		return _result;
	}
	

private:
	T _result;
	T _lastError;
};


template < typename Iterator >
typename Iterator::value_type kahan_sum( Iterator begin, Iterator end )
{
	KahanSum< typename Iterator::value_type > kahanSum;
	for ( Iterator it = begin; it != end; ++it ){
		kahanSum += (*it);
	}
	return kahanSum.getResult();
}
template < typename Iterator >
typename Iterator::value_type sum( Iterator begin, Iterator end )
{
	typedef typename Iterator::value_type value_type;
	value_type  result = (value_type)0;
	for ( Iterator it = begin; it != end; ++it ){
		result += (*it);
	}
	return result;
}


/**
 * Test de prise en main de la bibliothèque GMP (~2013)
 */
int main( int argc, char* argv[] ){
	std::vector< float > values;
	std::vector< int > valuesB;
	for ( int i = -10000; i <= 10000; i++ ){
		values.push_back(i);
		valuesB.push_back(i);
	}
	std::cout.precision( 7 );
	std::cout << std::fixed;
	std::cout << "kahan_sum : " << kahan_sum( values.begin(), values.end() ) << std::endl;
	std::cout << "naive sum : " << ::sum( values.begin(), values.end() ) << std::endl;
	std::cout << "exact     : " << ::sum( valuesB.begin(), valuesB.end() ) << std::endl;
	return 0;
}
