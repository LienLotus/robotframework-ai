# helpers/custom_keywords.py
from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import tempfile
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

def get_selib():
    """Get the current SeleniumLibrary instance used by RF."""
    return BuiltIn().get_library_instance('SeleniumLibrary')

@keyword
def go_to_login_page():
    """Navigate back to the login page and wait for the username input."""
    selib = get_selib()
    # Get ${BASE_URL} from Robot Framework variables
    base_url = BuiltIn().get_variable_value("${BASE_URL}")
    selib.go_to(base_url)
    # Wait until username input is present
    driver = selib.driver
    WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "user-name"))
    )

@keyword
def open_browser_to_url(url, browser="chrome"):
    selib = get_selib()

    if browser.lower() == "chrome":
        options = Options()
        options.add_argument("--headless=new")
        options.add_argument("--disable-gpu")
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-dev-shm-usage")
        options.add_argument("--incognito") 
        # Fix for GitHub Actions: unique user-data-dir each run
        options.add_argument(f"--user-data-dir={tempfile.mkdtemp()}")

        driver = webdriver.Chrome(options=options)
        selib.register_driver(driver, alias=None)
    else:
        selib.open_browser(url, browser=browser)

    selib.go_to(url)
    selib.maximize_browser_window()

@keyword
def close_all_browsers_safely():
    selib = get_selib()
    try:
        selib.close_all_browsers()
    except Exception:
        pass

@keyword
def wait_for_element_and_click(locator, timeout=10):
    selib = get_selib()
    driver = selib.driver
    WebDriverWait(driver, timeout).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, locator))
    )
    driver.find_element(By.CSS_SELECTOR, locator).click()

@keyword
def input_text_safe(locator, text, timeout=10):
    selib = get_selib()
    driver = selib.driver
    element = WebDriverWait(driver, timeout).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, locator))
    )
    element.clear()
    element.send_keys(text)

@keyword
def verify_title_contains(expected):
    selib = get_selib()
    title = selib.get_title()
    if expected not in title:
        raise AssertionError(f"Expected '{expected}' in title but got '{title}'")
