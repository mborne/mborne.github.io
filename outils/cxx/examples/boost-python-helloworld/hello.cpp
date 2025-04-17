#include <string>
#include <sstream>
#include <boost/python.hpp>

std::string version() {
	return "1.2.3" ;
}


class Point {
public:
	Point():
		_x(0.0),
		_y(0.0)
	{

	}
	Point( const double& x, const double& y ):
		_x(x),
		_y(y)
	{

	}


	double x() const {
		return _x ;
	}
	void setX( const double & x ) {
		_x = x ;
	}

	double y() const {
		return _x ;
	}
	void setY( const double & y ) {
		_y = y ;
	}


	double distance( const Point& other ){
		return sqrt( pow( _x - other._x, 2.0 ) + pow( _y - other._y, 2.0 ) ) ;
	}


	std::string toString() const {
		std::ostringstream oss;
		oss << _x << " " << _y ;
		return oss.str() ;
	}

private:
	double _x ;
	double _y ;
};



using namespace boost::python ;

BOOST_PYTHON_MODULE(hello)
{
	//function
	def( "version", version ) ;

	//class with default constructor and x,y constructor
	class_<Point>("Point")
		.def(init<double, double>())
		.add_property("x", &Point::x, &Point::setX)
		.add_property("y", &Point::y, &Point::setY)
		.def("toString", &Point::toString)
		.def("distance", &Point::distance)
	;
}




