# shellScripts
This project includes some of my personal shell scripts to make life easier.  Please submit issues with details if you know of a better way to do things (I like to learn).

## mcdir (Pronounced 'Mic-Der')
This command allows you to create a directory (mkdir) or a directory path and then automatically puts you in that directory to work.  This was increadibly useful, easy to remember, and potentially saves tens of hundreds of keystrokes over my life.   

### Installation
There are two options.  
- Create a separate file, ensure it is executable, and add it to a directory in your path.
- Add the function to the bottom of your .bashrc file.

### Usage of 'mcdir'
```bash
# Normal method
mkdir directory && cd $_
```
```bash
# My method
mcdir directory
```

### Thoughts
- Exception handling could be more robust
- Include the remaining mkdir options
