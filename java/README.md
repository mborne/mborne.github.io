# Java

## Gestion des dépendances

* [maven](https://maven.apache.org/)
* [maven central repository](https://search.maven.org/)

## Bibliothèques généralistes

* [spring](https://spring.io)
    * [spring-boot](https://projects.spring.io/spring-boot/)
* [Hibernate](http://docs.jboss.org/hibernate/orm/5.2/userguide/html_single/Hibernate_User_Guide.html) pour l'accès aux bases SQL (ORM).
* [jgrapht](http://jgrapht.org/) pour manipuler des graphes.
* [CQEngine](https://github.com/npgall/cqengine#complete-example) pour l'indexation suivant plusieurs propriétés.
* [JUnit](https://junit.org/junit5/) pour les **tests unitaires**.
    * [mockito](https://site.mockito.org/) pour bouchonner les classes.

## Bibliothèques pour les données spatiales

* [GeoTools](http://www.geotools.org) pour manipuler des **données spatiales**.
* [JTS](https://github.com/locationtech/jts#jts-topology-suite) pour les **calculs géométrique**.
* [bedatadriven/jackson-datatype-jts](https://github.com/bedatadriven/jackson-datatype-jts) pour la **sérialisation GeoJSON** (plus maintenu), forké en :
    * [com.graphhopper.external - jackson-datatype-jts](https://mvnrepository.com/artifact/com.graphhopper.external/jackson-datatype-jts/2.14?utm_source=chatgpt.com)
    * [org.n52.jackson - jackson-datatype-jts](https://central.sonatype.com/artifact/org.n52.jackson/jackson-datatype-jts?utm_source=chatgpt.com)

## Application java pour les données spatiales

* [GeoServer](http://geoserver.org/) pour la diffusion de données raster et vecteur (WFS, WMS, WMTS).
* [GeoNetwork](https://geonetwork-opensource.org/) pour les métadonnées (CSW et CSW-T).
* [OpenJUMP](https://github.com/openjump-gis/openjump) (SIG).
* [JOSM](https://josm.openstreetmap.de/) pour l'édition des données OpenStreetMap.

## Ressources

* [popular-java](https://mvnrepository.com/popular) présente les bibliothèques Java populaires fournies par mvnrepository.com.
