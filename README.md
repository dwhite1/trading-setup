# Trading Setup Scripts

This public repository contains setup scripts for the algorithmic trading system development environments. It helps set up consistent development environments for both model building and live trading components.

## Overview

This repository provides two setup scripts:
1. `setup_model_dev.sh` - For model development environment
2. `setup_trading_dev.sh` - For live trading environment

Each script creates an isolated environment with its own virtual environment and required dependencies.

## Quick Start

```bash
# Clone this repository
git clone https://github.com/dwhite1/trading-setup.git
cd trading-setup

# Make scripts executable
chmod +x *.sh

# Choose which environment to set up:

# For model development:
./setup_model_dev.sh

# OR for live trading:
./setup_trading_dev.sh
```

## What the Scripts Do

### `setup_model_dev.sh`
Sets up the model development environment:
- Creates `model-dev` directory with virtual environment
- Clones and installs:
  - `trading-model-helper` (core package)
  - `model-builder` (GUI application)
- Configures all dependencies in development mode

### `setup_trading_dev.sh`
Sets up the live trading environment:
- Creates `trading-dev` directory with virtual environment
- Clones and installs:
  - `trading-model-helper` (core package)
  - `algo-trading-app` (live trading application)
- Configures all dependencies in development mode

## Directory Structure

After running the scripts, you'll have the following structure:

```
~/your/path/
├── model-dev/              # Model development environment
│   ├── .venv/
│   ├── trading-model-helper/
│   └── model-builder/
│
└── trading-dev/           # Live trading environment
    ├── .venv/
    ├── trading-model-helper/
    └── algo-trading-app/
```

## Prerequisites

- Python 3.8+
- Git with credential manager configured
- GitHub access to the private repositories:
  - [trading-model-helper](https://github.com/dwhite1/trading-model-helper)
  - [model-builder](https://github.com/dwhite1/model-builder)
  - [algo-trading-app](https://github.com/dwhite1/algo-trading-app)

## Git Credential Setup

1. Install Git Credential Manager (if not already installed):
   ```bash
   # On macOS (using Homebrew)
   brew install --cask git-credential-manager

   # On Windows
   # Git Credential Manager is included with Git for Windows

   # On Linux
   # Follow instructions at: https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md
   ```

2. Configure Git to use the credential manager:
   ```bash
   git config --global credential.helper manager
   ```

## Troubleshooting

### Authentication Issues
If you encounter authentication issues:
1. Ensure you have access to all required private repositories
2. Check that Git Credential Manager is installed and configured
3. Try running `git config --global credential.helper manager`
4. For manual authentication, visit GitHub and generate a Personal Access Token

### Python Environment Issues
If you encounter Python environment issues:
1. Ensure Python 3.8+ is installed and in your PATH
2. Try creating a virtual environment manually:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # or .venv\Scripts\activate on Windows
   ```
3. If pip install fails, try upgrading pip:
   ```bash
   pip install --upgrade pip
   ```

### Common Issues

1. **"Permission denied" when running scripts**
   ```bash
   chmod +x setup_model_dev.sh setup_trading_dev.sh
   ```

2. **"Directory already exists"**
   - The scripts are safe to run multiple times
   - They will update existing installations rather than fail

3. **Package installation fails**
   - Ensure you're connected to the internet
   - Check you have write permissions in the installation directories
   - Try running pip with verbose output:
     ```bash
     pip install -v -e .
     ```

## Contributing

Feel free to submit issues and enhancement requests!

## License

MIT License 
