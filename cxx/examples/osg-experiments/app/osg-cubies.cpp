#include <osgViewer/Viewer>
#include <osg/AnimationPath>
#include <osg/MatrixTransform>
#include <osg/ShapeDrawable>

#include <ctime>




osg::AnimationPath* createAnimationPath(const osg::Vec3& center,float radius,double looptime)
{
    // set up the animation path
    osg::AnimationPath* animationPath = new osg::AnimationPath;
    animationPath->setLoopMode(osg::AnimationPath::LOOP);

    int numSamples = 40;
    float yaw = 0.0f;
    float yaw_delta = 2.0f*osg::PI/((float)numSamples-1.0f);
    float roll = osg::inDegrees(30.0f);

    double time=0.0f;
    double time_delta = looptime/(double)numSamples;
    for(int i=0;i<numSamples;++i)
    {
        osg::Quat rotation(osg::Quat(roll,osg::Vec3(0.0,1.0,0.0))*osg::Quat(-(yaw+osg::inDegrees(90.0f)),osg::Vec3(0.0,0.0,1.0)));

        animationPath->insert(time,osg::AnimationPath::ControlPoint(center,rotation));

        yaw += yaw_delta;
        time += time_delta;

    }
    return animationPath;
}


osg::Node* creerScene()
{

	osg::AnimationPath* animationPath = createAnimationPath(osg::Vec3(0.0f,0.0f,0.0f),5.0,20.0) ;

	osg::MatrixTransform* xform = new osg::MatrixTransform;
	xform->setUpdateCallback(new osg::AnimationPathCallback(animationPath,0.0f,2.0));


	// Création du cube.
	osg::Geode* pGeode = new osg::Geode();

	srand(time(NULL));

	for ( int i = 0; i < 5000; i++ ){
		double x = 10.0 * rand() / (double)RAND_MAX - 5.0 ;
		double y = 10.0 * rand() / (double)RAND_MAX - 5.0 ;
		double z = 10.0 * rand() / (double)RAND_MAX - 5.0 ;
		pGeode->addDrawable( new osg::ShapeDrawable( new osg::Box(osg::Vec3(x,y,z),0.5f) ) );
	}


	xform->addChild(pGeode);
    return xform;
}


int main(int argc, char* argv[]) {
     // Création du viewer
     osgViewer::Viewer viewer;

     //viewer.setUpViewInWindow( 32, 32, 512, 512 );

     // Création de la scène.
     viewer.setSceneData(creerScene());

     // lancement du viewer
     return viewer.run();
}
