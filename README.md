# README

### First time setup

Ruby version 3.2.2
Postgres version 15

Navigate to the project root and run:

```bash
bin/setup
```

After complete, run:

```bash
EDITOR=sed bin/rails credentials:edit --environment development
```

Add a `.env` file to the project root. See sample env below.

Start the development server:

```bash
bin/dev
```

### Sample env for development

```text
PROCORE_KEY=<CLIENT_ID>
PROCORE_SECRET=<CLIENT_SECRET>
OAUTH_URL=https://login.procore.com
BASE_URL=https://api.procore.com
REDIRECT_URI=http://localhost:3000/auth/procore/callback
SECRET_KEY_BASE=<bin/rails secret>
```
