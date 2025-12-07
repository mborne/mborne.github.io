# Hugging Face

Hugging Face est une plateforme utilisée par la communauté du machine learning pour héberger des modèles, des jeux de données et des applications.

## Pré-requis

- Python est le langage utilisé dans les exemples
- [Installer PyTorch avec CUDA](https://pytorch.org/get-started/locally/) sera rapidement nécessaire.

## Text Generation

Du côté d'[Hugging Face](https://huggingface.co/), on retrouve les LLM dans catégorie ["Text Generation"](https://huggingface.co/models?pipeline_tag=text-generation). Par exemple, nous trouvons le [modèle Llama 3.2 de Facebook](https://huggingface.co/meta-llama/Llama-3.2-3B) avec :

- [Les données du modèle](https://huggingface.co/meta-llama/Llama-3.2-3B/tree/main) (les fichiers [.safetensors](https://huggingface.co/docs/text-generation-inference/conceptual/safetensors) correspondent aux poids du réseau de neurones).
- [Un exemple de code Python](https://huggingface.co/meta-llama/Llama-3.2-3B#use-with-transformers) illustrant la génération d'un texte.

## Ressources

- [https://huggingface.co](https://huggingface.co): Le site officiel
- [https://huggingface.co/models](https://huggingface.co/models) : Les modèles disponibles avec un filtrage par catégorie.
- [https://huggingface.co/datasets](https://huggingface.co/datasets) : Les jeux de données
- [https://huggingface.co/spaces](https://huggingface.co/spaces) : Les applications développées à l'aide de [Gradio](https://www.gradio.app/).
