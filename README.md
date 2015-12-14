# helloworld-cookbook

TODO: This will installl and configure hello world application

## Supported Platforms

TODO: Ubuntu 14.4

## Attributes

<table>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>default["sinatra"]["ip"]</tt></td>
    <td>String</td>
    <td>IP address on which hello world should run</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  
  <tr>
    <td><tt>default["sinatra"]["listener"]</tt></td>
    <td>Integer</td>
    <td>TCP port on which Hello world will be running</td>
    <td><tt>4567</tt></td>
  </tr>
   <tr>
    <td><tt>default["helloworld"]["directory"]/tt></td>
    <td>String</td>
    <td>Directory on which the hello world app will be copied</td>
    <td><tt>/production/helloworld/</tt></td>
  </tr>
</table>

## Usage

### helloworld::default

Include `helloworld` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[helloworld::default]"
  ]
}
```

## License and Authors
### Status
[![Build Status](https://travis-ci.org/sumeshkanayi/sumesh-cookbooks.svg?branch=master)]
Author:: sumeshkanayi (<sumeshkanayi@gmail.com>)
