ndenv Cookbook
==============

Description
------------
Manages nbenv and its installed node.js.

Requirements
------------
- `build-essential`

Installation
------------
Depending on the situation and use case there are several ways to install this cookbook.
All the methods listed below assume a tagged version release is the target, but omit the tags to get the head of development.
A valid Chef repository structure like the [opscode/chef-repo](https://github.com/opscode/chef-repo) repo is also assumed.

#### Using Berkshelf
[Berkshelf](http://berkshelf.com/) is a cookbook dependency manager and development workflow assistant.

To install Berkshelf:

```shell
gem install berkshelf
berkshelf init .
```

Berkshelfile:

```ruby
source "https://api.berkshelf.com"

cookbook 'ndenv', git: 'git://github.com/mostlyfine/chef-ndenv.git'
```


Attributes
----------

#### ndenv::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ndenv']['user']</tt></td>
    <td>String</td>
    <td>author user name</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['ndenv']['group']</tt></td>
    <td>String</td>
    <td>author group name</td>
    <td><tt>ndenv</tt></td>
  </tr>
  <tr>
    <td><tt>['ndenv']['members']</tt></td>
    <td>Array</td>
    <td>group members</td>
    <td><tt>['root']</tt></td>
  </tr>
  <tr>
    <td><tt>['ndenv']['ndenv_root']</tt></td>
    <td>String</td>
    <td>ndenv install directory</td>
    <td><tt>/usr/local/ndenv</tt></td>
  </tr>
  <tr>
    <td><tt>['ndenv']['profile_path']</tt></td>
    <td>String</td>
    <td>add `ndenv` init to your shell to enable shims.</td>
    <td><tt>/etc/profile.d</tt></td>
  </tr>
  <tr>
    <td><tt>['ndenv']['build']</tt></td>
    <td>Array</td>
    <td>node.js versions to builded.</td>
    <td><tt>['v0.10.20']</tt></td>
  </tr>
  <tr>
    <td><tt>['ndenv']['global']</tt></td>
    <td>String</td>
    <td>set global this node.js version.</td>
    <td><tt>'v0.10.20'</tt></td>
  </tr>
</table>

Usage
----------
#### ndenv::default
Create user, group and checkout for repository.
Just include `ndenv` in your node's `run_list`:
```json
{
  "run_list": [
    "recipe[ndenv]"
  ]
}
```

#### ndenv::install
Build node.js and set default version.
```json
{
  "run_list": [
    "recipe[ndenv::install]"
  ]
}
```

```json
{
  "ndenv": {
    "user": "taro",
    "ndenv_root": "/home/taro/.ndenv",
    "profile_path": "/home/taro/.ndenv"
  },
  "run_list": [
    "recipe[ndenv::default]"
    "recipe[ndenv::install]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
MIT, Authors: mostlyfine
