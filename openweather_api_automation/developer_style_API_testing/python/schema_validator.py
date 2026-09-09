import json
from jsonschema import validate
from jsonschema.exceptions import ValidationError

def validate_json_schema (response, schema_path):
    try:
        with open(schema_path, encoding="utf-8") as schema_file:
            schema = json.load(schema_file)

        validate(instance=response,schema=schema)
        return True

    except ValidationError as error:
        field_path = "".join(str(part) for part in error.absolute_path)
        location = field_path or "response root"
        raise AssertionError(
            f"schema validation failed at '{location}':{error.message}"
        ) from error

    except FileNotFoundError as error:
        raise AssertionError(
            f"schema file was not found: {schema_path}"
        ) from error