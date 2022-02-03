# Kubernetes architecture

labs are here [https://github.com/ibm-developer-skills-network/CC201](https://github.com/ibm-developer-skills-network/CC201)

## container orchestration

Kubernetes:

* opensource
* countainer orchestration
* declarative management support (set desired states)
* has s growing ecosystem
* widely available

IT is not:

* platform as a service
* no limit to apps
* does not deploy source code or build applicatons
* does not prescribe logging, monitoring or alerting solution
* doesnt provide build-in middleware, DB, or other services

## Kubernetes objects

1. Labels and selectors

    1. labels

        * key/value pairs
        * intended for ID of objects
        * not unique
        * group objects

    2. selectors

        * id and select groups of objects
