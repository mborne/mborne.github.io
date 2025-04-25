# TP de prise en main de Vagrant

## Pré-requis

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](README.md#installation)

Si besoin d'utiliser un proxy sortant (pas nécessaire à l'ENSG):

* Installer le [plugin vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf?tab=readme-ov-file#proxy-configuration-plugin-for-vagrant) :

```bash
vagrant plugin install vagrant-proxyconf
```

* [Configurer au besoin les variables d'environnement pour le proxy](https://mborne.github.io/fiches/proxy-sortant/proxy-env-vars/) 

## Créer un fichier Vagrantfile

Les commandes ci-après illustre la création d'un fichier [vagrant/helloworld/Vagrantfile](helloworld/Vagrantfile) :

```bash
# on créé un dossier pour le projet
mkdir ~/vagrant-helloworld
# on se place dans le projet
cd ~/vagrant-helloworld
# Générer un modèle de Vagrantfile
vagrant init ubuntu/focal64
```

### Adapter la configuration

Le fichier [Vagrantfile](helloworld/Vagrantfile) généré est commenté. Il pourra être adapté comme suit :

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "helloworld"

  #--------------------------------------------------------
  # Passage de HTTP_PROXY, HTTPS_PROXY,... à la VM
  # avec le plugin vagrant-proxyconf
  #--------------------------------------------------------
  if Vagrant.has_plugin?("vagrant-proxyconf")
    if ENV["http_proxy"]
      puts "http_proxy: " + ENV["http_proxy"]
      config.proxy.http   = ENV["http_proxy"]
    end
    if ENV["https_proxy"]
      puts "https_proxy: " + ENV["https_proxy"]
      config.proxy.https  = ENV["https_proxy"]
    end
    if ENV["no_proxy"]
      config.proxy.no_proxy = ENV["no_proxy"]
    end
  else
    puts "proxy not configured (use 'vagrant plugin install vagrant-proxyconf')"
  end

  #--------------------------------------------------------
  # Ajout d'une IP fixe avec un réseau privé
  # (le même que vagrantbox)
  #--------------------------------------------------------
  config.vm.network "private_network", ip: "192.168.50.101"

  #--------------------------------------------------------
  # Personnalisation de la VM VirtualBox
  #--------------------------------------------------------
  config.vm.provider "virtualbox" do |vb|
    vb.name = "helloworld"
    vb.memory = "1024"
    # vb.gui = true
  end

  #--------------------------------------------------------
  # Exécution d'un script d'initialisation
  # (dans cours-devops, nous traitons plutôt avec ansible)
  #--------------------------------------------------------
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
```

## Démarrer la VM

```bash
vagrant up
```

## Problèmes possibles

* Sous ubuntu, la plage IP correspondante devra être autorisée via le fichier `/etc/vbox/networks.conf`. S'il est absent, ajouter le contenu suivant :

```
* 192.168.50.0/24
```

* Sous windows, la création du réseau privé virtual (`192.168.50.0/24`) avant affectation de l'IP `192.168.50.101` demandera des droits administrateurs.


## Installer manuellement le serveur web nginx

```bash
# Se connecter à la VM
vagrant ssh
# Puis dans la VM
sudo apt-get update
sudo apt-get install nginx
```

## Vérifier l'accès à nginx

Depuis l'hôte de la VM, nous aurons normalement accès http://192.168.50.101

## Supprimer la VM

```bash
vagrant destroy
```