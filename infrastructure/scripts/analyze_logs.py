#!/usr/bin/env python3
"""CloudGlossaey A-Lab Tiny Analytics demo.

Reads a web access log and reports requests per page and the busiest hour.
This is a toy version of what Apache Spark/Hadoop do across huge datasets.

Usage:
    python analyze_logs.py sample-access.log
"""
import re
import sys
from collections import Counter

# Matches lines like:
# 203.0.113.5 - - [07/Jun/2026:13:55:36 +0000] "GET /index.html HTTP/1.1" 200 1234
LINE_RE = re.compile(r'\[(\d{2})/\w+/\d{4}:(\d{2}):.*?\]\s+"(?:GET|POST)\s+(\S+)')


def analyze(path):
    pages = Counter()
    hours = Counter()
    total = 0

    with open(path, "r", encoding="utf-8") as fh:
        for line in fh:
            match = LINE_RE.search(line)
            if not match:
                continue
            _day, hour, page = match.groups()
            pages[page] += 1
            hours[hour] += 1
            total += 1

    if total == 0:
        print("No parseable log lines found.")
        return

    print(f"\n  Analysed {total} requests\n")
    print("  Top pages")
    print("  ---------")
    for page, count in pages.most_common(5):
        share = count / total * 100
        bar = "#" * int(share // 5)
        print(f"  {count:5d}  {share:5.1f}%  {bar:<20} {page}")

    busiest_hour, busiest_count = hours.most_common(1)[0]
    print(f"\n  Busiest hour: {busiest_hour}:00  ({busiest_count} requests)")
    print("\n  Insight: focus performance + monitoring on your top page and busiest hour.\n")


def main():
    if len(sys.argv) != 2:
        print("Usage: python analyze_logs.py <access-log-file>")
        sys.exit(1)
    analyze(sys.argv[1])


if __name__ == "__main__":
    main()