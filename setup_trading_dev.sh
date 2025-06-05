#!/bin/bash

# Exit on any error
set -e

# Configuration
DEV_DIR="trading_dev"
VENV_NAME=".venv"
HELPER_REPO="https://github.com/dwhite1/trading_model_helper.git"
TRADING_REPO="https://github.com/dwhite1/algo_trading_app.git"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Setting up live trading development environment...${NC}"

# Create and enter development directory
if [ ! -d "$DEV_DIR" ]; then
    echo -e "\n${GREEN}Creating development directory...${NC}"
    mkdir -p "$DEV_DIR"
fi
cd "$DEV_DIR"

# Create virtual environment if it doesn't exist
if [ ! -d "$VENV_NAME" ]; then
    echo -e "\n${GREEN}Creating virtual environment...${NC}"
    python3 -m venv "$VENV_NAME"
else
    echo -e "\n${YELLOW}Virtual environment already exists, skipping creation...${NC}"
fi

# Activate virtual environment
echo -e "\n${GREEN}Activating virtual environment...${NC}"
source "$VENV_NAME/bin/activate"

# Upgrade pip
echo -e "\n${GREEN}Upgrading pip...${NC}"
pip install --upgrade pip

# Clone repositories if they don't exist
if [ ! -d "trading_model_helper" ]; then
    echo -e "\n${GREEN}Cloning trading_model_helper repository...${NC}"
    git clone "$HELPER_REPO"
else
    echo -e "\n${YELLOW}trading_model_helper already exists, pulling latest changes...${NC}"
    (cd trading_model_helper && git pull)
fi

if [ ! -d "algo_trading_app" ]; then
    echo -e "\n${GREEN}Cloning algo_trading_app repository...${NC}"
    git clone "$TRADING_REPO"
else
    echo -e "\n${YELLOW}algo_trading_app already exists, pulling latest changes...${NC}"
    (cd algo_trading_app && git pull)
fi

# Install packages in development mode
echo -e "\n${GREEN}Installing trading_model_helper in development mode...${NC}"
(cd trading_model_helper && pip install -e .)

echo -e "\n${GREEN}Installing algo_trading_app in development mode...${NC}"
(cd algo_trading_app && pip install -e .)

# Verify installation
echo -e "\n${GREEN}Verifying installation...${NC}"
pip list | grep -E "trading-model-helper|algo-trading-app"

echo -e "\n${GREEN}Setup complete! Your live trading development environment is ready.${NC}"
echo -e "\nTo activate the virtual environment in the future, run:"
echo -e "cd $(pwd)"
echo -e "source $VENV_NAME/bin/activate" 