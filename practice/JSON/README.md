# Данный раздел создан для практики работы с JSON

## [JSON Schema](https://json-schema.org/)
_Описание структуры JSON файла_

Пример JSON Schema
```
{
    "$schema": "http://json-schema.org/draft-04/schema#",
    "$id": "https://example.com/employee.schema.json",
    "title": "Record of employee",
    "description": "This document records the details of an employee",
    "type": "object",
    "properties": {
        "id": {
            "description": "A unique identifier for an employee",
            "type": "number"
        },
        "name": {
            "description": "Full name of the employee",
            "type": "string"
        },
        "age": {
            "description": "Age of the employee",
            "type": "number"
        },
        "hobbies": {
            "description": "Hobbies of the employee",
            "type": "object",
            "properties": {
                "indoor": {
                    "type": "array",
                    "items": {
                        "description": "List of indoor hobbies",
                        "type": "string"
                    }
                },
                "outdoor": {
                    "type": "array",
                    "items": {
                        "description": "List of outdoor hobbies",
                        "type": "string"
                    }
                }
            }
        }
    }
}
```
Используемые в примере команды:
- **$schema:** States that this schema complies with v4 of the IETF standard
- **$id:** Defines the base URI to resolve other URI references within the schema.
- **title:** Describes the intent of the schema.
- **description:** Gives the description of the schema.
- **type:** Defines the type of data.
- **properties:** Defines various keys and their value types within a JSON document.
- **minimum:** Defines the minimum acceptable value for a numeric datatype.
- **items:** Enumerates the definition for the items that can appear in an array.
- **minItems:** Defines the minimum number of items that should appear in an array.
- **uniqueItems:** Enforces if every item in the array should be unique relative to one another.
- **required:** Lists the keys that are required and mandatory.

## JSON Path
_Написание путей до необходимых объектов внутри JSON_

|JSONPath| Usage|
|------------|-----------|
|$| the root object/element|
|@| the current object/element|
|. or []| child operator|
|..| recursive descent. JSONPath borrows this syntax from E4X.|
|*| wildcard. All objects/elements regardless their names.|
|[]| 	subscript operator. XPath uses it to iterate over element collections and for predicates. In Javascript and JSON it is the native array operator.|
|?()| applies a filter (script) expression.|
|()| script expression, using the underlying script engine.|

Примеры использования:
1. Select the document node

```$.```

2. Select the 'employees' element

```$.employees```

3. Select all 'employee' elements that are direct children of the 'employees' element

```$.employees.employee```

4. Select all 'id' elements regardless of their positions in the document

```$.employees.employee['*'].id```

6. Select the 'id' attributes of the 'employee' elements with their positions in the document

```$.employees.employee[1].id```