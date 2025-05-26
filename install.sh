#!/bin/bash

# Detect OS
OS=$(uname)

if [[ "$OS" == "Linux" ]]; then
    # Check for Debian/Ubuntu
    if [[ -f /etc/debian_version ]]; then


        # Install wget if not installed
        if ! command -v wget &> /dev/null; then
            echo "wget could not be found. Installing..."
            sudo apt update
            sudo apt install -y wget
        fi

        # Download and install the tool
        echo "Downloading the tool..."
        wget https://raw.githubusercontent.com/awakesid/foldit/main/Packages/foldit-1.0.deb
        echo "Installing the tool..."
        sudo dpkg -i foldit-1.0.deb
        rm foldit-1.0.deb

    # Check for Arch Linux
    elif [[ -f /etc/arch-release ]]; then


        # Install wget if not installed
        if ! command -v wget &> /dev/null; then
            echo "wget could not be found. Installing..."
            sudo pacman -Sy wget
        fi

        # Download and install the tool
        echo "Downloading the tool..."
        wget https://raw.githubusercontent.com/awakesid/foldit/main/Packages/foldit.tar.gz
        echo "Extracting the tool..."
        tar -xzf foldit.tar.gz -C /usr/local/bin
        rm foldit.tar.gz

    else
        echo "Unsupported Linux distribution."
        exit 1
    fi

elif [[ "$OS" == "Darwin" ]]; then
    # Install on macOS

    # Install Homebrew if not installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Install wget if not installed
    if ! command -v wget &> /dev/null; then
        echo "wget could not be found. Installing..."
        brew install wget
    fi

    # Download and install the tool
    echo "Downloading the tool..."
    wget https://raw.githubusercontent.com/awakesid/foldit/main/Packages/foldit_mac.tar.gz
    echo "Extracting the tool..."
    tar -xzf foldit_mac.tar.gz -C /usr/local/bin
    rm foldit_mac.tar.gz

else
    echo "Unsupported OS."
    exit 1
fi

echo "Installation complete!"
