#include <iostream>

#include <osgViewer/Viewer>
#include <osg/Group>

#include <osgGA/TrackballManipulator>

#include <osgDB/Registry>
#include <osgDB/ReadFile>
#include <osgx/ASCReader.h>

int main( int argc, char * argv[] ){
    if ( argc != 2 ){
        std::cerr << "Usage : osg-dem path/to/dem.asc" << std::endl;
        return 1;
    }
    std::string path(argv[1]);

    /* create viewer with root node */
    osgViewer::Viewer viewer;
    osg::Group* root = new osg::Group;
    viewer.setSceneData(root);

    /* registry asc driver */
    osgDB::Registry::instance()->addReaderWriter(new osgx::ASCReader());

    /* load dem */
    osg::Geode* dem = static_cast<osg::Geode*>(osgDB::readObjectFile(path));
    root->addChild(dem);

    /* add camera maninipulator and run */
    viewer.setCameraManipulator(new osgGA::TrackballManipulator());
    return viewer.run();
}
