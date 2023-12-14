# Limiting data
To limit the data while testing heavy models we can use some jinja templating syntax to only apply logic to specific environments. This way, production can have all the data, while for testing purposes we can limit to for example a single year.

## Applying filters
```sql
...
SELECT * FROM model
...

-- Apply conditional filter
{% if target.name == 'dev' %}
WHERE year(order_date) = 2021
{% endif %}
```

Make sure to also set the target to the same value in the profiles.yml file.
