# Portfolio Website

Automation testing for the OrangeHRM Open Source Management Web App using Robot Framework with Selenium and FakerLibrary libraries.

## 🛠️ Tools and Technologies

- Robot Framework
- Selenium
- Faker Library (for data generation)

## 👩‍💻 Setup and Installation

1. Clone the repo:
   ```bash
   git clone https://github.com/peanut150/orangeHRM-automation-test.git
   cd orangeHRM-automation-test
   ```
2. Create an environment
   ```bash
   py -3 -m venv .venv
   ```
3. Activate the environment
   ```bash
   .venv\Scripts\activate
   ```
4. Install the dependencies
   ```bash
   pip install robotframework
   pip install selenium
   pip install robotframework-seleniumlibrary
   pip install robotframework-faker
   ```
5. Run the test cases
   ```bash
   robot Tests/Buzz/ViewBuzzTest.robot
   ```
   or run using tags
   ```bash
   robot --include good-case Tests/Buzz/ViewBuzzTest.robot
   ```
