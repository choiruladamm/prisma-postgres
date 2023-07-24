# SIMPLE CRUD REST API
Build Databases Using Prisma.IO | Typescript | Node.js 

## On This Repo

- Set up Typescript Project
- Prisma Schema - how to create Prisma Client, migrate, models
- Prisma Relations and Prisma Fields
- Built simple CRUD Application using Prisma and Node.js

## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

```bash
DATABASE_URL="postgresql://postgres:admin@localhost:5432/prisma_crud_ts?schema=public"
```
Migrate database

```bash
npx prisma migrate dev
```

## List Endpoint
- get all user: http://localhost:3333/api/users
- get user by id: http://localhost:3333/api/users/:id
- create user: http://localhost:3333/api/users/create
- update user: http://localhost:3333/api/users/:id
- delete user: http://localhost:3333/api/users/:id