#ifndef OSGX_MATRIX_H
#define OSGX_MATRIX_H

#include <boost/numeric/ublas/matrix.hpp>

namespace osgx {

    template < typename T >
    using Matrix = boost::numeric::ublas::matrix<T> ;

}

#endif

