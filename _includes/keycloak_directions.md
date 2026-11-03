
Set these four environmental variables. The values for `KEYCLOAK_CLIENT_ID` and `KEYCLOAK_CLIENT_SECRET` will be provided to you in your slack channel by course staff.

```bash
dokku config:set --no-restart <app-name> KEYCLOAK_ISSUER_URI=https://keycloak-qa.dokku-00.cs.ucsb.edu/realms/cs156-qa
dokku config:set --no-restart <app-name> KEYCLOAK_CLIENT_ID=<provided-value>
dokku config:set --no-restart <app-name> KEYCLOAK_CLIENT_SECRET=<provided-value>
dokku config:set --no-restart <app-name> QA=true
```
