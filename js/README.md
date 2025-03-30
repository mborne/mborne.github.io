# JavaScript

## Installation de NodeJS

* [js/install-nodejs.sh](install-nodejs.sh) assure l'installation de NodeJS pour Ubuntu et Debian.
* Voir [nodejs.org - Download Node.js](https://nodejs.org/en/download) pour Windows et [js/nodejs-startup.ps1](nodejs-startup.ps1) qui est exploitable comme suit pour faire un raccourci :

```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe powershell.exe -NoExit -ExecutionPolicy Bypass -File "C:\...\toolbox\js\nodejs-startup.ps1"
```


## Gestion de dépendances

* [npm](https://docs.npmjs.com/cli/v7/commands) assure le **téléchargement des dépendances** et l'**exécution des scripts** définis dans le fichier `package.json`.
* [yarn](https://yarnpkg.com/) est une alternative possible à [npm](https://docs.npmjs.com/cli/v7/commands)
* [www.npmjs.com](https://www.npmjs.com/) est le principal dépôt public.
* [npm-check-updates](https://github.com/raineorshine/npm-check-updates#readme) facilite la mise à jour des dépendances :

```bash
# Pour identifier les mises à jour possibles
npx npm-check-updates
# Pour mettre à jour les dépendances sans modifier la version majeure :
npx npm-check-updates -u -t minor
```

## Bundlers

* [Vite](https://vite.dev/) - [Scaffolding Your First Vite Project](https://vite.dev/guide/#scaffolding-your-first-vite-project) :

```bash
# Pour un projet React+TypeScript
npm create vite@latest demo-vite-ts -- --template react-ts
cd demo-vite-ts
npm run dev
```

* [Rollup](https://rollupjs.org/)
* [Parcel](https://parceljs.org/)
* [esbuild](https://esbuild.github.io/)
* [webpack](https://webpack.js.org/)

## Création d'API WEB

* [express](https://www.npmjs.com/package/express) est un framework de développement d'application et d'API en javascript.
    * [express-validator](https://github.com/express-validator/express-validator/blob/master/README.md) donne un cadre pour la **validation des paramètres**.
* [NestJS](https://docs.nestjs.com/) et [Fastify](https://github.com/fastify/fastify#readme) comptent parmi les alternatives possibles à NextJS (Voir [Top 10 Express.js Alternatives](https://blog.back4app.com/expressjs-alternatives/#2_Fastifynbsp))
* [socket.io](https://socket.io) simplifie l'implémentation de WebSocket en JS.

## Création d'API CLI

* [commander](https://www.npmjs.com/package/commander) simplifie la gestion des paramètres passés en ligne de commande et la mise en oeuvre d'un `--help`.

## Frameworks

* [React](https://reactjs.org/) / [Next.js](https://nextjs.org/)
* [Vue](https://vuejs.org/) / [Nuxt](https://nuxt.com/)
* [Angular](https://angular.io/guide/quickstart)

## Tests unitaires et fonctionnels

* [Mocha](https://mochajs.org/) pour l'exécution des tests unitaires + [Chai](https://www.chaijs.com/) supportant différents styles d'assertions (should, expect et assert)
* [Jest](https://jestjs.io/fr/) est une alternative qui inclue les assertions.
  * [ts-jest](https://kulshekhar.github.io/ts-jest/docs/getting-started/installation) assure la transpilation pour TypeScript et ES6
* [supertest](https://github.com/ladjs/supertest#readme) permet de tester un service HTTP

## Cartographie WEB

* [leaflet](https://leafletjs.com/) est une bibliothèque de **cartographie web** simple d'utilisation.
* [OpenLayers](https://openlayers.org) est une bibliothèque de **cartographie web** disposant de fonctionnalités avancées.
  * [ol-ext](https://github.com/Viglino/ol-ext) propose un ensemble d'extensions pour OpenLayers.

## Manipulation de données géographiques

* [proj4js](http://proj4js.org) permet de transformer des coordonnées géographiques
  * [https://epsg.io/2154.js](https://epsg.io/2154.js) permet de récupérer la définition de Lambert93 pour cette bibliothèque.
  * Voir aussi [spatialreference.org](https://spatialreference.org/) qui est une alternative à [epsg.io](https://epsg.io)
* [jsts](https://github.com/bjornharrtell/jsts) est portage en JavaScript de la bibliotheque java [JTS](https://github.com/locationtech/jts#jts-topology-suite) (portée en C++ sous le nom GEOS pour PostGIS) permettant d'effectuer des **calculs géométriques** tels des calculs de zones tampons.
* [turfjs](http://turfjs.org) permet elle aussi de réaliser de **calculs géométriques** avec des données GeoJSON et des coordonnées en longitude et latitude.
* [mapshaper](https://github.com/mbloch/mapshaper#mapshaper) est un utilitaire proposant entre autre des fonctionnalités de simplification géométrique conservant la topologie à l'échelle d'une couche.
* [topojson-simplify](https://github.com/topojson/topojson-simplify) est lui aussi un utilitaire de simplification des géométries conservant la topologie.
* [node-gdal](http://naturalatlas.github.io/node-gdal/classes/gdal.html) est un binding NodeJS de la [bibliothèque GDAL](https://gdal.org/en/stable/) supportant de nombreux formats vecteurs et images.

## Rendu 3D

* [threejs](https://threejs.org) est une bibliothèque de **visualisation 3D généraliste** s'appuyant sur WebGL.
    * [KhronosGroup/glTF-Blender-IO](https://github.com/KhronosGroup/glTF-Blender-IO#blender-gltf-20-importer-and-exporter) permet d'exporter des modèles [blender](https://www.blender.org/) pour ThreeJS.
* [cesiumjs](https://cesiumjs.org) permet l'affichage d'un **globe 3D**.
* [iTowns](https://www.itowns-project.org/) permet l'affichage sur un **globe 3D ou en vue immersive**.

## Markdown

* [marked.js](https://marked.js.org) pour la conversion de markdown en HTML.
* [marpit](https://marpit.marp.app/) pour la convertion de markdown en **présentation HTML**.
* [remarkjs](https://remarkjs.com) pour la convertion de markdown en **présentation HTML**.

## Divers

* [ejs](http://ejs.co) est un moteur de template
* [tinymce](https://www.tinymce.com/) offre un éditeur [WYSIWYG](https://fr.wikipedia.org/wiki/What_you_see_is_what_you_get) pour du contenu HTML.
* [json-editor](https://github.com/json-editor/json-editor) permet la **génération de formulaire d'édition HTML** pour l'édition de données **en fonction d'un schéma JSON**.
* [axios](https://github.com/axios/axios#example) est client HTTP en JS offrant des résultats sous forme de Promise.
* [Elasticlunr.js](http://elasticlunr.com/) est un moteur de recherche full-text en JavaScript.
* [apache-cordova](https://cordova.apache.org) est un framework de **développement mobile** open-source basé sur HTML5, JS et CSS.

## Ressources

* [www.w3schools.com - Tutorials](https://www.w3schools.com/js/default.asp)
* [www.w3schools.com - JavaScript and HTML DOM Reference](https://www.w3schools.com/jsref/default.asp)
* [nodejs.org - api](https://nodejs.org/api/) : Documentation de référence de NodeJS
* [www.npmjs.com - Bibliothèque JavaScript populaires](https://www.npmjs.com/browse/depended) : Bibliothèque JavaScript populaires
* [www.w3schools.com - JavaScript Versions](https://www.w3schools.com/js/js_versions.asp)

