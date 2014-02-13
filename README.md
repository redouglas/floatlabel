Floatlabel
==========

A jQuery plugin that implements the Float Label Pattern and aims to be as semantic and accessible as possible.
Inspired by: http://bradfrostweb.com/blog/post/float-label-pattern/

Written using harp, coffeescript, and stylus.

Demo
====
See the example folder


Usage
=====

* Include jQuery & the javascript
* Include the css and optional aesthetic styles
* Add class 'floatlabel' to the input or textarea that you'd like (```floatlabelform()``` requires this to work!)
* Set up your DOM as per usual. Must have equivolent ```for```s on labels and ```id```s on inputs/textareas


To instantiate  a single field:
```
$('#input').floatlabel()
```
To instantiate an entire form:
```
$('form').floatlabelform()
```
