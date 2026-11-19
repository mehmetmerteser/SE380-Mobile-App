# Constructly Firestore schema

This document records the first database design for the Constructly MVP.

## Collections

### `users/{userId}`

- `name`: display name
- `email`: account e-mail
- `role`: `admin` or `worker`
- `projectIds`: projects visible to the user

### `projects/{projectId}`

- `name`, `location`
- `memberIds`: authorized users
- `budget`
- `createdAt`

Each project contains the following subcollections:

- `apartments`: apartment/block, floor, status and budget data
- `financialRecords`: general costs, supplier payments and worker wages
- `supplierDebts`: total, paid and remaining supplier balances
- `workerPayments`: work period, daily wage, work days and payment status

## Access model

Authenticated project members can read project information. Only administrators
can write project, apartment and financial data in the first MVP. A user cannot
promote their own role. These constraints are represented in `firestore.rules`.

## Pending live configuration

Run `flutterfire configure` with the team's real Firebase project before enabling
Firebase initialization in `main.dart`. Do not commit service-account keys,
passwords, signing keys or local environment files.
