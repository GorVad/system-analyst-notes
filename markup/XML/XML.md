# XML

## What is XML?
Extensible Markup Language (XML) is a markup language and file format for storing, transmitting, and reconstructing arbitrary data. It defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.  
XML example
```
<?xml version="1.0" encoding="UTF-8"?>

<bookstore>

<book>
  <title lang="en">Harry Potter</title>
  <price>29.99</price>
</book>

<book>
  <title lang="en">Learning XML</title>
  <price>39.95</price>
</book>

</bookstore>
```

## Why Use XML?
- XML plays an important role in many different IT systems.
- XML is often used for distributing data over the Internet.
- It is important (for all types of software developers!) to have a good understanding of XML.

## XML Schema (XSD)
_XML Schema is a vocabulary that allows you to annotate and validate XML documents._  
XML Schema example
```
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="note">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="to" type="xs:string"/>
      <xs:element name="from" type="xs:string"/>
      <xs:element name="heading" type="xs:string"/>
      <xs:element name="body" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

</xs:schema>
```


## XPath
_Xpath is query language that provides opportunity to get the value of needed attribute in the XML file_

All Xpath examples below based on XML example in _"What is XML"_

**Selecting Nodes**  
XPath uses path expressions to select nodes in an XML document. The node is selected by following a path or steps. The most useful path expressions are listed below:

|XPath Expression| Usage|
|---------------------|-----------|
|nodename|	Selects all nodes with the name "nodename"|
|/|	Selects from the root node|
|//|	Selects nodes in the document from the current node that match the selection no matter where they are|
|.	|Selects the current node|
|..	|Selects the parent of the current node|
|@|	Selects attributes|

In the table below we have listed some path expressions and the result of the expressions:

|Path Expression| 	Result                                                                                                                                        |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
|bookstore| 	Selects all nodes with the name "bookstore"                                                                                                   |
|/bookstore| 	Selects the root element bookstore <br/> **Note:** If the path starts with a slash ( / ) it always represents an absolute path to an element! |
|bookstore/book| 	Selects all book elements that are children of bookstore                                                                                      |
|//book| 	Selects all book elements no matter where they are in the document                                                                            |
|bookstore//book| 	Selects all book elements that are descendant of the bookstore element, no matter where they are under the bookstore element                  |
|//@lang	| Selects all attributes that are named lang                                                                                                     |

**Predicates**  
Predicates are used to find a specific node or a node that contains a specific value.  
Predicates are always embedded in square brackets.  
In the table below we have listed some path expressions with predicates and the result of the expressions:

|Path Expression|	Result|
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
|/bookstore/book[1]|	Selects the first book element that is the child of the bookstore element.|
|/bookstore/book[last()]|	Selects the last book element that is the child of the bookstore element|
|/bookstore/book[last()-1]|	Selects the last but one book element that is the child of the bookstore element|
|/bookstore/book[position()<3]|	Selects the first two book elements that are children of the bookstore element|
|//title[@lang]|	Selects all the title elements that have an attribute named lang|
|//title[@lang='en']|	Selects all the title elements that have a "lang" attribute with a value of "en"|
|/bookstore/book[price>35.00]|	Selects all the book elements of the bookstore element that have a price element with a value greater than 35.00|
|/bookstore/book[price>35.00]/title|	Selects all the title elements of the book elements of the bookstore element that have a price element with a value greater than 35.00|

**Selecting Unknown Nodes**  
XPath wildcards can be used to select unknown XML nodes.

|Wildcard	|Description|
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
|*|	Matches any element node|
 |@*|	Matches any attribute node|
|node()|	Matches any node of any kind|

In the table below we have listed some path expressions and the result of the expressions:

|Path Expression|	Result|
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
|/bookstore/*|	Selects all the child element nodes of the bookstore element|
|//*|	Selects all elements in the document|
|//title[@*]|	Selects all title elements which have at least one attribute of any kind|

**Selecting Several Paths**  
By using the | operator in an XPath expression you can select several paths.  
In the table below we have listed some path expressions and the result of the expressions:

| Path Expression        |	Result|
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| //book/title           | //book/price	Selects all the title AND price elements of all book elements|
| //title                | //price	Selects all the title AND price elements in the document|
|  /bookstore/book/title | //price	Selects all the title elements of the book element of the bookstore element AND all the price elements in the document|

## Sources
### Web
1. [W3C XML](https://www.w3.org/TR/xml/) [eng]
2. [W3School: XPath](https://www.w3schools.com/xml/xpath_intro.asp) [eng]
3. [W3School: XML Schema](https://www.w3schools.com/xml/schema_intro.asp)[eng]
4. [W3School: XSLT](https://www.w3schools.com/xml/xsl_intro.asp)[eng]

### Articles
1. [Microsoft: XML для начинающих](https://support.microsoft.com/ru-ru/office/xml-для-начинающих-a87d234d-4c2e-4409-9cbc-45e4eb857d44) [ru]
2. [Habr: Что такое XML](https://habr.com/ru/post/524288/) [ru]
3. [Код: Что такое XML](https://thecode.media/chto-takoe-xml/) [ru]
### Tool
1. [XPath Tester](https://codebeautify.org/Xpath-Tester)
2. [XML Validator](https://codebeautify.org/xmlvalidator)
3. [XSD/XML Schema Generator](https://www.freeformatter.com/xsd-generator.html)
4. [Random XML Data generator](https://codebeautify.org/generate-random-xml)

