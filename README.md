# Apigee access token scripts VVV utility

A VVV utility that adds Apigee access token scripts.

You can read more on them on the [official Apigee documentation page](https://docs.apigee.com/api-services/content/using-oauth2-security-apigee-edge-management-api).

## Usage

In your `vvv-customy.yml` file add under `utilities`:

```yml
utilities:
  core:
    - memcached-admin
    - opcache-status
    - phpmyadmin
    - webgrind
  apigee-access:
    - apigee-access
utility-sources:
  apigee-access: https://github.com/dingo-d/apigee-vvv-utility
```

The `core` utilities are there by default, and `apigee-access` doesn't depend on them.

Once you add it, be sure you re-provision your VVV with vagrant reload --provision`.

