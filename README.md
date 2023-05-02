# Setting up passwordless SSH for a series of machines

Assuming you have a personal computer and the IP addresses of several remote machines that your personal computer can access, the following steps will allow you to set up passwordless login for these machines. It is assumed that the local username is "you" and the remote username is "root".

Write the IP addresses of the remote machines, one per line, in a file named `ip_list.txt`.

## 1. Set up passwordless login between your personal computer and the remote machines
```
bash local_passwdless_login.sh
```

## 2. Modify SSH config
Since the local username "you" and the remote username "root" are different, you need to add the following configuration to your `~/.ssh/config` file, with a hostname for each IP address and set the login user to "root".

```
Host sv001
  HostName remote_ip1
  User root
Host sv002
  HostName remote_ip2
  User root
...
```

## 3. Set up passwordless login between the remote machines

You need to install Ansible first.

Edit the `hosts` file and add the hostnames as follows:
```
[sv]
sv001
sv002
```

Run the following command to set up passwordless login between all machines listed in `ip_list.txt`.
```
bash run.sh
```