# Back-end

## Directory Structure

```shell
.
├── config
├── src
│   ├── entity        # Models
│   ├── migration     # Database migrations
│   ├── index.ts      # Entry point
│   └── routes.ts     # Routes
├── tests             # Unit tests
├── .env              # Environment variable
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
