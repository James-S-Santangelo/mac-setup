# ======================
# Brew, mas, Xcode
# ======================

# Install Homebrew if it doesn't exist
# This will also install XCode command-line tools
if test ! $(which brew)
then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Mac App Store CLI
echo 'Installing Mac App Store command-line tools'
brew install mas

# Ensure latest version of Xcode is installed
# Note: Need to sign in to Mac App Store manually
# See https://github.com/mas-cli/mas/issues/164
echo 'Updating Xcode'
mas install 497799835

# ======================
# Languages and Bash
# ======================

# Install bash and make default shell
# Password required
echo 'Installing bash'
brew install bash &&
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells &&
chsh -s /usr/local/bin/bash

# Install Vim
echo 'Installing Vim'
brew install vim

# Install Git
echo 'Installing Git'
brew install Git

# Install utilities
echo 'Installing utilities'
brew install wget
brew install openconnect  # VPN (substitute for Cisco AnyConnect)
brew install coreutils  # Replace default Mac utils with GNU coreutils
brew install tmux  # Multiple interactive terminal windows
brew install tree  # Depict directory structure as tree

# Install latest Java JRE
brew install --cask adoptopenjdk

# Install latest version of Python
brew install python

## Install R

# Install R v. 3.6.3
wget https://cran.r-project.org/bin/macosx/el-capitan/base/R-3.6.3.pkg -P ~/Downloads/
open ~/Downloads/R-3.6.3.pkg  # Follow the prompts

# Forget about R 3.6.3 installation to avoid overwriting
# https://jacobrprice.github.io/2019/09/19/Installing-multiple-parallel-R-versions.html
sudo pkgutil --forget org.r-project.R.el-capitan.fw.pkg \
             --forget org.r-project.x86_64.tcltk.x11 \
             --forget org.r-project.x86_64.texinfo \
             --forget org.r-project.R.el-capitan.GUI.pkg

# Install latest R
wget https://cran.r-project.org/bin/macosx/base/R-release.pkg -P ~/Downloads/
open ~/Downloads/R-release.pkg  # Follow the prompts

# Install RSwitch 
wget https://rud.is/rswitch/releases/RSwitch-1.7.0.app.zip -P ~/Downloads/ &&
unzip ~/Downloads/RSwitch-1.7.0.app.zip &&
mv ~/Downloads/RSwitch.app /Applications/RSwitch.app

# Link files
git clone https://github.com/James-S-Santangelo/dotfiles.git ~/github-repos/dotfiles
cp -r ~/github-repos/dotfiles/vim ~/.vim
ln -sf ~/github-repos/dotfiles/bashrc ~/.bashrc
ln -sf ~/github-repos/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/github-repos/dotfiles/vimrc ~/.vimrc
ln -sf ~/github-repos/dotfiles/gitconfig ~/.gitconfig
source ~/.bashrc  # Re-initialize shell
vim +PluginInstall +qall  # Install Vim Plugins

# ====================
# App installs
# ====================

echo 'Installing select applications'
# Misc
brew install --cask appcleaner  # Easily remove Apps
brew install --cask brave-browser  # Browser
brew install --cask spotify  # Music
brew install --cask zoom  # Zoom video conferencing
brew install --cask slack  # Slack
brew install --cask sublime-text  # Sublime Text text-editor
brew install --cask skim  # Skim PDF reader
brew install --cask adobe-acrobat-reader  # Adobe Acrobat Reader
mas install 937984704  # Amphetamine

# Productivity
brew install --cask rectangle  # Window movement/resizing
brew install --cask alfred  # Hotkeys, workflows and easy Mac/Web access and automation
brew install --cask notion  # Notes and life organization
brew install bitwarden-cli  # Command-line interface for bitwarden
mas install 1176895641  # Spark mail client

# Cloud storage
brew install --cask sync  # Sync.com
brew install --cask google-drive  # Google drive
brew install --cask dropbox  # Dropbox

# Microsoft office
brew install --cask microsoft-excel
brew install --cask microsoft-word
brew install --cask microsoft-powerpoint

# Singularity developement and virtual machines
brew install --cask vagrant
brew install --cask vagrant-manager
brew install --cask virtualbox

# Basic LaTeX
brew install --cask basictex

# ======================
# Sublime text config
# ======================

# Download Sublime text package manager
wget https://packagecontrol.io/Package%20Control.sublime-package -P ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/

# Dependencies for Sublime Text Packages
pip3 install flake8  # Required for SublimeLinter Flake8 plugin

# Link Sublime Settings to Sublime Text
ln -sf ~/github-repos/mac-setup/app-configs/sublime-text.config ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

# After above 3 commands, open Sublime Text and it will install all packages
subl

# ======================
# Alfred workflows
# ======================

# These are installed manually

# Bitwarden
# https://github.com/blacs30/bitwarden-alfred-workflow/releases

