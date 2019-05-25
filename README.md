# Mechanical

Hello, welcome to the repository for Rock Raider's mechanical subteam. This repository was created in the summer of 2019 to allow the mechanical subteam to perform version control on CAD developed. The goal is to ensure that everyone has accurate and up-to-date designs that are all stored in a common location with a uniform CAD file format. The team has decided that starting in summer of 2019, all CAD will be done in Solidworks, to ensure that file formats are identical.

## Getting Started
### Git
For many of you reading this, you likely have little to no experience with using Git for version control. Since the team is using Solidworks to CAD, Git is going to need to be used in a Windows OS, since Solidworks doesn't have a Linux distribution. To start, Git Bash needs to be installed. 

Git Bash can be downloaded from here: https://gitforwindows.org/

The next step is fairly obvious, but you need to be added to the Git repository. To do this, create an account at Github (if you don't already have one) and talk to one of the subteam leads to get an invitation to the repository. 

Once Git Bash is installed and you're a member of the repository, open the Git Bash program from whatever directory you downloaded it to. A command line window should open that appears similar to a Linux command line window. In the command window, perform the following two commands to configure your Git username/email (Replace the text in the quotes with your data, but keep the quotes. I typically use my Github username and email):

```
git config --global user.name "USER_NAME"
git config --global user.email "MY_NAME@example.com"
```

Next, we need to clone the current mechanical repository onto your computer. This essentially takes all the files and folders in the repository and copy and pastes them into a directory of your choosing. In the Git Bash command window, navigate to a directory where you want to store the repository. For example, I store mine in a Rock Raiders folder on my desktop. To get to the repository, I perform the following: 

```
cd Desktop/"Rock Raiders"
```

Once you're in the directory you want, clone the repository using the following command:

```
git clone https://github.com/RockRaidersInc/Mechanical
```

You'll know see that the directory you were in has a Mechanical folder. Congratulations, that is the repository with all of the teams current CAD and research in it. You're now free to create and design whatever, but please don't delete older designs or reorganize the folder tree. 

### Solidworks

Upperclassmen may know how to do this, but for freshman, the only CAD software that comes on the school laptops is NX. As such, you likely don't have Solidworks on your system. RPI offers us student licenses for free. Head to this link https://dotcio.rpi.edu/services/software-labs to request a license from the school. You'll need to log in with your RCS ID and password. Once you request the license, you'll need to wait a short while for the school to end you an email. The email should contain directions for how to install Solidworks and activate your license.

As always, feel free to ask subteam leaders for help. The mechanical subteam lead should also be holding periodic CAD tutorial sessions to get people unfamiliar with Solidworks up to speed. 

## Committing Changes

Now that you have access to the repository and have added some designs of your own, it's time to commit them so everyone can access them. Currently, you've only made changes to the folders and files on your local system (the working directory), not the repository itself. We need to "commit" these changes to the overal repository so that everyone has access to these changes. 

### Side Note About Solidworks and Temporary Files 

Before committing, save all your Solidworks parts and __CLOSE__ them. When a part is open in Solidworks, a temporary file is generated and saved in the folder where your normal part is saved. The temporary file is deleted once you close the part. We __DO NOT__ want to commit the temporary files to the repository, so __PLEASE__ close all Solidworks parts before committing so that we don't commit unnecessary temporary files also.

To add your changes, we first need to propose the changes. To do so, use the following command:

```
git add *
```

The asterisk indicates that any new files/folders should automatically be added, without you needing to specify each individual file's name. 

Next, we need to commit the changes to the HEAD, or the space before the repository. To do this, we use the following command:

```
git commit -m "Commit message"
```

Replace the text _Commit message_ with a description of what changes your commit makes. For example, if you created a new wheel design, your commit message might read "Adding CAD files for new wheel design." Remember to keep the quotes around your message in the command. Additionally, the message should be concise, but give a good description of the changes you've made. 

Lastly, now we need to push everything to the repository so that everyone has access to the changes you've made. Use the following command:

```
git push origin master
```

Congratulations, if everything went well you've just added your designs to our repository. In the future, you will need to do the previous 3 commands anytime you want to add your changes to the repository. There is a possibility that there might be conflicts during this last step. I think it's highly unlikely for us to see conflicts, but if you have an error message, come find a subteam leader to lend you a hand.

## Updating the Files on Your System

You've just updated the repository and you have all the changes you made, but what if someone else updates the repository? How do you get the changes they made onto your machine? It might seem like you need to re-clone the repository, but you don't. 

Navigate to the Mechanical folder on your system that we created in the first few steps. Once there, use the following command:

```
git pull
```

It's that simple. The _git pull_ command will grab any updates and changes to the repository that you don't already have in your directory. It's good practice to pull before you start working on your project, to make sure you have the most up-to-date CAD. 

## Extra Stuff

I gave a very brief tutorial on how to use Git here, but if you want to know more you can visit this link https://rogerdudler.github.io/git-guide/.

