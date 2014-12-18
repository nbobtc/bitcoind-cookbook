# bitcoind-cookbook

This cookbook will install a [Bitcoin](https://bitcoin.org) node. You can also
enable or disable the wallet ability. By disabling the wallet you will have
a seed node that can be used to connect to.

This is a cookbook that I use to setup seed nodes and other services that
require a bitcoin node.

## Supported Platforms

- ubuntu

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['bitcoind']['install_via']</tt></td>
    <td>enum</td>
    <td>`package` or `source` I recommend you use `package`.</td>
    <td><tt>package</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['bin']</tt></td>
    <td>string</td>
    <td>Location of executable</td>
    <td><tt>/usr/bin/bitcoind</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['user']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>bitcoin</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['group']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>bitcoin</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['piddir']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>/var/run/bitcoind</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['pidfile']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>/var/run/bitcoind/bitcoind.pid</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['configfile']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>/etc/bitcoin/bitcoin.conf</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['datadir']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>/var/lib/bitcoind</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['wallet']['enabled']</tt></td>
    <td>boolean</td>
    <td></td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['conf']['template']</tt></td>
    <td>string</td>
    <td></td>
    <td><tt>bitcoin.conf.erb</tt></td>
  </tr>
  <tr>
    <td><tt>['bitcoind']['conf']['options']</tt></td>
    <td>hash</td>
    <td>Configures the options that are put into the bitcoin.conf file.</td>
    <td><tt>{}</tt></td>
  </tr>
</table>

## Usage

Create a testnet node:

```json
{
    "bitcoind": {
        "conf": {
            "options": {
                "testnet": 1
            }
        }
    }
}
```

You can see various options that can go into the configuration file at
https://en.bitcoin.it/wiki/Running_Bitcoin#Sample_Bitcoin.conf

### bitcoind::default

Include `bitcoind` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[bitcoind::default]"
  ]
}
```

## License and Authors

Author:: Joshua Estes (<Joshua@dSpaceLabs.com>)
