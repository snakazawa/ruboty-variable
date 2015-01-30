# Ruboty::Variable

An Ruboty Handler + Actions to ruboty-variable.

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-variable'
```

And then execute:

    $ bundle

## Commands

|Command|Pattern|Description|
|:--|:--|:--|
|[set_value](#set_value)|/var set (?\<key\>\\S+?) (?\<value\>\\S+?)\z/|Set value|
|[get_value](#get_value)|/var get (?\<key\>\\S+?)\z/|Get value|
|[delete_value](#delete_value)|/var delete (?\<key\>\\S+?)\z/|Delete value|
|[list_values](#list_values)|/var list\z/|Show values list|
|[array_init](#array_init)|/var array init (?\<key\>\\S+?)\z/|Create empty array or clear array|
|[array_push](#array_push)|/var array push (?\<key\>\\S+?) (?\<values\>.+?)\z/|Push values to array|
|[array_remove](#array_remove)|/var array remove (?\<key\>\\S+?) (?\<values\>.+?)\z/|Remove values from array|

## Usage
### set_value
* Set value

~~~
> ruboty var set hoge 3
Set 3 to hoge
~~~

### get_value
* Get value

~~~
> ruboty var set hoge 3
Set 3 to hoge
> ruboty var get hoge
3
~~~

### delete_value
* Delete value

~~~
> ruboty var set hoge 3
Set 3 to hoge
> ruboty var delete hoge
Deleted hoge
~~~

### list_values
* Show values list

~~~
> ruboty var set hoge 3
Set 3 to hoge
> ruboty var set piyo piyo_value
Set piyo_value to piyo
> ruboty var list
key,   type     value
hoge - string - 3
piyo - string - piyo_value
~~~

### array_init
* Create empty array or clear array

~~~
> ruboty var array init ary
Created ary empty array
> ruboty var list
key,   type    value
ary - array - []
~~~

### array_push
* Push values to array

~~~
> ruboty var array init ary
Created ary empty array
> ruboty var array push ary one
Push one to ary
> ruboty var array push ary two three
Push two to ary
Push three to ary
> ruboty var list
key,   type    value
ary - array - ["one", "two", "three"]
~~~

### array_remove
* Remove values from array

~~~
> ruboty var array init ary
Created ary empty array
> ruboty var array push one two three
Undefined one
> ruboty var array push ary one two three
Push one to ary
Push two to ary
Push three to ary
> ruboty var array remove ary one two
ary already included one
ary already included two
> ruboty var list
key,   type    value
ary - array - ["one", "two", "three"]
~~~

## ENV

|Name|Description|
|:--|:--|
|||

## Dependency

|Name|Description|
|:--|:--|
|||

## Contributing

1. Fork it ( https://github.com/snakazawa/ruboty-variable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
