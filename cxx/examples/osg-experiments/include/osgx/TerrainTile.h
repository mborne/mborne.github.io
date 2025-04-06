#ifndef OSGX_TERRAINTILE_H
#define OSGX_TERRAINTILE_H

#include <osg/Geometry>
#include <osgx/Matrix.h>

namespace osgx {

    class TerrainTile {
    public:
        TerrainTile(const Matrix<double> & data = Matrix<double>(1,1)): 
            _data(data)
        {
            
        }

        double x( size_t i ) const {
            return static_cast<float>(i) / _data.size1();
        }

        double y( size_t j ) const {
            return static_cast<float>(j) / _data.size2();
        }

        osg::Vec3 vertex(size_t i, size_t j) const {
            double z = _data(i,j);
            return osg::Vec3(x(i),y(j),z);
        }

        size_t index(size_t i, size_t j){
            return j + i * _data.size2();
        }

        osg::Geometry *toGeometry()
        {
            osg::Geometry *geometry = new osg::Geometry();

            /* vertices */
            osg::Vec3Array *vertices = new osg::Vec3Array();
            geometry->setVertexArray(vertices);

            /* normals */
            osg::Vec3Array *normals = new osg::Vec3Array();
            //normals->push_back(osg::Vec3(0.0f,0.0f,1.0f));
            geometry->setNormalArray(normals,osg::Array::BIND_PER_VERTEX);

            /* triangles */
            for (size_t i = 0; i < _data.size1()-1; i++)
            {
                for (size_t j = 0; j < _data.size2()-1; j++)
                {
                    osg::Vec3 a = vertex(i  , j);
                    osg::Vec3 b = vertex(i  , j+1);
                    osg::Vec3 c = vertex(i+1, j+1);
                    osg::Vec3 d = vertex(i+1, j);
                    
                    vertices->push_back(a);
                    vertices->push_back(b);
                    vertices->push_back(d);
                    {
                        osg::Vec3 n = normal(a,b,d);
                        for ( size_t i = 0; i < 3; i++ )
                            normals->push_back(n);
                    }

                    vertices->push_back(b);
                    vertices->push_back(c);
                    vertices->push_back(d);
                    {
                        osg::Vec3 n = normal(b,c,d);
                        for ( size_t i = 0; i < 3; i++ )
                            normals->push_back(n);
                    }     
                }
            }

            /* draw primitive */
            geometry->addPrimitiveSet(new osg::DrawArrays(
                osg::PrimitiveSet::TRIANGLES, 
                0,
                vertices->size()
            ));

            return geometry;
        }

    private:
        /**
         * Tile data
         */
        Matrix<double> _data;


        osg::Vec3 normal(const osg::Vec3& a, const osg::Vec3& b, const osg::Vec3& c) const{
            osg::Vec3 result = ( a - b ) ^ ( c - b ) ;
            result.normalize();
            return result;
        }
    };

}

#endif
