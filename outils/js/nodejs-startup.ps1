# configurer l'environnement fnm
fnm env --use-on-cd | Out-String | Invoke-Expression
# télécharger et installer Node.js
fnm use --install-if-missing 24

