# TypeScript et NodeJS - La blague de la gestion des extensions

## Problème

Pour utiliser dans `src/main.ts` une fonction `hello()` exportée dans `src/utils.ts` :

```ts
// KO : Les extensions ne doivent pas être spécifiée en TypeScript :
// import {hello} from './utils.ts';

/*
 * KO avec NodeJS car :
 * - tsc n'ajoute pas l'extension .js
 * - nodejs ne résoud pas si l'extension n'est pas spécifiée. 
 */
// import {hello} from 'utils'

/*
 * C'est moche mais "node dist/main.js" fonctionne
 * après transpilation avec tsc :
 */
import {hello} from 'utils.js'
hello();
```

## Ressources

* [github.com - microsoft/TypeScript - Provide a way to add the '.js' file extension to the end of module specifiers (16577, closed)](https://github.com/microsoft/TypeScript/issues/16577#issuecomment-754941937)
* [github.com - GervinFung/ts-add-js-extension](https://github.com/GervinFung/ts-add-js-extension) est une extension de tsc pour l'ajout des extensions ".js".
* [github.com - microsoft/vscode - #131837](https://github.com/microsoft/vscode/issues/131837) explique comment tolérer des fichiers .js n'existant pas...
