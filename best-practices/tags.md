# Tags
Tags can be used to identify parts of the dbt model and select those for dbt commands. They can be very useful to define which parts of the model should be part of the daily flow or should be run manually by giving them the respective tags.

## Tagging models
Models can be tagged from the dbt_project.yml file on folder level, or from the model sql files for singular models.

### Folder level
Add the following line to the model subdirectory yml.
```yml
models:
  project_name:
    folder_name:
      tags: <space_separated tag_names>

```

### Single model level
To set the tag for a single model, add it to the config macro just like the materialization setting.

```jinja
<!-- Single tag -->
{{ config(tags="nightly") }}

<!-- Multiple tags -->
{{ config(tags=["nightly", "example"]) }}
...
```


## Using tag selectors
```sh
# dbt run --models tag:<tag_name>

# For example your nightly runs:
dbt run --models tag:nightly
```