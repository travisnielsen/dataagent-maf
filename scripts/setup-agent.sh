#!/bin/bash

# Navigate to the agent directory
cd "$(dirname "$0")/../api" || exit 1

# Install dependencies and create virtual environment using uv
uv sync
