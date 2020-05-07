# shellScripts
This project includes some of my personal shell scripts to make life easier.  Please submit issues with details if you know of a better way to do things (I like to learn).

## mcdir (Pronounced 'Mic-Der')
This command allows you to create a directory (mkdir) or a directory path and then automatically puts you in that directory to work.  This was increadibly useful, easy to remember, and potentially saves tens of hundreds of keystrokes over my life.   

### Installation
There are two options.  
- Create a separate file in PATH and source with .bash_profile file.
- Add the function to your .bashrc file.

#### Create a separate file
This is a convient way to keep your .bashrc file small and still have the added benefit of using this non-system command.  These instructions are written assuming the user is using terminal and in the same directory as the mcdir.sh file.  First create a new file for PATH (if it doesn't exist):
```bash
sudo mkdir -p /opt/local/sbin
```
Now change the ownership of the directory to allow yourself to access and execute files out of it:
```bash
sudo chown your_user_name /opt/local/sbin
```
Next we need to make the file executable and move the file to our desired location. Be sure to keep the file extension off the new file to allow for a cleaner use in terminal:
```bash
chmod +x mcdir.sh && mv mcdir.sh /opt/local/sbin/mcdir
```
At this point, we need to tell the terminal to look in that directory for files.  To do this, we need to add the PATH to your .bashrc file:
```bash
nano ~/.bashrc
```
Add the following to the bottom of your file:
```bash
# Personal path location for scripts
export PATH="/opt/local/sbin:$PATH"
```
Press 'ctrl+x' then press 'y' to save changes and press 'enter' to write the changes and exit the editor. 
(Required for MacOS only) Now we need to source the file into our bash each time our terminal is started.  To do this, we need to add the source to our .bash_profile file.  Start by opening your .bash_profile file:
```bash
nano ~/.bash_profile
```
(Required for MacOS only) Add the following to the bottom of your file:
```bash
# Source personal system level terminal commands
source /opt/local/sbin/mcdir
```
Finally, exit out and relaunch your terminal to use the new function.

#### Add to .bashrc file
This will allow the user to access the function directly in terminal without modifying the user's PATH.  To do this, we need to add the function to your .bashrc file:
```bash
nano ~/.bashrc
```
Add the following to the bottom of your file:
```bash
# Function to allow making and changing into a directory with one call
PASTE_THE_FUNCTION_HERE
```
Press 'ctrl+x' then press 'y' to save changes and press 'enter' to write the changes and exit the editor.
Finally, exit out and relaunch your terminal to use the new function.

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
