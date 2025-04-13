#include <iostream>
#include <list>
#include <algorithm>

#include <Eigen/Sparse>

/**
 * Test de la bibliothèque Eigen pour résoudre des systèmes creux (2013)
 */
int main(int argc, char** argv) {

	size_t n = 2000000 ;

	Eigen::VectorXd b(n) ;
	std::list< Eigen::Triplet<double> > coefficients;

	int k = 1 ;
	for ( size_t i = 0; i < n; i++ ){
		coefficients.push_back( Eigen::Triplet<double>(i,i,-1.0*k) ) ;
		if ( i > 1 ){
			coefficients.push_back( Eigen::Triplet<double>(i,i-1,2.0*k) ) ;
			coefficients.push_back( Eigen::Triplet<double>(i-1,i,2.0*k) ) ;
		}
		if ( i > 2 ){
			coefficients.push_back( Eigen::Triplet<double>(i,i-2,0.5*k) ) ;
			coefficients.push_back( Eigen::Triplet<double>(i-2,i,0.5*k) ) ;
		}
		k *= -1 ;
	}
	for ( size_t i = 0; i < n; i++ ){
		b[i] = 1.0 ;
	}

	Eigen::SparseMatrix<double> A(n,n);
	A.setFromTriplets(coefficients.begin(), coefficients.end());


	std::cout << "solve..." << std::endl ;

	// performs a Cholesky factorization of A
	Eigen::SimplicialCholesky< Eigen::SparseMatrix<double> > chol(A);
	// use the factorization to solve for the given right hand side
	Eigen::VectorXd x = chol.solve(b);

	std::cout << "check..." << std::endl;
	Eigen::VectorXd bCheck = A * x ;

	std::list< double > deltas ;
	for ( int i = 0; i < bCheck.size(); i++ ){
		deltas.push_back( bCheck[i] - b[i] ) ;
	}
	double dmin = *std::min_element(deltas.begin(),deltas.end()) ;
	double dmax = *std::max_element(deltas.begin(),deltas.end()) ;
	std::cout << dmin << " <= delta <= " << dmax << std::endl;
	return 0;
}
