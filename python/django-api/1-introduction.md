## Introduction

#### What is an API?
An API (Application Programming Interface) is a formal way to describe two computers communicating directly with one another. And while there are multiple ways to build an API, web APIs— which allow for **the transfer of data over the world wide web**—are overwhelmingly structured in a RESTful (REpresentational State Transfer) pattern.

#### Advantages of seperating the front-end from the back-end
- It is arguably much more “future-proof” because a back-end API can be consumed by any JavaScript front-end. When the current
front-end frameworks are eventually replaced by even newer ones in the years to come, the back-end API can remain the same. No major rewrite is required.

- An API can support multiple front-ends written in different languages and frameworks. Consider that JavaScript is used for web front-ends, while Android apps require the Java programming language, and iOS apps need the Swift programming language. With a traditional monolithic approach, a Django website cannot support these various front-ends. But with an
internal API, all three can communicate with the same underlying database back-end!
