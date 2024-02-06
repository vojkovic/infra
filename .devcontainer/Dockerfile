# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.202.3/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye or stretch on local arm64/Apple Silicon): bullseye, buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive 
RUN apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl 
RUN mkdir -p -m 755 /etc/apt/keyrings
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN curl https://baltocdn.com/helm/signing.asc | apt-key add - 
RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
RUN echo "deb https://baltocdn.com/helm/stable/debian/ all main" > /etc/apt/sources.list.d/helm-stable-debian.list 
RUN apt-get update && apt-get install -y --no-install-recommends kubectl helm 
RUN curl -L -s https://github.com/helmfile/helmfile/releases/download/v0.161.0/helmfile_0.161.0_linux_amd64.tar.gz | tar xvzf - -C /usr/bin helmfile 
RUN curl -L -s https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz | tar xvzf - -C /usr/bin k9s 
RUN chmod +x /usr/bin/helmfile /usr/bin/k9s 
RUN wget -q https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb -O /tmp/sops.deb 
RUN dpkg -i /tmp/sops.deb
RUN helm plugin install https://github.com/databus23/helm-diff
RUN helm plugin install https://github.com/futuresimple/helm-secrets