# Back-end

## Directory Structure

```shell
.
├── config
├── src
│   ├── entity        # Models
│   ├── migration     # Database migrations
│   └── index.ts      # Entry point
├── tests             # Unit tests
├── .env.example      # Environment variable example for production
└── ormconfig.json    # Default TypeORM configuration
```

## Installation

```shell
npm install
```

## Migration

```shell
# Run migration
npm run typeorm migration:run

# Revert migration
npm run typeorm migration:revert
```

## Endpoints

### Plant

#### `GET` /plants

> Responses

| Code | Return         |
| ---- | -------------- |
| 200  | `Array<Plant>` |

### UserPlant

#### `GET` /user-plants

> Responses

| Code | Return             | Description    |
| ---- | ------------------ | -------------- |
| 200  | `Array<UserPlant>` | UserPlant 전체 |

#### `GET` /user-plants/:id

> Parameters

| Key | Value          | Description  |
| --- | -------------- | ------------ |
| id  | `string(uuid)` | UserPlant id |

> Responses

| Code | Return      | Description            |
| ---- | ----------- | ---------------------- |
| 200  | `UserPlant` | id값과 일치하는 데이터 |
