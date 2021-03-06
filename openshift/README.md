# Simi and Simi Schemareader

## Install or update in Openshift

Checkout or pull this repository

Create the following two secret YAML files locally, in a directory outside the checked out Git repository. Replace the xy placeholders with the appropriate values.

**Heads up** You have to replace the xy value for *CUBA_DATASOURCE_HOST* with the environment specific value.

Then, in each environment (test, integration, production).
```
oc create -f FILENAME
```

simi-db-credentials.yaml
```
apiVersion: v1
kind: Secret
metadata:
  name: simi-db-credentials
  labels:
    app: simi
type: Opaque
stringData:
  CUBA_DATASOURCE_USERNAME: xy
  CUBA_DATASOURCE_PASSWORD: xy
  CUBA_DATASOURCE_JDBCURL: xy
```

simi-ldap-credentials.yaml
```
apiVersion: v1
kind: Secret
metadata:
  name: simi-ldap-credentials
  labels:
    app: simi
type: Opaque
stringData:
  CUBA_WEB_LDAP_URLS: xy
  CUBA_WEB_LDAP_BASE: xy
  CUBA_WEB_LDAP_USER: xy
  CUBA_WEB_LDAP_PASSWORD: xy
  CUBA_WEB_LDAP_USERLOGINFIELD: xy
```

simi-schemareader-db-credentials.yaml
```
apiVersion: v1
kind: Secret
metadata:
  name: simi-schemareader-db-credentials
  labels:
    app: simi-schemareader
type: Opaque
stringData:
  SPRING_APPLICATION_JSON: "{'dbs':[{'key':'edit','url':'jdbc:postgresql://localhost:5432/edit_datenbank','user':'xy','pass':'xy'},{'key':'pub','url':'jdbc:postgresql://localhost:5432/pub_datenbank','user':'xy','pass':'xy'}]}"
```

Deploy in Test environment

Login from inside the network of canton of Solothurn with

(Installation oc-tool => https://github.com/sogis/dok/blob/dok/dok_betrieb/Documents/openshift/openshift.md#administration-der-applikationen-in-openshift)

```
oc login https://ocp-console.so.ch
```

Credentials are the same as for Desktop 2016

Then execute the following command:

```
oc process -f simi_schemareader.yaml \
  --param-file=simi_schemareader.env \
  | oc apply -n gdi-test -f -

oc process -f simi.yaml \
  --param-file=simi-test.env \
  | oc apply -n gdi-test -f -
```
