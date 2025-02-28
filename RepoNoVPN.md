# Accessing Repo Without UQ VPN
> [!IMPORTANT]
> This is an unofficial guide for accessing your repo without the need of UQ VPN. It is not endorsed nor supported by course staff, and I am not responsible for any damage caused by follwoing this unofficial guide.

This assumes that you're on a Windows 10+ computer or some UNIX-alike OS (e.g., macOS or Linux) where you have access to the `ssh` command. Proxy jump through moss will be used instead of the UQ VPN.

## Setting Up SSH Config
- Create the file `~/.ssh/config` (macOS or Linux) or `%userprofile%\.ssh\config` (Windows) if it doesn't already exist.
- Add the following lines (`sXXXXXXX` being your username and `<path-to-your-EAIT-ssh-private-key>` being the location of your private key for accessing moss):
```
Host moss
    Hostname moss.labs.eait.uq.edu.au
    User sXXXXXXX
    IdentityFile <path-to-your-EAIT-ssh-private-key>
    ForwardAgent yes

Host csse3010-gitea.zones.eait.uq.edu.au
    Hostname csse3010-gitea.zones.eait.uq.edu.au
    ProxyJump moss
```
- Save the file.

## Cloning Your Repo
- Open a command prompt or terminal.
- Change to the appropiate directory.
  - `~/csse3010` for WSL/Linux/macOS if you are following the official guide.
  - `%userprofile%\Documents\csse3010` for Windows if you are following my unofficial guide.
- Run `git clone git@csse3010-gitea.zones.eait.uq.edu.au:XXXXXXXX/repo.git`.
  - You must have Git installed before you do this.
  - The first time you run it, it may ask you to trust the key, just type in `yes`.

```
C:\Users\yufen\Documents\csse3010>git clone git@csse3010-gitea.zones.eait.uq.edu.au:47434477/repo.git
Cloning into 'repo'...
************************************************************************
Access to electronic resources at the University of Queensland is
restricted to employees, students, or individuals authorized by the
University or its affiliates. Use of this system is subject to all
policies and procedures set forth by the University. Unauthorized use
is prohibited and may result in administrative or legal action. The
University may monitor the use of this system for purposes related
to security management, system operations, and intellectual property
compliance.
************************************************************************
The authenticity of host 'csse3010-gitea.zones.eait.uq.edu.au (<no hostip for proxy command>)' can't be established.
ED25519 key fingerprint is SHA256:VRBQWlnJgU7CRQFOtp8NKKkwzoKGiYCo0h9Z3kdIVYQ.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'csse3010-gitea.zones.eait.uq.edu.au' (ED25519) to the list of known hosts.
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 4 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (4/4), done.
```
