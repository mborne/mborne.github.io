# MCP (Model Context Protocol)

MCP (Model Context Protocol) permet de standardiser la mise à disposition d'outils, de ressources et de prompts afin de faciliter l'intégration de fonctionnalité dans les agents s'appuyant sur des LLM.

## Points clés

- MCP permet la découverte des outils, ressources et prompts disponibles.
- MCP supporte plusieurs protocoles de communication ("Transports") pour la communication :
    - stdio (flux standards stdin/stdout)
    - HTTP
- Avec stdio, il n'est pas nécessaire de déployer un serveur HTTP.

## Quelques exemples

- [Time MCP Server](https://mcpservers.org/servers/modelcontextprotocol/time) avec `get_current_time(timezone)` permettant de répondre à "quelle heure est-il?"
- [ignfab/geocontext](https://github.com/ignfab/geocontext?tab=readme-ov-file#fonctionnalit%C3%A9s) est un POC exploitant les services et données de la Géoplateforme.

## Quelques catalogues

- [Model Context Protocol servers](https://github.com/modelcontextprotocol/servers?tab=readme-ov-file#model-context-protocol-servers) : liste de serveurs existants
- [glama.ai/mcp](https://glama.ai/mcp)
    - [glama.ai/mcp - recherche par mot clé "qgis"](https://glama.ai/mcp/servers?query=qgis)

## Quelques clients

IDE en mode agent :

- [Cursor - Protocole de contexte de modèle (MCP)](https://cursor.com/fr/docs/context/mcp)
- [Visual Studio Code - Use MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)
- [Claude Code - Connect Claude Code to tools via MCP](https://code.claude.com/docs/en/mcp)

Application Desktop :

- [Claude Desktop - Connect to local MCP servers](https://modelcontextprotocol.io/docs/develop/connect-local-servers)

Application WEB :

- [Open WebUI - Model Context Protocol (MCP)](https://docs.openwebui.com/features/mcp/)

Application en ligne de commande (CLI) :

- [fast-agent](https://fast-agent.ai/)

Bibliothèques :

- [langchain-mcp-adapters](https://docs.langchain.com/oss/python/langchain/mcp#model-context-protocol-mcp)

## Quelques frameworks

Pour développer son propre MCP :

- [mcp-framework.com - Quickstart](https://mcp-framework.com/docs/quickstart/)
- [fastmcp](https://github.com/jlowin/fastmcp#readme)

