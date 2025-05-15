#include <iostream>
#include <boost/graph/adjacency_list.hpp>

/**
 * Exemple de prise en main de boost::graph (2012)
 */
int main( int argc, char* argv[] ){
	typedef boost::adjacency_list< boost::listS, boost::vecS, boost::directedS  > 	graph_t;
	typedef boost::graph_traits< graph_t >::vertex_descriptor 						vertex_t;
	typedef boost::graph_traits< graph_t >::edge_descriptor 						edge_t;
	typedef	boost::graph_traits< graph_t >::vertex_iterator							vertex_iterator_t;
	typedef	boost::graph_traits< graph_t >::edge_iterator							edge_iterator_t;

	graph_t g;

	boost::add_edge(0,1,g);
	boost::add_edge(1,2,g);
	boost::add_edge(2,3,g);
	boost::add_edge(3,4,g);
	boost::add_edge(4,5,g);
	boost::add_edge(5,6,g);
	boost::add_edge(6,7,g);
	boost::add_edge(7,8,g);

	std::cout << boost::num_edges(g) << std::endl;
	std::cout << boost::num_vertices(g) << std::endl;

	boost::remove_vertex(3,g);
	boost::clear_vertex(3, g);
	std::cout << boost::num_edges(g) << std::endl;
	std::cout << boost::num_vertices(g) << std::endl;

	vertex_iterator_t vi, vi_end;
	for (boost::tie(vi, vi_end) = boost::vertices(g); vi != vi_end; ++vi){
		std::cout << "vertex : "<< (*vi) << std::endl;
	}
	edge_iterator_t ei, ei_end;
	for (boost::tie(ei, ei_end) = boost::edges(g); ei != ei_end; ++ei){
		vertex_t source = boost::source(*ei,g);
		vertex_t target = boost::target(*ei,g);
		std::cout << source << " => "<< target << std::endl;
	}

	return 0;
}
