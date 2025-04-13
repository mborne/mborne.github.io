#ifndef OSGX_ASCREADER_H
#define OSGX_ASCREADER_H

#include <osgDB/FileNameUtils>
#include <osgDB/FileUtils>
#include <osgDB/fstream>
#include <osgDB/Registry>

#include <osgTerrain/Locator>

namespace osgx
{

class ASCReader : public osgDB::ReaderWriter
{
  public:
    ASCReader()
    {
        supportsExtension("asc", "DEM file");
        //supportsOption("double","Read x,y,z data as double an stored as geometry in osg::Vec3dArray's.");
    }

    virtual const char *className() { return "ASC Reader"; }

    virtual bool acceptsExtension(const std::string &extension) const
    {
        return osgDB::equalCaseInsensitive(extension, "asc");
    }

    virtual ReadResult readObject(const std::string &fileName, const Options *opt) const
    {
        return readNode(fileName, opt);
    }

    virtual ReadResult readNode(const std::string &file, const Options *options) const
    {
        std::string ext = osgDB::getFileExtension(file);
        if (!acceptsExtension(ext))
            return ReadResult::FILE_NOT_HANDLED;

        std::string fileName = osgDB::findDataFile(file, options);
        if (fileName.empty())
            return ReadResult::FILE_NOT_FOUND;

        // bool useDouble = false;
        // if (options && options->getOptionString().find("double")!=std::string::npos)
        // {
        //     useDouble = true;
        // }

        /* metadata in ASC file */
        size_t ncols, nrows;
        double xllcorner, yllcorner, cellsize;
        double NODATA_value;

        std::string name;
        std::ifstream ifs(fileName.c_str());
        if (!ifs.good())
        {
            return ReadResult::FILE_NOT_FOUND;
        }

        ifs >> name >> ncols;
        ifs >> name >> nrows;
        ifs >> name >> xllcorner;
        ifs >> name >> yllcorner;
        ifs >> name >> cellsize;
        ifs >> name >> NODATA_value;

        std::cout << ncols << " " << nrows << std::endl;
        std::cout << xllcorner << " " << yllcorner << std::endl;
        std::cout << cellsize << std::endl;
        std::cout << NODATA_value << std::endl;

        osg::Geometry *geometry = new osg::Geometry();
        osg::Vec3Array *vertices = new osg::Vec3Array;
        geometry->setVertexArray(vertices);

        for (size_t i = 0; i < nrows; i++)
        {
            for (size_t j = 0; j < ncols; j++)
            {
                double z;
                ifs >> z;
                vertices->push_back(
                    osg::Vec3(
                        xllcorner + (j + 0.5) * cellsize,
                        yllcorner + cellsize * (nrows - 1) - (i + 0.5) * cellsize,
                        (z != NODATA_value) ? z : 0.0));
            }
        }

        osg::DrawElementsUInt *triangles = new osg::DrawElementsUInt(osg::PrimitiveSet::TRIANGLES, 0);
        for (size_t i = 0; i < nrows - 1; i++)
        {
            for (size_t j = 0; j < ncols - 1; j++)
            {
                size_t a = i * ncols + j;
                size_t b = i * ncols + (j + 1);
                size_t c = (i + 1) * ncols + (j + 1);
                size_t d = (i + 1) * ncols + j;
                //a,d,c
                if ((*vertices)[a].z() != 0.0 && (*vertices)[d].z() != 0.0 && (*vertices)[c].z() != 0.0)
                {
                    triangles->push_back(a);
                    triangles->push_back(d);
                    triangles->push_back(c);
                }

                //a,c,b
                if ((*vertices)[a].z() != 0.0 && (*vertices)[c].z() != 0.0 && (*vertices)[b].z() != 0.0)
                {
                    triangles->push_back(a);
                    triangles->push_back(c);
                    triangles->push_back(b);
                }
            }
        }
        geometry->addPrimitiveSet(triangles);

        osg::Geode *geode = new osg::Geode();
        geode->addDrawable(geometry);
        std::cout << "read file" << std::endl;
        geode->setName(fileName);

        return geode;
    }
};

} // namespace osgx

//REGISTER_OSGPLUGIN(asc, osgx::ASCReader)

#endif
