![Quassel IRC Logo](https://quassel-irc.org/files/bluemarine_logo.png)

Quassel IRC is a modern, cross-platform, distributed IRC client, meaning that one (or multiple) client(s) can attach to and detach from a central core -- much like the popular combination of screen and a text-based IRC client such as WeeChat, but graphical. In addition to this unique feature, we aim to bring a pleasurable, comfortable chatting experience to all major platforms (including Linux®, Windows®, and MacOS X® as well as Android smartphones), making communication with your peers not only convenient, but also ubiquitous available.

# Features
- Build with [Blowfish Encryption](https://bugs.quassel-irc.org/projects/quassel-irc/wiki/Blowfish_Encryption_Manual) Support
- Generates an Self-Signed SSL Certificate
- LDAP Support
- SQLite Support
- PostgreSQL Support
- Build from Source [[Quassel](https://github.com/quassel/quassel)]

# Attention
This are my first steps with own docker container. As inspiration i look at the dockerfile from [Linuxserver's Quassel-Core](https://github.com/linuxserver/docker-quassel-core) but build it with Ubuntu and add the missing **Encryption support**!

# Usage

```
docker create \
  --name=quassel-core \
  -p 4242:4242 \
  -v <yourpath>:/config \
  --restart unless-stopped \
keinnerd/quasselcore
```

After you start the Container Quassel will listen on `YourIP:4242`. Connect with Quassel Client to the Quassel-Core and finish your setup.

# Changelog
16.11.2019 - Initial Release
