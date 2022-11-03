# YAML

## What is YAML?
YAML is a human-readable data-serialization language.  
YAML example
```
---
receipt:     Oz-Ware Purchase Invoice
date:        2012-08-06
customer:
    first_name:   Dorothy
    family_name:  Gale

items:
    - part_no:   A4786
      descrip:   Water Bucket (Filled)
      price:     1.47
      quantity:  4

    - part_no:   E1628
      descrip:   High Heeled "Ruby" Slippers
      size:      8
      price:     133.7
      quantity:  1

bill-to:  &id001
    street: |
            123 Tornado Alley
            Suite 16
    city:   East Centerville
    state:  KS

ship-to:  *id001

specialDelivery:  >
    Follow the Yellow Brick
    Road to the Emerald City.
    Pay no attention to the
    man behind the curtain.
...
```

## Why Use YAML?
It is commonly used for configuration files and in applications where data is being stored or transmitted. YAML targets many of the same communications applications as Extensible Markup Language (XML) but has a minimal syntax which intentionally differs from SGML.

## Sources
### Web
1. [YAML](https://yaml.org/) [eng]
2. [Wikipedia. YAML](https://en.wikipedia.org/wiki/YAML) [eng]
### Articles
1. [YAML Syntax](https://learn.getgrav.org/16/advanced/yaml) [eng]
2. [What is YAML and How it works? An Overview and Its Use Cases](https://www.devopsschool.com/blog/what-is-yaml-and-how-it-works-an-overview-and-its-use-cases/) [eng]
3. [What is YAML?](https://www.redhat.com/en/topics/automation/what-is-yaml) [eng]
