#!/bin/bash
# Script to run Robot Framework tests

echo "=== Robot Framework Automation Testing ==="
echo ""

# Check if sample website server is running
echo "Checking if website is accessible..."
if curl -s http://localhost:8080/index.html > /dev/null 2>&1; then
    echo "✓ Website is accessible at http://localhost:8080"
else
    echo "✗ Website is not accessible."
    echo ""
    echo "Please start the web server first:"
    echo "  cd sample-website"
    echo "  python -m http.server 8080"
    echo ""
    exit 1
fi

echo ""
echo "=== Running Tests ==="
echo ""

# Create results directory if it doesn't exist
mkdir -p results

# Run all tests
robot --outputdir results tests/

echo ""
echo "=== Test Execution Complete ==="
echo ""
echo "Test reports available in 'results' directory:"
echo "  - results/report.html - Summary report"
echo "  - results/log.html - Detailed log"
echo "  - results/output.xml - XML output"
echo ""
echo "To view the report:"
echo "  xdg-open results/report.html  # Linux"
echo "  open results/report.html      # macOS"
echo "  start results/report.html     # Windows"

