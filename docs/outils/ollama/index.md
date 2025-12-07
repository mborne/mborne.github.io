# Ollama

## Points clés

[Ollama](https://ollama.com/) permet d'utiliser localement [plusieurs grands modèles de langage (LLM)](https://ollama.com/search) :

- [Sous forme d'une API CLI](https://docs.ollama.com/quickstart) (en lignes de commande)

```bash
ollama run llama3.2
```

![Illustration de l'utilisation de Ollama](img/ollama-cli.png)

- [Sous forme d'une API REST/JSON](https://docs.ollama.com/api/introduction) :

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "llama:3.2",
  "prompt": "Donne moi une définition courte d'un LLM"
}'
```

## Quelques modèles

Avec un GPU disposant de 6Go de RAM (RTX 3060), les modèles suivants fonctionnent de manière fluide :

- [llama3.2:3b](https://ollama.com/library/llama3.2) (Facebook)
- [gemma3:4b](https://ollama.com/library/gemma3) (Google)
- [mistral:7b](https://ollama.com/library/mistral)

## Ressources

Officielles :

- [https://ollama.com](https://ollama.com/) est le site officiel
- [https://ollama.com/search](https://ollama.com/search) présente la liste des modèles disponibles
- [docs.ollama.com](https://docs.ollama.com/) est le site de documentation
    - [docs.ollama.com - quickstart](https://docs.ollama.com/quickstart) décrit l'utilisation en ligne de commande (`ollama run <model_name>`).
    - [docs.ollama.com - API Reference](https://docs.ollama.com/api/introduction) présente l'API REST/JSON.

Personnelles :

- [mborne/docker-devbox - ollama](https://github.com/mborne/docker-devbox/tree/master/ollama#readme) : installation avec Docker
