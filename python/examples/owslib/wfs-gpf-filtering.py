# https://owslib.readthedocs.io/en/latest/usage.html#wfs
from owslib.wfs import WebFeatureService

# https://gis.stackexchange.com/a/455292/302563 to adapt filter with WFS 2.0.0
from owslib.fes2 import PropertyIsEqualTo

import json

wfs_url="https://data.geopf.fr/wfs/ows"

wfs = WebFeatureService(url=wfs_url, version='2.0.0')

print('title={}'.format(wfs.identification.title))

print('types : ')
for type_name in wfs.contents:
    print('- {}'.format(type_name))

print('DescribeFeatureType for BDCARTO_V5:region :')
schema = wfs.get_schema('BDCARTO_V5:region')
print(json.dumps(schema, indent=2))

print('GetFeatures for BDCARTO_V5:region where code_insee = "27":')
filter = PropertyIsEqualTo(propertyname='code_insee', literal='27')
response = wfs.getfeature(
    typename='BDCARTO_V5:region', 
    srsname='urn:ogc:def:crs:EPSG::4326',
    outputFormat="application/json",
    filter=filter.toXML(),
    method="Post"
)
fc=json.load(response)
for f in fc['features']:
    print(json.dumps(f['properties'], indent=2))
