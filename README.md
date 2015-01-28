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
|[set_value](#usage)|/var (?\<key\>\\S+?) (?\<value\>\\S+?)z/|Set value|
|[get_value](#usage)|/var (?\<key\>\\S+?)z/|Get value|

## Usage
* Set value and get value

~~~
> ruboty var hoge 3
Set 3 to hoge
> ruboty var hoge
3
> ruboty var piyo
Undefined piyo
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
