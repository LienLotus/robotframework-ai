# helpers/faker_helper.py
from faker import Faker
from robot.api.deco import keyword

fake = Faker()

@keyword("Generate Fake User")
def generate_fake_user():
    """Generate fake user data for testing checkout forms."""
    return {
        "first_name": fake.first_name(),
        "last_name": fake.last_name(),
        "zip_code": fake.postcode()
    }

@keyword("Generate Fake Email")
def generate_fake_email():
    """Generate a fake email address."""
    return fake.email()

@keyword("Generate Fake Password")
def generate_fake_password(length=10):
    """Generate a fake password with specified length (default 10)."""
    return fake.password(length=length)
