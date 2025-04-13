#include <osgViewer/Viewer>
#include <osg/Geode>
#include <osg/ShapeDrawable>
#include <osg/Geometry>

#include <osgGA/TrackballManipulator>

#include <osgDB/ReadFile>

#include <iostream>

#include <osgx/TerrainTile.h>

using namespace osgx;

Matrix<double> createData(){
    Matrix<double> data(256,256);
    for ( size_t i = 0; i < data.size1(); i++ ){
        for ( size_t j = 0; j < data.size2(); j++ ){
            double x = static_cast<double>(i) / data.size1();
            double y = static_cast<double>(j) / data.size2();
            double z = pow(x-0.5,2.0) + pow(y-0.5,2.0) ;
            data(i,j) = z;
        }
    }
    return data;
}

int main(int argc, char **argv)
{
    // initialize the viewer.
    osgViewer::Viewer viewer;

    osg::Group* root = new osg::Group;

    osgx::TerrainTile tile(createData());
    osg::ref_ptr<osg::Geode> geode = new osg::Geode;
    geode->addDrawable(tile.toGeometry());
    //geode->getOrCreateStateSet()->setMode(GL_LIGHTING, osg::StateAttribute::OFF | osg::StateAttribute::PROTECTED);
    root->addChild(geode);

    viewer.setSceneData(root);

    viewer.setCameraManipulator(new osgGA::TrackballManipulator());
    // viewer.setUpViewOnSingleScreen(1);
    return viewer.run();
}
