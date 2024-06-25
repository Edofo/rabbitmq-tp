# Projet : Implémentation d'un Système de Messagerie avec RabbitMQ

## Prérequis

- Node.js
- NestJS
- RabbitMQ
- Docker

## Installation

1. Clonez le repository :

```bash
  git clone https://github.com/edofo/intro-rabbitmq.git
  cd intro-rabbitmq
```

2. Installez les dépendances :

```bash
  npm i -g yarn
  yarn install
```

3. Lancez RabbitMQ via Docker :

```bash
  docker-compose up -d
```

4. Démarrez l'application NestJS :

```bash
  npm run start
```

## Utilisation en bash:

```bash
  chmod 755 ./scripts/user_requests.sh
  chmod 755 ./scripts/notif_requests.sh
```

### 1. Créer un Utilisateur

```bash
  ./scripts/user_requests.sh createUser <username> <email>
```

### 2. Envoyer une Notification

```bash
  ./scripts/notif_requests.sh sendNotification <message> <userId>
```

### 3. Récupérer les Notifications d'un Utilisateur

```bash
  ./user_requests.sh getUserNotifications <userId>
```

## Utilisation en requête HTTP:

### 1. Créer un Utilisateur

- **Méthode HTTP** : POST
- **URL** : `http://localhost:3000/users/create`
- **Body** :

```json
{
  "username": "john_doe",
  "email": "john.doe@example.com"
}
```

### 2. Envoyer une Notification

- **Méthode HTTP** : POST
- **URL** : `http://localhost:3000/notifications/send`
- **Body** :

```json
{
  "userId": "1",
  "message": "This is a test notification."
}
```

### 3. Récupérer les Notifications d'un Utilisateur

- **Méthode HTTP** : GET
- **URL** : `http://localhost:3000/users/1/notifications`

## Architecture du Système

### Composants Clés

1. **Producteurs** : Les endpoints de l'API qui envoient des messages à RabbitMQ.
2. **Consommateurs** : Les services qui récupèrent et traitent les messages depuis RabbitMQ.
3. **Files d'Attente** : Utilisées pour stocker les messages jusqu'à ce qu'ils soient consommés.
4. **Échanges** : Dirigent les messages vers les files d'attente appropriées en fonction des critères de routage.
