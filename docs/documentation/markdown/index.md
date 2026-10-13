# Rédiger la documentation en Markdown

> 🤖 Rédaction assistée par IA.

[Markdown](https://fr.wikipedia.org/wiki/Markdown) est un **format texte léger** : la mise en forme (titres, listes, liens, tableaux,...) est exprimée par quelques caractères.

## Intérêt

- Les fichiers sont **lisibles tels quels** et **faciles à versionner**.
- Le format est **rendu nativement par GitHub et GitLab**.
- Il sert de **format source à la plupart des générateurs de site**.
- Le format est **portable** : contrairement aux syntaxes propres à certains wikis (ex : wikitext de MediaWiki, format de stockage de Confluence), le contenu ne dépend pas d'un outil et passe facilement d'un rendu à l'autre (usine logicielle, générateur de site, wiki compatible Markdown).

## L'intérêt pour l'IA

- **Markdown est le format par défaut des LLM** (en entrée comme en sortie).
- [Docs as code](../docs-as-code/index.md) est la base des *skills* (`SKILL.md`), des consignes pour les agents (`AGENTS.md`) et des bases de connaissance [Open Knowledge Format (OKF)](../../ia/llm/okf/index.md).
- Un agent peut lire, rechercher et proposer des modifications par *pull request*, avec la même revue que pour un contributeur humain (voir [MCP GitHub - De l'issue à la revue de code](../../ia/llm/mcp/mcp-github.md)).
- Les approches *spec-driven development* (ex : [OpenSpec](https://github.com/Fission-AI/OpenSpec), [spec-kit](https://github.com/github/spec-kit)) généralisent le principe : les spécifications (besoin, conception, tâches) sont rédigées en Markdown et versionnées avec le code pour guider les agents de développement.

## Limites

- **Plusieurs variantes** : au-delà du socle [CommonMark](https://commonmark.org/), chaque outil ajoute ses extensions (GitHub Flavored Markdown, admonitions et onglets MkDocs,...). Un fichier peut donc s'afficher différemment selon l'outil (ex : un bloc `!!!info` n'est pas mis en forme par GitHub).
- **Ancres générées différemment** : `## Contrôles` devient `#contrôles` sur GitHub mais `#controles` avec MkDocs, ce qui casse les liens internes d'un rendu à l'autre.
- **Tableaux limités** : pas de fusion de cellules, contenu sur plusieurs lignes difficile à écrire, tableaux larges peu lisibles en texte brut (préférer un fichier CSV pour les données).
- **Mise en page sommaire** : pas de contrôle sur la taille des images, les colonnes ou les sauts de page. Le recours au HTML est possible mais nuit à la lisibilité.
- **Pas de réutilisation native** : pas d'inclusion de fichiers ni de variables, ces fonctionnalités dépendent du générateur de site.

## Apprendre la syntaxe

- [www.markdownguide.org - Basic Syntax](https://www.markdownguide.org/basic-syntax/) pour les **éléments de base** (titres, emphase, listes, liens, images, code).
- [www.markdownguide.org - Extended Syntax](https://www.markdownguide.org/extended-syntax/) pour les **extensions courantes** (tableaux, blocs de code délimités, notes de bas de page, listes de tâches).
- [tablesgenerator.com - markdown_tables](https://www.tablesgenerator.com/markdown_tables) pour **produire des tableaux** sans les aligner à la main.

## Aller plus loin avec docs as code

- [Docs as code](../docs-as-code/index.md) pour l'intérêt de rédiger la documentation en Markdown dans un dépôt Git.
- [Contrôler la documentation en CI](../docs-as-code/controles/index.md) pour vérifier la syntaxe et les liens.
