#include <iostream>

#include <osg/Geode>
#include <osg/ShapeDrawable>
#include <osgViewer/Viewer>

int main( int argc, char* argv[] ){
    osgViewer::Viewer viewer;
    osg::Group* root = new osg::Group();

    osg::TessellationHints* hints = new osg::TessellationHints;
    hints->setDetailRatio(0.5f);

    osg::Geode* geode = new osg::Geode();

    double radius = 1.0 ;
    geode->addDrawable(
        new osg::ShapeDrawable(
            new osg::Sphere(osg::Vec3(0.0f,0.0f,0.0f),radius),hints
        )
    );
    root->addChild(geode);

    viewer.setSceneData( root );
    return viewer.run();

}
