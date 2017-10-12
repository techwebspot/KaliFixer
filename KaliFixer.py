from os import system
import sys
import commands
#sys.stdout.write("\x1b[8;{rows};{cols}t".format(rows=30, cols=101))
def banner():
	print """
    +---------------------------------------------------------------------------------+
    |                            Author:- Techwebspot                                 |
    +---------------------------------------------------------------------------------+
                           _  __     _ _
                          | |/ /    | (_)
                          | ' / __ _| |_|
                          |  < / _\` | | |
                          | . \ (_| | | |
                          |_|\_\__,_|_|_|   _____
                                           / __(_)_ _____ ____
                                          / _// /\ \ / -_) __/
                                         /_/ /_//_\_\\__/_/
    +---------------------------------------------------------------------------------+
    |                           Moded By : T3r@bYt3                                   |
    +---------------------------------------------------------------------------------+

    """

def menu():
	print
	print
	print "\033[1;35m -=[   M E N U   ]=-\n\033[0m\n\033[0;31m1)  \033[0;33mSolve Sound Problem\t\t\t\t\033[0m\033[0;31m2)  \033[0;33mInstall VLC Media Player"
	print "\033[0;31m3)  \033[0;33mAllow VLC to Run As Root User\t\t\033[0m\033[0;31m4)  \033[0;33mStart Sound Volume Ajuster ( alsamixer )"
	print "\033[0;31m5)  \033[0;33mAdd a new user\t\t\t\t\033[0m\033[0;31m6)  \033[0;33mProvide Existing User With SUDO Priviliges"
	print "\033[0;31m7)  \033[0;33mDelete Existing User\t\t\t\033[0m\033[0;31m8)  \033[0;33mInstall Teamvieweri386 for Debian"
	print "\033[0;31m9)  \033[0;33mUpdate All Repositories\t\t\t\033[0m\033[0;31m10) \033[0;33mUpgrade All Modules"

def main():
	banner()
	menu()
	opt=raw_input("\033[0;32mChoose Your Option (1 - 10 or any to EXIT): ")
	if opt=="1":
		sound()
	elif opt=="3":
		vlcasroot()
	elif opt=="2":
		installvlc()
	elif opt=="4":
		alsamixer()
	elif opt=="5":
		adduser()
	elif opt=="6":
		suser()
	elif opt=="7":
		deluser()
	elif opt=="8":
		tv()
	elif opt=="9":
		update()
	elif opt=="10":
		upgrade()

def update():
	if system("apt update")==0:
		print "\033[1;33mYour repos have been updated"
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()
	else:
		print "\n\n"
		print "\033[1;31mOOPS Error Encountered"
		raw_input("Press Any Key To Return To Main Menu...")
		main()

def upgrade():
	if system("apt upgrade")==0:
		print "\033[1;33mYour repos have been upgraded"
		raw_input("Press Any Key To Return To Main Menu...")
		main()
	else:
		print "\n\n"
		print "\033[1;31mOOPS Error Encountered"
		raw_input("Press Any Key To Return To Main Menu...")
		main()

def tv():
	ch=str(raw_input("\033[0mInstall teamviwer (y/n) "))
	if ch.lower()=="y":
		downtv=system("wget https://downloadus2.teamviewer.com/download/version_12x/teamviewer_12.0.76279_i386.deb")
		if downtv==0:
			addi386=system("dpkg --add-architecture i386")
			update=system("apt update")
			install1=system("dpkg -i teamviewer_12.0.76279_i386.deb")
			dependencies=system("apt install -f")
			install2=system("dpkg -i teamviewer_12.0.76279_i386.deb")
			deltv=system("rm -rf teamviewer_12.0.76279_i386.deb")
			if addi386==0 and update==0 and install1==0 and insall2==0 and dependencies==0:
				print "\033[1;33mTeamviewer has been installed on your distro"
				main()
			else:
				if not addi386==0:
					print "\033[1;31mUnable to add architecture i386"
					raw_input("Press Any Key To Return To Main Menu...")
					main()
				elif not update==0:
					print "\033[1;31mUnable to update your repos"
					raw_input("Press Any Key To Return To Main Menu...")
					main()
				elif not install2==0:
					print "\033[1;31mUnable to install teamviewer. But all dependencies error have been fixed"
					raw_input("Press Any Key To Return To Main Menu...")
					main()
				elif not dependencies==0:
					print "\033[1;31mUnable to install dependencies"
					raw_input("Press Any Key To Return To Main Menu...")
					main()
		else:
			print "\n\n"
			print "\033[1;31mOOPS Error Encountered"
			raw_input("Press Any Key To Return To Main Menu...")
			main()
	else:
		main()

def adduser():
	usr=str(raw_input("\033[0mEnter Username "))
	user="adduser %s"%(usr)
	if system(user)==0:
		print "\033[1;33mUser - %s has been created with password - <your_password>"%(usr)
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()
	else:
		print "\n\n"
		print "\033[1;31mOOPS Error Encountered"
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()

def suser():
	usr=str(raw_input("\033[0mEnter Username "))
	user="usermod -aG sudo %s"%(usr)
	if system(user)==0:
		print "\033[1;33mUser - %s has been provided with sudo priviliges"%(usr)
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()
	else:
		print "\n\n"
		print "\033[1;31mOOPS Error Encountered"
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()

def deluser():
	usr=str(raw_input("\033[0mEnter Username "))
	user="deluser %s"%(usr)
	if system(user)==0:
		print "\033[1;33mUser - %s has been deleted"%(usr)
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()
	else:
		print "\n\n"
		print "\033[1;31mOOPS Error Encountered"
		raw_input("\033[0mPress Any Key To Return To Main Menu...")
		main()


def sound():
	ch=str(raw_input("\033[0mInstall alsa-utils (y/n) "))
	if ch.lower()=="y":
		result=system("sudo apt-get install alsa-utils -y")
		if result==0:
			print
			print "\033[1;34m\n\n[*] Command Ran Successfully"
			print "\033[1;33mHow To Use: In your terminal use the command (alsamixer) and use your keyboard"
		else:
			print "\n\n"
			print "\033[1;31mOOPS Error Encountered"
			raw_input("\033[0mPress Any Key To Return To Main Menu...")
			main()
	else:
		main()


def vlcasroot():
	ch=str(raw_input("\033[0mAllow VLC to Run As ROOT USER (y/n) "))
	if ch.lower()=="y":
		result=system("sed -i 's/geteuid/getppid/' /usr/bin/vlc")
		if result==0:
			print
			print "\033[1;34m\n\n[*] Command Ran Successfully"
			print "\033[1;33mNote: Either type vlc in terminal or double click on icon"
		else:
			print "\n\n"
			print "\033[1;31mOOPS Error Encountered"
			raw_input("\033[0mPress Any Key To Return To Main Menu...")
			main()
	else:
		main()


def installvlc():
	ch=str(raw_input("\033[0mInstall VLC (y/n) "))
	if ch.lower()=="y":
		result=system("sudo apt install vlc")
		if result==0:
			print
			print "\033[1;34m\n\n[*] Command Ran Successfully"
			print "\033[1;33mNote: Either type vlc in terminal or double click on icon"
		else:
			print "\n\n"
			print "\033[1;31mOOPS Error Encountered"
			raw_input("\033[0mPress Any Key To Return To Main Menu...")
			main()
	else:
		main()


def alsamixer():
	system("alsamixer")
	main()

usr = commands.getstatusoutput("id -u -n")[1]
if usr == "root":
	main()
else:
	print "\033[1;33mNOTE: Run it as ROOT Privileges."
