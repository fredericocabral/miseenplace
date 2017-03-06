# Mise en Place
Nowadays is a pain in the ass to setup the development environment of complex projects.
Even with modern tools like Vagrant, Docker we still have many issues to setup all dependencies.

The ideia is that a new developer just need to make one simple command to setup completely the development
or at least, guide the developer to install all the tools required.

Stop doing documentation and huge README files. Nobody cares.
Run one single command and let the scripts guide the process.

```
make miseenplace
```

Doesn't matter if you are using vagrant, docker-compose or whatever. 
Doesn't matter if your project is Ruby, Python, Java or Orange

My initial idea is to make the Miseenplace repository to be a guide and a collection of small shell scripts to help teams to automate the setup of of theirs development environment using only the Operational System built-in tools.

There is no 'Mise en place' ready to use.
You have to pick the script the fits better to your project and create your own Mise en place
