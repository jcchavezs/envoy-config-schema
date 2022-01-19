# Envoy config schema

This repository generates JSON schemas from the envoy proto configurations. This is useful to do validations on config for example on IDE or pin pointing errors in the config in the jsonschema fashion.

**Check the [releases page](https://github.com/jcchavezs/envoy-config-schema/releases) to the schemas per envoy's version**

## Versioning

This repo should follow the same versioning as the envoyproxy/envoy repository and also dependencies should follow the same versions as in https://github.com/envoyproxy/envoy/blob/v1.21.0/api/bazel/repository_locations.bzl

## Examples

Generated files can be now used to validate schema on IDEs like vscode (using extensions like https://github.com/redhat-developer/vscode-yaml)

```json
{
    //...
    "yaml.schemas": {
        "https://github.com/jcchavezs/envoy-config-schema/releases/download/v1.21.0/v3_Bootstrap.json": "envoy-config.yaml"
    }
}
```
