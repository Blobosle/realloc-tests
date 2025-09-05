#!/usr/bin/env bash

tests=(test_realloc0 test_realloc1 test_realloc2 test_realloc3 test_realloc4)

mkdir -p actual

pass=0
fail=0

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

for t in "${tests[@]}"; do
    exe="./$t"
    out="actual/$t.out"
    exp="expected/$t"

    "$exe" >"$out"

    if diff -u "$exp" "$out" >"actual/$t.diff"; then
        printf "%b[PASSED]%b %s\n" "$GREEN" "$RESET" "$t"
        rm -f "actual/$t.diff"
        ((pass++))
    else
        printf "%b[FAIL]%b %s (see actual/%s.diff)\n" "$RED" "$RESET" "$t" "$t"
        ((fail++))
    fi
done

echo
echo "Summary: $pass passed, $fail failed."

if (( fail > 0 )); then
    exit 1
else
    exit 0
fi

