# Trading Setup Scripts

This public repository contains setup scripts for the trading system development environments.

## Available Scripts

### `setup_model_dev.sh`
Sets up the development environment for the model builder:
- Creates `model_dev` directory with virtual environment
- Installs `trading_model_helper` and `model_builder`
- Configures all dependencies

### `setup_trading_dev.sh`
Sets up the development environment for the live trading system:
- Creates `trading_dev` directory with virtual environment
- Installs `trading_model_helper` and `algo_trading_app`
- Configures all dependencies

## Usage

1. Clone this repository:
```bash
git clone https://github.com/dwhite1/trading_setup.git
cd trading_setup
```

2. Make scripts executable:
```bash
chmod +x *.sh
```

3. Run the desired setup script:
```bash
# For model development
./setup_model_dev.sh

# For live trading development
./setup_trading_dev.sh
```

## Directory Structure

After running the scripts, you'll have the following directory structure:

```
~/your/path/
├── model_dev/              # Model development environment
│   ├── .venv/
│   ├── trading_model_helper/
│   └── model_builder/
│
└── trading_dev/           # Live trading environment
    ├── .venv/
    ├── trading_model_helper/
    └── algo_trading_app/
```

## Prerequisites

- Python 3.8+
- Git with credential manager configured
- GitHub access to the private repositories

## Troubleshooting

### Authentication Issues
If you encounter authentication issues:
1. Ensure you have access to the private repositories
2. Check that Git Credential Manager is installed and configured
3. Try running `git config --global credential.helper manager`

### Python Environment Issues
If you encounter Python environment issues:
1. Ensure Python 3.8+ is installed and in your PATH
2. Try creating a virtual environment manually:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate  # or .venv\Scripts\activate on Windows
   ```

## License

MIT License 