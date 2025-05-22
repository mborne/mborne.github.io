#include <iostream>
#include <random>


#include <osg/Geode>
#include <osg/ShapeDrawable>
#include <osgViewer/Viewer>
#include <osg/PointSprite>
#include <osg/BlendFunc>
#include <osg/StateAttribute>
#include <osg/Point>
#include <osg/Geometry>
#include <osg/Texture2D>
#include <osg/TexEnv>
#include <osg/GLExtensions>
#include <osg/TexEnv>

#include <osgGA/OrbitManipulator>

#include <osgDB/ReadFile>


class Galaxy : public osg::Geode {
public:
    Galaxy(const int N = 100):
        osg::Geode(),
        t(0.0)
    {
        vertices = new osg::Vec3Array();
        speeds = new osg::Vec3Array();

        osg::Vec4Array *colors = new osg::Vec4Array();
        osg::Vec4 ini(1,1,0,1);
        osg::Vec4 fin(0,0,1,1);

        std::default_random_engine generator;
        std::normal_distribution<double> dXYZ(0.0,2.0);

        for ( int i = 0; i < N; i++ ){
            double x = 5.0*dXYZ(generator);
            double y = 5.0*dXYZ(generator);
            double z = 5.0*dXYZ(generator);

            vertices->push_back(osg::Vec3(x, y, z));
            speeds->push_back(osg::Vec3(0.0, 0.0, 0.0));
            colors->push_back(ini+(fin-ini)*(i/(float)N));
        }

        osg::Geometry *galaxy = new osg::Geometry();
        galaxy->setUseDisplayList(false);// allows vertex update
        galaxy->setVertexArray(vertices);
        galaxy->setColorArray(colors, osg::Array::BIND_PER_VERTEX);
        galaxy->addPrimitiveSet(new osg::DrawArrays(osg::PrimitiveSet::POINTS, 0, N));
        galaxy->setStateSet(createStateSet(5));
        this->addDrawable(galaxy);
    }

    void update( double dt ){
        float k = 0.5;

        t += dt;
        for ( size_t i = 0; i < vertices->size(); i++ ){
            osg::Vec3 & vertex = (*vertices)[i];
            osg::Vec3 & speed  = (*speeds)[i];

            osg::Vec3 f(0.0,0.0,0.0);
            for ( size_t j = 0; j < vertices->size(); j++ ){
                if ( i == j ){
                    continue;
                }
                osg::Vec3 & b = (*vertices)[j];
                osg::Vec3 ab = b - vertex ;
                f += ab * k / ( 1.0e-6 + ab.length2() ) ;
            }

            speed += f * dt;
            vertex += speed * dt ;
        }
    }

private:
    osg::Vec3Array *vertices ;
    osg::Vec3Array *speeds;
    double t;
    

	osg::StateSet* createStateSet(float size)
	{
		osg::StateSet *set = new osg::StateSet();

		/// Setup cool blending
		set->setMode(GL_BLEND, osg::StateAttribute::ON);
		osg::BlendFunc *fn = new osg::BlendFunc();
		fn->setFunction(osg::BlendFunc::SRC_ALPHA, osg::BlendFunc::DST_ALPHA);
		set->setAttributeAndModes(fn, osg::StateAttribute::ON);

		/// Setup the point sprites
		osg::PointSprite *sprite = new osg::PointSprite();
		set->setTextureAttributeAndModes(0, sprite, osg::StateAttribute::ON);

		/// Give some size to the points to be able to see the sprite
		osg::Point *point = new osg::Point();
		point->setSize(size);
		set->setAttribute(point);

		/// Disable depth test to avoid sort problems and Lighting
		set->setMode(GL_DEPTH_TEST, osg::StateAttribute::OFF);
		set->setMode(GL_LIGHTING, osg::StateAttribute::OFF);

		/// The texture for the sprites
		osg::Texture2D *tex = new osg::Texture2D();
		tex->setImage(osgDB::readImageFile("data/particle.rgb"));
		set->setTextureAttributeAndModes(0, tex, osg::StateAttribute::ON);

		return set;
	}

};


int main( int argc, char* argv[] ){
    osgViewer::Viewer viewer;
    osg::Group* root = new osg::Group();
    Galaxy * galaxy = new Galaxy(500);
    root->addChild(galaxy);
    viewer.setSceneData( root );

    viewer.setCameraManipulator(new osgGA::OrbitManipulator(),false);
    viewer.getCamera()->setViewMatrixAsLookAt(
        osg::Vec3(30.0,30.0,30.0),
        osg::Vec3(0.0,0.0,0.0),
        osg::Vec3(0.0,0.0,1.0)
    );

    viewer.realize();
    while ( ! viewer.done() ){
        viewer.frame();
        galaxy->update(0.005);
    }
    return 0;
}
