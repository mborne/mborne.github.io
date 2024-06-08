# mborne.github.io

## Cours ENSG (french)

Les présentations et leurs annexes :

* [mborne.github.io/cours-devops - Introduction à la méthode DevOps](https://mborne.github.io/cours-devops/#1)
* [mborne.github.io/cours-patron-conception - Les patrons de conception](https://mborne.github.io/cours-patron-conception/#1)

## DevOps - Ansible

Some ansible roles mainly written to experiment hosting on Raspberry PI and cheap VM using `docker compose up -d` :

* [mborne/ansible-docker-ce](https://github.com/mborne/ansible-docker-ce) - deploy docker community edition following [docker-bench-for-security](https://github.com/docker/docker-bench-security?tab=readme-ov-file#docker-bench-for-security)
* [mborne/ansible-traefik](https://github.com/mborne/ansible-traefik) - deploy traefik as a service to avoid network sharing in docker and simplify IP filtering.
* [mborne/ansible-ufw](https://github.com/mborne/ansible-ufw) - **WARNING : bypassed by docker in iptables!**
* [mborne/ansible-nfs-server](https://github.com/mborne/ansible-nfs-server)

## DevOps - Vagrant

* [mborne/vagrantbox](https://github.com/mborne/vagrantbox) - create some VM with Vagrant and managed them with Ansible.

## DevOps - containers

* [mborne/debug](https://github.com/mborne/debug) - A sample application to illustrate some Docker and Kubernetes features (auto-restarts, memory limits,...)
* https://github.com/mborne/docker-devbox
* https://github.com/mborne/docker-geoserver
* https://github.com/mborne/docker-exemples
* https://github.com/mborne/docker-postgis
* https://github.com/mborne/terminal

* https://github.com/mborne/naas-cluster-roles
* https://github.com/mborne/k3s-deploy
* https://github.com/mborne/k8s-exemples
* https://github.com/mborne/k8s-experiments

* https://github.com/mborne/helm-charts

## DevOps - terraform

* https://github.com/mborne/gce-playground
* https://github.com/mborne/gke-playground
* https://github.com/mborne/packer-examples - **private**

## DevOps - CI/CD

* [mborne/docker-jenkins](https://github.com/mborne/docker-jenkins) - Docker image based on jenkins/jenkins:lts with docker CLI on master node (**deprecated**)
* [mborne/builder](https://github.com/mborne/builder) - Vagrant helper to create VM to build multi-arch docker images (**deprecated**)

## DATA

GIT repositories managment :

* https://github.com/mborne/git-manager - Allows to backup and check repositories from GitHub, GitLab or Gitea instances
* https://github.com/mborne/satis-gitlab - Generate [SATIS](https://github.com/composer/satis?tab=readme-ov-file#satis) configuration according to GIT repositories containing a `composer.json` file.
* https://github.com/mborne/remote-git - A git client written in PHP to list repositories from GitHub, GitLab or Gitea instances

Spatial data loading :

* https://github.com/mborne/postgis-integration - load sample datasets into PostGIS (naturalearth, adminexpress,...)
  * https://github.com/mborne/node-postgis-helper
  * https://github.com/mborne/node-extract
  * https://github.com/mborne/node-ogr2pg
  * https://github.com/mborne/node-dl
* https://github.com/mborne/apicarto-integration

Spatial data validation :

* See [IGNF/validator](https://github.com/IGNF/validator)
* https://github.com/mborne/validator-experiments
* https://github.com/mborne/debug-gml-pcrs

Spatial data versioning :

* https://github.com/mborne/pghs - an attempt to generalize the IGNF BDTOPO versioning system ("BDUNI") using PostgreSQL trigger


* https://github.com/mborne/jenkins-deploy

* https://github.com/mborne/mborne.github.io
* https://github.com/mborne/numpy-experiments
* https://github.com/mborne/php-helloworld
* https://github.com/mborne/spring-ioc-principe

## Webmapping

* [mborne/jquery-geometry-editor](https://github.com/mborne/jquery-geometry-editor) - a widget to make it easy to edit a geometry in HTML form (**archived**, see [IGNF/ol-geometry-editor](https://github.com/IGNF/ol-geometry-editor))
* [mborne/geoportail-leaflet](https://github.com/mborne/geoportail-leaflet) - an example to illustrate the use of WMTS service from IGNF like a TMS from OSM with Leaflet (**archived**)

## Miscellaneous

* [mborne/markdown-to-html](https://github.com/mborne/markdown-to-html) - My own markdown to HTML converter since there aren't enough [static site generators](https://jamstack.org/generators/) on the market ;)

> I prefer to fight with a library rather than an application like [MkDocs](https://www.mkdocs.org/) to control my rendering in HTML and ensure that the links work.

* [mborne/ts-examples](https://github.com/mborne/ts-examples) - **private** - Some TypeScript examples written to get started with tooling setup (ts-node, mocha, chai, nyc)
* [mborne/math-city](https://github.com/mborne/math-city) - minigame (scam)

## Old work

Relative to road graph processing :

* [mborne/graph-experiments](https://github.com/mborne/graph-experiments)

Relative to work around [Simplu3D](https://github.com/Simplu3D) :

* [mborne/plu-formel](https://github.com/mborne/plu-formel) (**fork**)
* [mborne/simplu3D-experiments](https://github.com/mborne/simplu3D-experiments) (**fork**)

Relative to work with [SFCGAL](https://github.com/Oslandia/SFCGAL) (**archived**) :

* [mborne/cgal-decorate-point-with-data](https://github.com/mborne/cgal-decorate-point-with-data) - an experiment to add the "M" to XYZ points in CGAL.
* [mborne/sfcgal-experiment](https://github.com/mborne/sfcgal-experiment) - an experiment to compute a "morphing distance" between LineString (use case : pattern matching between linear geometry, cadastral parcels deformation measurement,...)
* [mborne/dll2def](https://github.com/mborne/dll2def) - convert .dll to .def to build GMP and MPFR on Windows

