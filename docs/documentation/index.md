# La documentation

## Rédiger la documentation en Markdown

- [www.markdownguide.org - Basic Syntax](https://www.markdownguide.org/basic-syntax/)
- [www.markdownguide.org - Extended Syntax](https://www.markdownguide.org/basic-syntax/)
- [tablesgenerator.com - markdown_tables](https://www.tablesgenerator.com/markdown_tables) pour **produire des tableaux**.

## Contrôler les liens

!!!info "En construction"

    Recherche d'outil en cours pour vérifier rapidement les liens dans une documentation markdown.

- [markdown-link-check](https://github.com/tcort/markdown-link-check#readme)

```bash
npx -y markdown-link-check ./docs/outils
```

## Dessiner des schémas

- [draw.io](https://www.draw.io/) (desktop) et [www.diagrams.net](https://www.diagrams.net/) (en ligne)

!!!tip "Astuce"

    Inclure une copie du diagramme en exportant en PNG (`.drawio.png`) permet d'avoir des images éditables!

- [DIA](https://fr.wikipedia.org/wiki/Dia_(logiciel)) et [StarUML](https://staruml.io/) (payant) sont particulièrement efficaces pour les diagrammes UML.
- [GanttProject](https://www.ganttproject.biz/) se focalise sur les [diagrammes de Gantt](https://fr.wikipedia.org/wiki/Diagramme_de_Gantt)

## Générer des schémas

Pour des *schemas as code* :

- [Mermaid](https://mermaid.js.org/ecosystem/tutorials.html) offre une syntaxe pour **différents types de schéma (Mindmap, diagramme de classe UML, diagramme de Gantt,...)**.
- [www.websequencediagrams.com](https://www.websequencediagrams.com/) se spécialise sur les **diagrammes de séquences**.

## Générer un site web

!!!warning "En construction"

    Ce site utilise désormais [zensical](https://zensical.org/) et migre progressivement les références historiques vers sa documentation.

Il existe de nombreux **générateurs de sites statiques** :

- [Jekyll](https://jekyllrb.com/) qui est utilisé par défaut pour GitHub pages.
- [MkDocs](https://www.mkdocs.org/)
    - [Zensical](https://zensical.org/)
- [Docsify](https://docsify.js.org/#/)
- [github.com - Static Site Generators](https://github.com/collections/static-site-generators)
- [jamstack.org - Site Generators](https://jamstack.org/generators/)

## Produire des présentations

Il est aussi possible de **générer des slides en HTML** :

- [Marp (Markdown Presentation Ecosystem)](https://marp.app/#get-started)
- [reveal.js](https://revealjs.com/)
