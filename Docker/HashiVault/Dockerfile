FROM photon:4.0

ENV VAULT_VERSION 1.4.0
RUN mkdir /vault
RUN tdnf install \
      sudo \
      unzip \
      bash \
      ca-certificates \
      wget

RUN wget --quiet --output-document=/tmp/vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /vault && \
    rm -f /tmp/vault.zip && \
    chmod +x /vault

ENV PATH="PATH=$PATH:$PWD/vault"
COPY ./config/vault.json /vault/config/vault-config.json
EXPOSE 8200
CMD vault server -config=/vault/config/vault-config.json