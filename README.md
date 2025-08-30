# 🚀 Robot Framework UI Automation Project (SauceDemo + AI Integration)

This project demonstrates **UI automation testing** with **Robot Framework + Python + Selenium**, including **AI-powered test data generation and semantic validations** using OpenAI.  

---

## 📂 Project Structure
```
robot_project_saucedemo_ai/
│── tests/                    # Robot test suites
│   ├── login_tests.robot
│   ├── cart_tests.robot
│
│── resources/                # Shared resources
│   └── variables.robot
│
│── pages/                    # Page Object Model files
│   ├── login_page.robot
│   ├── inventory_page.robot
│   └── cart_page.robot
│
│── helpers/                  # Python helpers & custom libraries
│   ├── ai_helper.py          # AI + Faker test data & semantic validation
│   ├── faker_helper.py       # Randomized test data
│   └── custom_keywords.py    # Reusable custom keywords (browser, assertions)
│
│── requirements.txt          # Python dependencies
│── README.md                 # Setup & usage guide
│── .github/workflows/ci.yml  # GitHub Actions workflow
```

---

## ⚙️ 1. Local Setup

### Step 1: Clone Repo
```bash
git clone <your-repo-url>
cd robot_project_saucedemo_ai
```

### Step 2: Create Virtual Environment (recommended)
```bash
python -m venv venv
source venv/bin/activate    # Mac/Linux
venv\Scripts\activate       # Windows
```

### Step 3: Install Dependencies
```bash
pip install -r requirements.txt
```

### Step 4: Verify Robot Installation
```bash
robot --version
# or
python -m robot --version
```

---

## 🤖 2. Running Tests Locally

### Run all tests
```bash
robot tests/
```

### Run a specific test file
```bash
robot tests/login_tests.robot
```

### Run with output logs
Reports are generated automatically:
- `log.html`
- `report.html`
- `output.xml`

---

## 🔑 3. AI Integration

This project uses **OpenAI API** for **semantic validation** & **test data generation**.  
If no API key is found, it falls back to **Faker**.

### Step 1: Get API Key
1. Go to [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys)  
2. Create a new API key  

### Step 2: Set Environment Variable
On Mac/Linux:
```bash
export OPENAI_API_KEY="sk-yourkeyhere"
```
On Windows (PowerShell):
```powershell
$env:OPENAI_API_KEY="sk-yourkeyhere"
```

### Step 3: Run Tests
```bash
robot tests/
```
⚡ AI will:
- Generate test data (emails, names, addresses)
- Perform **semantic checks** (validate if UI content matches expectations)

---

## 🧪 4. Test Design

- **Positive Scenarios**: Valid login, add items to cart, successful checkout.  
- **Negative Scenarios**: Wrong credentials, missing checkout info, empty cart checkout.  
- **Edge Cases**: Long usernames, special characters in inputs, network delays.  
- **AI-powered Assertions**: Compare UI text meaning vs. expected requirement.  

---

## 🛠️ 5. Custom Libraries

Custom libraries in `helpers/`:
- `ai_helper.py`: AI + Faker test data + semantic validations  
- `faker_helper.py`: Fake users, emails, addresses  
- `custom_keywords.py`:  
  - `Open Browser To URL`  
  - `Wait For And Click Element`  
  - `Assert Text Contains` (with AI fallback semantic check)  

---

## 🏗️ 6. Run in GitHub Actions

This repo includes `.github/workflows/ci.yml`.

### Step 1: Add OpenAI API Key
1. Go to repo → **Settings → Secrets and variables → Actions**  
2. Create new secret:  
   ```
   Name: OPENAI_API_KEY
   Value: sk-yourkeyhere
   ```

### Step 2: Workflow Config
Workflow will:
- Checkout repo
- Setup Python + Chrome
- Install dependencies
- Run Robot tests
- Publish reports (`log.html`, `report.html`) as artifacts

### Run
- Push → CI runs  
- Or trigger manually from **Actions** tab  

---

## ✅ Notes
- Browser: Chrome (via `webdriver-manager`)  
- Test Site: [SauceDemo](https://www.saucedemo.com/)  
- Extensible: Add new `.robot` files in `tests/` and reuse keywords/pages/helpers.  
