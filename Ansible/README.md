Created keys to use with the automation user and distribute from control to node[1:4]. This is a throwaway key, do not use on any system you do not intend on destroying. Need to integrate into the Vagrantfile bootstrapper provided by rhce8env.

`ssh-keygen -t ecdsa -b 521`

Private Key
```
-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAArAAAABNlY2RzYS
1zaGEyLW5pc3RwNTIxAAAACG5pc3RwNTIxAAAAhQQBBTK/2SfbBXonYIVV2VW/IFwqWOxq
D5FtMBDMC+9TnT++d5a5wWomiIyyomKqtAKZnZK3i2F4KMgqZou/q7dGqKEBuuhSWgsNmx
civCUL4uCKHBSq4kUlE4qtKSoZM7DoTr39b29zGr+2ZOGq2q91t6JFXhV4cTsFGvqKydSB
ovj130AAAAEYpVwD/qVcA/4AAAATZWNkc2Etc2hhMi1uaXN0cDUyMQAAAAhuaXN0cDUyMQ
AAAIUEAQUyv9kn2wV6J2CFVdlVvyBcKljsag+RbTAQzAvvU50/vneWucFqJoiMsqJiqrQC
mZ2St4theCjIKmaLv6u3RqihAbroUloLDZsXIrwlC+LgihwUquJFJROKrSkqGTOw6E69/W
9vcxq/tmThqtqvdbeiRV4VeHE7BRr6isnUgaL49d9AAAAAQgDfID6v/ttc9uwNCflA7zy3
b40egqEYPnOxqy5IztBFOE0GrQohVeRSLurklSWqfJAxshnjaq6JgUNy1Z+9Ehz7TwAAAB
Zza3lsYXJATEFQVE9QLVQzUk00MjBVAQIDBA==
-----END OPENSSH PRIVATE KEY-----
```

Public Key
```
ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAEFMr/ZJ9sFeidghVXZVb8gXCpY7GoPkW0wEMwL71OdP753lrnBaiaIjLKiYqq0ApmdkreLYXgoyCpmi7+rt0aooQG66FJaCw2bFyK8JQvi4IocFKriRSUTiq0pKhkzsOhOvf1vb3Mav7Zk4arar3W3okVeFXhxOwUa+orJ1IGi+PXfQA== skylar@LAPTOP-T3RM420U
```