# JSON

## What is JSON?
- JSON stands for JavaScript Object Notation
- JSON is a lightweight data-interchange format
- JSON is plain text written in JavaScript object notation
- JSON is used to send data between computers
 -JSON is language independent

## Why Use JSON?
The JSON format is syntactically similar to the code for creating JavaScript objects. Because of this, a JavaScript program can easily convert JSON data into JavaScript objects.  
Since the format is text only, JSON data can easily be sent between computers, and used by any programming language.  
JavaScript has a built in function for converting JSON strings into JavaScript objects:  
```JSON.parse()```  
JavaScript also has a built in function for converting an object into a JSON string:  
```JSON.stringify()```

## [JSON Schema](https://json-schema.org/)
_JSON Schema is a vocabulary that allows you to annotate and validate JSON documents._  

JSON Schema example
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
Comands used in the example above:
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
_JSONPath is query language that provides opportunity to get the value of needed attribute in the JSON file_

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

Usage examples:
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

## Sources
### Web
1. [JSON.org](https://www.json.org/json-ru.html) [eng/ru]
2. [W3School.JSON](https://www.w3schools.com/js/js_json_intro.asp) [eng]
3. [JSON Schema](https://json-schema.org/)[eng]
### Articles
1. [MongoDB. JSON Schema examples](https://www.mongodb.com/basics/json-schema-examples) [eng]
2. [JSON Schema. Быть или не быть?](https://habr.com/ru/post/495766/) [ru]
3. [Introduction to JSON Schema](https://medium.com/swlh/an-introduction-to-json-schema-8eaea643fcda) [eng]
### Tool
1. [JSON Path tester](https://codebeautify.org/jsonpath-tester)
2. [JSON Fixer](https://codebeautify.org/json-fixer)
3. [JSON Schema generator](https://www.liquid-technologies.com/online-json-to-schema-converter)
4. [Random JSON data generator](https://codebeautify.org/json-generator)

