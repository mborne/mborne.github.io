# mborne.github.io

## Cours ENSG (french)

Les présentations et leurs annexes :

* [mborne.github.io/cours-devops - Introduction à la méthode DevOps](https://mborne.github.io/cours-devops/#1)
* [mborne.github.io/cours-patron-conception - Les patrons de conception](https://mborne.github.io/cours-patron-conception/#1)

## DevOps - containers

Homelab for docker or Kubernetes :

* [mborne/docker-devbox](https://github.com/mborne/docker-devbox) - Provides stacks to setup a container-based development environment with Docker or Kubernetes

Some examples in **french** relative to "cours-devops" to get started with docker and Kubernetes :

* [mborne/docker-exemples](https://github.com/mborne/docker-exemples?tab=readme-ov-file#readme) - Some examples **to get started with docker**

> See also [container.training - Introduction to Docker and Containers](https://container.training/intro-selfpaced.yml.html#1) (more complete with ~850 slides)

* [mborne/k8s-exemples](https://github.com/mborne/k8s-exemples) - Some examples to **get started with Kubernetes**

> See also [container.training - Deploying and Scaling Microservices with Docker and Kubernetes](https://container.training/kube-selfpaced.yml.html#1) (more complete with ~2400 slides)

Some **docker images** published to [GitHub Container Registry (gcr.io)](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) with GitHub actions :

* [mborne/debug](https://github.com/mborne/debug) - A sample application to illustrate some Docker and Kubernetes features (auto-restarts, memory limits,...)
* [mborne/terminal](https://github.com/mborne/terminal) - A simple alpine based image with debug tools (curl, wget, ping,...)
* [mborne/docker-postgis](https://github.com/mborne/docker-postgis) - PostgreSQL with PostGIS and pgrouting (**deprecated**, see [postgis/postgis](https://hub.docker.com/r/postgis/postgis) and [esgn/pgtuned](https://github.com/esgn/pgtuned))
* [mborne/docker-jenkins](https://github.com/mborne/docker-jenkins) - Docker image based on jenkins/jenkins:lts with docker CLI on master node (**deprecated**)
* [mborne/docker-geoserver](https://github.com/mborne/docker-geoserver) - Build and publish [ghcr.io/mborne/geoserver](https://github.com/mborne/docker-geoserver/pkgs/container/geoserver) image (**french**, explained for [cours-devops](https://mborne.github.io/cours-devops/#1))

A stack example dedicated to [cours-devops](https://mborne.github.io/cours-devops/#1) (**french**):

* [mborne/geostack-deploy - docker](https://github.com/mborne/geostack-deploy/tree/master/docker) - Deploy PostGIS and GeoServer with docker compose (**french**)


Some **helm charts published to OCI** :

* [mborne/helm-charts](https://github.com/mborne/helm-charts)

## DevOps - terraform

Some examples written to **get started with Terraform** :

* [mborne/gke-playground](https://github.com/mborne/gke-playground) - Experiment the build of a tiny landing zone with Terraform with Google Kubernetes Engine (GKE) (**french**)
* [mborne/gce-playground](https://github.com/mborne/gce-playground) - Experiment working with both Terraform and Ansible with Google Compute Engine (GCE) (**french**)

> Should be merged into a tf-exemples repository...

## DevOps - Ansible and Vagrant

Some **ansible roles** mainly written to experiment hosting on Raspberry PI and cheap VM using `docker compose up -d` :

* [mborne/ansible-docker-ce](https://github.com/mborne/ansible-docker-ce) - Deploy docker community edition following [docker-bench-for-security](https://github.com/docker/docker-bench-security?tab=readme-ov-file#docker-bench-for-security)
* [mborne/ansible-traefik](https://github.com/mborne/ansible-traefik) - Deploy traefik as a service to avoid network sharing in docker and simplify IP filtering
* [mborne/ansible-ufw](https://github.com/mborne/ansible-ufw) - **WARNING : bypassed by docker in iptables** when using `--port 5432:5432`! 
* [mborne/ansible-nfs-server](https://github.com/mborne/ansible-nfs-server) - Deploy a simple NFS server (to experiment ReadWriteMany (RWX) storage in Kubernetes)

Some **ansible playbooks** mainly written for [cours-devops](https://mborne.github.io/cours-devops) :

* [mborne/vagrantbox](https://github.com/mborne/vagrantbox) - Create some VM with Vagrant to manage them with Ansible
* [mborne/k3s-deploy](https://github.com/mborne/k3s-deploy) - Deploy a K3S multi-node cluster with Ansible
* [mborne/geostack-deploy - ansible](https://github.com/mborne/geostack-deploy/tree/master/ansible) - Deploy GeoServer and PostGIS with Ansible (**french**)

## DevOps - Docs as code

* [mborne/markdown-to-html](https://github.com/mborne/markdown-to-html) - My own markdown to HTML converter since there aren't enough [static site generators](https://jamstack.org/generators/) on the market ;)

> I prefer to fight with libraries like [Marked](https://github.com/markedjs/marked?tab=readme-ov-file#marked) than an application like [MkDocs](https://www.mkdocs.org/) to control HTML templating and ensure that the links work.

## GIT repositories managment

* [mborne/git-manager](https://github.com/mborne/git-manager) - Allows to backup and scan repositories from GitHub, GitLab or Gitea instances
* [mborne/satis-gitlab](https://github.com/mborne/satis-gitlab) - Generate [SATIS](https://github.com/composer/satis?tab=readme-ov-file#satis) configuration listing GIT repositories containing a `composer.json` file.
* [mborne/remote-git](https://github.com/mborne/remote-git) - A git client written in PHP to list repositories from GitHub, GitLab or Gitea instances

## DATA

### Loading spatial data

* [mborne/postgis-integration](https://github.com/mborne/postgis-integration) - Load sample datasets into PostGIS (naturalearth, adminexpress,...) based on NodeJS with the corresponding helpers :
  * [mborne/node-postgis-helper](https://github.com/mborne/node-postgis-helper)
  * [mborne/node-extract](https://github.com/mborne/node-extract)
  * [mborne/node-ogr2pg](https://github.com/mborne/node-ogr2pg)
  * [mborne/node-dl](https://github.com/mborne/node-dl)
* [mborne/apicarto-integration](https://github.com/mborne/apicarto-integration) - Same idea with bash scripting (2018, **archived**)

### Validating spatial data

* [mborne/validator-experiments](https://github.com/mborne/validator-experiments) - Experiment ROUTE500 and cadastre data validation with [IGNF/validator](https://github.com/IGNF/validator)
* [mborne/debug-gml-pcrs](https://github.com/mborne/debug-gml-pcrs) - Bug reproduction repository for [GDAL - GMLAS driver](https://gdal.org/drivers/vector/gmlas.html) (2022, **fixed, archived**)

### Versioning spatial data

* [mborne/pghs](https://github.com/mborne/pghs) - An attempt to generalize the IGNF BDTOPO versioning system using PostgreSQL trigger (2019)

## Webmapping

* [mborne/jquery-geometry-editor](https://github.com/mborne/jquery-geometry-editor) - A widget to make it easy to edit a geometry in HTML form (**archived**, see [IGNF/ol-geometry-editor](https://github.com/IGNF/ol-geometry-editor))
* [mborne/geoportail-leaflet](https://github.com/mborne/geoportail-leaflet) - An example to illustrate the use of WMTS service from IGNF like a TMS from OSM with Leaflet (**archived**)

## Miscellaneous

* [mborne/builder](https://github.com/mborne/builder) - Vagrant helper to create VM to build multi-arch docker images (**deprecated**)

* [mborne/ts-examples](https://github.com/mborne/ts-examples) - **private** - Some TypeScript examples written to get started with tooling setup (ts-node, mocha, chai, nyc)

* [mborne/packer-examples](https://github.com/mborne/packer-examples) - Experiment VirtualBox and Vagrant images building with packer (**private**)

> Private as README and LICENSE are missing. In addition, not found yet a way to make it portable between providers (maybe cloud-init?)

* [mborne/numpy-experiments](https://github.com/mborne/numpy-experiments) - Least square solving experimentation with numpy and tensorflow (**archive**)

* [mborne/spring-ioc-principe](https://github.com/mborne/spring-ioc-principe) - Sample spring project using XML old style to explain dependency injection principle (**french**, related to [cours-patron-conception](https://mborne.github.io/cours-patron-conception/#1))

* [mborne/math-city](https://github.com/mborne/math-city) - Minigame to learn multiplication tables (scam)
* [mborne/php-helloworld](https://github.com/mborne/php-helloworld)

## Old work

Relative to road graph processing :

* [mborne/graph-experiments](https://github.com/mborne/graph-experiments) - Experiment graph processing with boost::graph and GDAL / OGR (2019, **archived**)

Relative to work around [Simplu3D](https://github.com/Simplu3D) :

* [mborne/plu-formel](https://github.com/mborne/plu-formel) (2019, **archived fork**)
* [mborne/simplu3D-experiments](https://github.com/mborne/simplu3D-experiments) (2018, **archived fork**)

Relative to work with [SFCGAL](https://github.com/Oslandia/SFCGAL) (**archived**) :

* [mborne/cgal-decorate-point-with-data](https://github.com/mborne/cgal-decorate-point-with-data) - An experiment to add the "M" to XYZ points in CGAL (2016, **archived**)
* [mborne/sfcgal-experiment](https://github.com/mborne/sfcgal-experiment) - An experiment to compute a "morphing distance" between LineString (2016, **archived**)

> use case : pattern matching between linear geometry, cadastral parcels deformation measurement,...

* [mborne/dll2def](https://github.com/mborne/dll2def) - Convert .dll to .def to build GMP and MPFR on Windows (2014, **archived**)

