import os
import openai
from robot.api.deco import keyword

openai.api_key = os.getenv("OPENAI_API_KEY")

@keyword("AI Validate Text")
def ai_validate_text(expected, actual):
    """
    Use AI to semantically compare expected vs actual UI text.
    """
    prompt = f"Compare UI text:\nExpected: '{expected}'\nActual: '{actual}'\nAre they semantically equivalent? Answer YES or NO."

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}],
        temperature=0,
        max_tokens=20
    )

    answer = response.choices[0].message.content.strip().upper()
    if "YES" not in answer:
        raise AssertionError(f"AI validation failed: expected '{expected}', got '{actual}'")

@keyword("AI Explain Failure")
def ai_explain_failure(error_message):
    """
    Ask AI to provide a human-readable explanation for a test failure.
    """
    prompt = f"Explain this QA test failure in simple terms: {error_message}"

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}],
        temperature=0,
        max_tokens=80
    )

    return response.choices[0].message.content.strip()
