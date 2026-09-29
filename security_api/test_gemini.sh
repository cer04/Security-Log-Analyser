#!/bin/bash

# Test script to verify Gemini provider works

echo "Testing Gemini Provider Configuration..."
echo ""

# Set Gemini provider settings
export LLM_PROVIDER=gemini
export LLM_MODEL=gemini-1.5-flash
# Ensure GEMINI_API_KEY is set in environment or .env
if [ -z "$GEMINI_API_KEY" ]; then
    echo "Please set GEMINI_API_KEY before running this script."
    echo "Example: export GEMINI_API_KEY=your_key_here"
    exit 1
fi

# Create a simple test log
TEST_LOG='192.168.1.100 - - [10/Feb/2026:20:00:00 +0000] "GET /admin/login.php HTTP/1.1" 200 1234'

echo "Test log: $TEST_LOG"
echo ""
echo "Starting server with Gemini provider..."
echo "Visit http://localhost:3000 and paste the test log in Simple Mode"
echo ""

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
cargo run -p security-api --release
