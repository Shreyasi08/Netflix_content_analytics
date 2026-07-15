from pathlib import Path

DATA_DIR = Path("data")

EXPECTED_FILES = [
    "movies.csv",
    "ratings.csv",
    "tags.csv",
    "links.csv",
    "genome-tags.csv",
    "genome-scores.csv",
]

print("Checking MovieLens dataset...\n")

for file in EXPECTED_FILES:

    filepath = DATA_DIR / file

    if filepath.exists():
        size_mb = filepath.stat().st_size / (1024 * 1024)

        print(f"✓ {file:<20} {size_mb:.2f} MB")

    else:
        print(f"✗ Missing: {file}")

print("\nValidation complete.")