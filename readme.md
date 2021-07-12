[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/cafemagico)

# ✨ VPN Client Kerio + Privoxy ✨

### Step #1 - Getting your kerio config file

`Be sure to run it at the root of the project.`

```
$ docker run -it --rm -v $(pwd)/kerio-kvc.conf:/etc/kerio-kvc.conf jarri1999/kerio-client-generate-config
```

##### Output: &nbsp;&nbsp; kerio-kvc.conf

#

```
<config>
  <connections>
    <connection type="persistent">
      <server>vpn.domain.com</server>
      <port>4090</port>
      <username>USERNAME</username>
      <password>XOR:0123456789</password>
      <fingerprint>0A:1B:2C:3D:0A:1B:2C:3D:0A:1B:2C:3D</fingerprint>
      <active>1</active>
    </connection>
  </connections>
</config>
```

### Step #2 - Run VPN + Proxy

```
$ docker-compose up -d
```

### Step #3 - Test it ✨

```
$ curl --proxy http://127.0.0.1 https://api.ipify.org
$ >>> Some amazing IP
```
