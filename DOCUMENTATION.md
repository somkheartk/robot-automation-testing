# Project Documentation - Robot Framework Automation Testing

## Overview
This is a professional-grade Robot Framework automation testing project created to demonstrate best practices in web application testing. The project includes a complete sample website and comprehensive test suites.

## What's Included

### 1. Sample Website (sample-website/)
A fully functional Thai-language product management system with:

#### Pages:
- **index.html** - Homepage with hero section, features, and statistics
- **login.html** - Login page with form validation and demo credentials
- **products.html** - Product catalog with search and shopping cart
- **contact.html** - Contact form with information display

#### Technologies:
- HTML5 with semantic markup
- Modern CSS3 with responsive design
- Vanilla JavaScript for interactivity
- No external dependencies (pure HTML/CSS/JS)

#### Features:
- Fully responsive design
- Form validation
- Interactive elements (search, cart, navigation)
- Professional styling and UX

### 2. Test Suites (tests/)
42+ comprehensive test cases organized by functionality:

#### homepage_tests.robot (11 tests)
- Page loading and title verification
- Navigation menu testing
- Hero section validation
- Feature display verification
- Statistics section testing
- Navigation flow testing

#### login_tests.robot (9 tests)
- Valid/invalid credential testing
- Empty field validation
- Checkbox functionality
- Link presence verification
- UI element testing

#### product_tests.robot (13 tests)
- Product display testing
- Search functionality
- Cart operations
- Product details viewing
- UI element validation
- Price and description verification

#### contact_tests.robot (9 tests)
- Form submission testing
- Field validation
- Information display
- Email validation
- Empty field handling

### 3. Resources (resources/)
Reusable keywords and variables:

#### common.robot
- Browser setup keywords
- Navigation helpers
- Input helpers
- Validation keywords
- Common variables (URLs, timeouts)

### 4. Documentation
- **README.md** - Comprehensive project documentation
- **QUICKSTART.md** - Quick start guide for beginners
- **DOCUMENTATION.md** - This file

### 5. Helper Scripts
- **run_tests.sh** - Bash script for Linux/Mac
- **run_tests.bat** - Batch script for Windows
- Both scripts check prerequisites and provide helpful feedback

### 6. Configuration Files
- **requirements.txt** - Python dependencies
- **.gitignore** - Git ignore rules

## Test Organization

### Tag System
Tests are organized using tags for flexible execution:

| Tag | Purpose | Example Usage |
|-----|---------|---------------|
| smoke | Critical functionality tests | `robot --include smoke tests/` |
| ui | User interface tests | `robot --include ui tests/` |
| positive | Valid input tests | `robot --include positive tests/` |
| negative | Invalid input tests | `robot --include negative tests/` |
| validation | Form validation tests | `robot --include validation tests/` |
| login | Login-related tests | `robot --include login tests/` |
| products | Product page tests | `robot --include products tests/` |
| contact | Contact page tests | `robot --include contact tests/` |
| homepage | Homepage tests | `robot --include homepage tests/` |
| navigation | Navigation tests | `robot --include navigation tests/` |
| cart | Shopping cart tests | `robot --include cart tests/` |
| search | Search functionality tests | `robot --include search tests/` |

### Best Practices Implemented

1. **Page Object Pattern**: Keywords organized by page/functionality
2. **DRY Principle**: Common keywords in shared resource file
3. **Clear Documentation**: Every test case has documentation
4. **Meaningful Names**: Descriptive test and keyword names
5. **Proper Organization**: Tests grouped by feature/page
6. **Tag Usage**: Flexible test execution with tags
7. **Variable Management**: Centralized configuration variables
8. **Error Handling**: Proper wait conditions and assertions

## Running Tests

### Prerequisites
1. Python 3.7 or higher
2. Google Chrome browser (or Firefox/Edge)
3. Internet connection (for initial WebDriver download)

### Setup Steps

1. **Install Python dependencies:**
```bash
pip install -r requirements.txt
```

2. **Start the web server (in separate terminal):**
```bash
cd sample-website
python -m http.server 8080
```

3. **Run tests:**
```bash
# All tests
robot tests/

# Using helper script
./run_tests.sh          # Linux/Mac
run_tests.bat           # Windows

# Specific test suite
robot tests/login_tests.robot

# By tag
robot --include smoke tests/
robot --include ui tests/
```

### Advanced Usage

```bash
# Different browser
robot --variable BROWSER:Firefox tests/

# Custom output directory
robot --outputdir results tests/

# Parallel execution (requires robotframework-pabot)
pabot --processes 4 tests/

# Exclude certain tests
robot --exclude negative tests/

# Multiple tags
robot --include login --include positive tests/

# Generate only XML output (no HTML)
robot --log NONE --report NONE tests/
```

## Test Results

After running tests, three files are generated:

1. **report.html** - High-level summary with statistics and graphs
2. **log.html** - Detailed step-by-step execution log with screenshots
3. **output.xml** - Machine-readable XML for CI/CD integration

### Viewing Results
```bash
# Linux
xdg-open report.html

# macOS
open report.html

# Windows
start report.html
```

## CI/CD Integration

The XML output can be integrated with:
- Jenkins (Robot Framework Plugin)
- GitLab CI (Robot Framework reports)
- GitHub Actions (publish test results)
- Azure DevOps (publish test results)

Example Jenkins integration:
```groovy
stage('Test') {
    steps {
        sh 'robot --outputdir results tests/'
    }
    post {
        always {
            robot outputPath: 'results', logFileName: 'log.html'
        }
    }
}
```

## Extending the Project

### Adding New Tests
1. Create a new test file in `tests/` directory
2. Import the common resource file
3. Define test cases with proper tags and documentation
4. Follow naming conventions

Example:
```robot
*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/common.robot

Suite Setup       Open Browser To Your Page
Suite Teardown    Close Browser

*** Test Cases ***
Your Test Case
    [Documentation]    Description of what this test does
    [Tags]    yourtag
    Your Keyword
    Verify Expected Result
```

### Adding New Keywords
Add reusable keywords to `resources/common.robot`:
```robot
Your Custom Keyword
    [Arguments]    ${param}
    [Documentation]    Description of keyword
    # Keyword implementation
```

### Adding New Pages
1. Create HTML file in `sample-website/`
2. Update navigation in existing pages
3. Create corresponding test file
4. Add page-specific keywords to resources

## Troubleshooting

### Common Issues

**Issue**: Browser driver not found
**Solution**: Install/update selenium and webdriver-manager
```bash
pip install --upgrade selenium webdriver-manager
```

**Issue**: Port 8080 already in use
**Solution**: Use different port or stop the conflicting process
```bash
# Use different port
python -m http.server 8081

# Update resources/common.robot
${BASE_URL}    http://localhost:8081
```

**Issue**: Tests timeout
**Solution**: Increase timeout in resources/common.robot
```robot
${DELAY}    1.0    # Increase from 0.5
```

**Issue**: Element not found
**Solution**: Check if website is running and accessible
```bash
curl http://localhost:8080/index.html
```

## Project Statistics

- **Total Files**: 14+ project files
- **Total Test Cases**: 42+ automated tests
- **Lines of Code**: 2000+ lines
- **Documentation**: 4 markdown files
- **Languages**: Robot Framework, HTML, CSS, JavaScript
- **Test Coverage**: 100% of website pages

## Technologies Used

### Testing Framework
- Robot Framework 7.0
- SeleniumLibrary 6.3.0
- Selenium 4.15.2

### Sample Website
- HTML5
- CSS3
- JavaScript (ES6+)

### Tools
- Python 3.x
- Chrome WebDriver (auto-managed)

## License

This project is open source and available for educational purposes.

## Support

For issues or questions:
1. Check the QUICKSTART.md guide
2. Review this documentation
3. Check Robot Framework documentation at https://robotframework.org/
4. Review SeleniumLibrary docs at https://robotframework.org/SeleniumLibrary/

## Contributing

To contribute:
1. Fork the repository
2. Create a feature branch
3. Add tests for new features
4. Ensure all tests pass
5. Submit a pull request

## Changelog

### Version 1.0.0 (Current)
- Initial release
- 42+ test cases
- 4-page sample website
- Comprehensive documentation
- Helper scripts for all platforms
- Professional-grade implementation

---

**Created by**: Robot Framework Automation Team  
**Last Updated**: 2024  
**Version**: 1.0.0
