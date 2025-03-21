
# Utiliser une image de base officielle
FROM ubuntu:20.04

# Définir le mode non interactif pour éviter les questions lors de l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Mettre à jour et installer des dépendances
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    git \
    vim \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Installer VSCode CLI (code command)
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vscode.list && \
    apt-get update && apt-get install -y code

# Exposer un port (optionnel, selon les besoins)
EXPOSE 8080

# Commande par défaut pour démarrer le terminal
CMD ["/bin/bash"]
