
#!/bin/bash

# Comprehensive Installation Script for Solana and Anchor

# Function to install Rust
install_rust() {
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    . "$HOME/.cargo/env"
    rustc --version
}

# Function to install Solana CLI
install_solana_cli() {
    echo "Installing Solana CLI..."
    sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"
    export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
    solana --version
}

# Function to install Anchor CLI using AVM
install_anchor_cli() {
    echo "Installing Anchor CLI using AVM..."
    cargo install --git https://github.com/coral-xyz/anchor avm --force
    avm --version
    avm install latest && avm use latest
    anchor --version
}

# Function to install Node.js and Yarn
install_node_yarn() {
    echo "Installing Node.js and Yarn..."
    # Install Node.js using nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    . "$HOME/.nvm/nvm.sh"
    nvm install node
    # Install Yarn
    npm install --global yarn
}

# Function to force install tools and clear cache
force_install_tools() {
    echo "Force installing tools and clearing cache..."
    cargo build-sbf --force-tools-install
    rm -rf ~/.cache/solana/*
}

# Main script execution
install_rust
install_solana_cli
install_anchor_cli
install_node_yarn
force_install_tools
