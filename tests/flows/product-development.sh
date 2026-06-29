#!/usr/bin/env bash

set -euo pipefail

repo_root=$(git rev-parse --show-toplevel)
resolver="$repo_root/scripts/sapdp-product-next"

tmp_root=$(mktemp -d)
trap 'rm -rf "$tmp_root"' EXIT

stages=(
  "Problem"
  "Solution"
  "DNA Selection"
  "Product Representation"
  "Product Requirement"
  "UX Specification"
  "Visual Design Specification"
  "MVP Definition"
  "Task Package"
  "Build"
  "Implementation Verification"
  "User Validation"
  "Release"
)

paths=(
  "docs/problem/ProblemDefinition_CORE_v1.md"
  "docs/solution/SolutionDefinition_CORE_v1.md"
  "docs/product/DNASelection_CORE_v1.md"
  "docs/product/ProductRepresentation_CORE_v1.md"
  "docs/product/ProductRequirement_CORE_v1.md"
  "docs/product/UXSpecification_CORE_v1.md"
  "docs/product/VisualDesignSpecification_CORE_v1.md"
  "docs/mvp/MVPDefinition_CORE_v1.md"
  "docs/tasks/TaskPackage_CORE_v1.md"
  "docs/build/BuildResult_CORE_v1.md"
  "docs/verification/ImplementationVerification_CORE_v1.md"
  "docs/validation/UserValidation_CORE_v1.md"
  "docs/release/ReleaseResult_CORE_v1.md"
)

templates=(
  "templates/problem/ProblemDefinition_Template.md"
  "templates/solution/SolutionDefinition_Template.md"
  "templates/product/DNASelection_Template.md"
  "templates/product/ProductRepresentation_Template.md"
  "templates/product/ProductRequirement_Template.md"
  "templates/product/UXSpecification_Template.md"
  "templates/product/VisualDesignSpecification_Template.md"
  "templates/mvp/MVPDefinition_Template.md"
  "templates/tasks/TaskPackage_Template.md"
  "templates/build/BuildResult_Template.md"
  "templates/verification/ImplementationVerification_Template.md"
  "templates/validation/UserValidation_Template.md"
  "templates/release/ReleaseResult_Template.md"
)

new_product_repo() {
  local dir=$1
  mkdir -p "$dir"
  git -C "$dir" init -q
  git -C "$dir" config user.name "SAPDP Test"
  git -C "$dir" config user.email "sapdp-test@example.invalid"
  printf '# Test Product\n' >"$dir/README.md"
  {
    printf 'schema=sapdp-lock-v1\n'
    printf 'version=v7.0.0\n'
    printf 'source=https://github.com/soyona/SAPDP\n'
    printf 'commit=%040d\n' 0
    printf 'authority_digest=sha256:%064d\n' 0
  } >"$dir/SAPDP.lock"
  git -C "$dir" add README.md SAPDP.lock
  git -C "$dir" commit -qm 'bootstrap'
}

render_stage() {
  local dir=$1 index=$2 previous_commit=$3 status=$4
  local path=${paths[$index]} template=${templates[$index]} file="$dir/${paths[$index]}"
  local build_commit=$previous_commit release_tag=v1.0.0
  mkdir -p "$(dirname "$file")"
  sed -E \
    -e "s#input_commit=<[^>]+>#input_commit=${previous_commit}#" \
    -e "s#conclusion_status=DRAFT#conclusion_status=${status}#" \
    -e "s#<40_LOWERCASE_HEX_COMMIT>#${build_commit}#g" \
    -e "s#<RELEASE_TAG>#${release_tag}#g" \
    -e 's#<[A-Z][A-Z0-9_ |.-]*>#Filled#g' \
    "$repo_root/$template" >"$file"
  git -C "$dir" add "$path"
  git -C "$dir" commit -qm "complete ${stages[$index]}"
}

complete_through() {
  local dir=$1 last=$2 previous_commit status index
  previous_commit=NOT_APPLICABLE
  for ((index=0; index<=last; index++)); do
    status=COMPLETE
    [[ $index -eq 10 || $index -eq 11 ]] && status=PASS
    if [[ $index -eq 12 ]]; then
      git -C "$dir" tag v1.0.0
    fi
    render_stage "$dir" "$index" "$previous_commit" "$status"
    previous_commit=$(git -C "$dir" rev-parse HEAD)
  done
}

assert_output() {
  local expected=$1
  shift
  local actual
  actual=$("$@")
  [[ $actual == "$expected" ]]
}

legacy_repo="$tmp_root/legacy"
mkdir -p "$legacy_repo"
git -C "$legacy_repo" init -q
assert_output $'NEXT_ACTION:\nMIGRATE SAPDP.lock' \
  "$resolver" --project-root "$legacy_repo"

empty_repo="$tmp_root/empty"
new_product_repo "$empty_repo"
assert_output $'NEXT_ACTION:\nCREATE docs/problem/ProblemDefinition_CORE_v1.md' \
  "$resolver" --project-root "$empty_repo"

partial_repo="$tmp_root/partial"
new_product_repo "$partial_repo"
mkdir -p "$partial_repo/docs/problem"
cp "$repo_root/templates/problem/ProblemDefinition_Template.md" \
  "$partial_repo/docs/problem/ProblemDefinition_CORE_v1.md"
assert_output $'NEXT_ACTION:\nCOMPLETE docs/problem/ProblemDefinition_CORE_v1.md UNRESOLVED_PLACEHOLDER' \
  "$resolver" --project-root "$partial_repo"
render_stage "$partial_repo" 0 NOT_APPLICABLE COMPLETE
assert_output $'NEXT_ACTION:\nCREATE docs/solution/SolutionDefinition_CORE_v1.md' \
  "$resolver" --project-root "$partial_repo"

missing_content_repo="$tmp_root/missing-content"
new_product_repo "$missing_content_repo"
complete_through "$missing_content_repo" 1
sed '/^# Success Definition$/d' \
  "$missing_content_repo/docs/solution/SolutionDefinition_CORE_v1.md" \
  >"$missing_content_repo/docs/solution/SolutionDefinition_CORE_v1.md.tmp"
mv "$missing_content_repo/docs/solution/SolutionDefinition_CORE_v1.md.tmp" \
  "$missing_content_repo/docs/solution/SolutionDefinition_CORE_v1.md"
git -C "$missing_content_repo" add docs/solution/SolutionDefinition_CORE_v1.md
git -C "$missing_content_repo" commit -qm 'remove required content'
assert_output $'NEXT_ACTION:\nCOMPLETE docs/solution/SolutionDefinition_CORE_v1.md MISSING_HEADING:# Success Definition' \
  "$resolver" --project-root "$missing_content_repo"

visual_repo="$tmp_root/visual"
new_product_repo "$visual_repo"
complete_through "$visual_repo" 5
assert_output $'NEXT_ACTION:\nCREATE docs/product/VisualDesignSpecification_CORE_v1.md' \
  "$resolver" --project-root "$visual_repo"
visual_input=$(git -C "$visual_repo" rev-parse HEAD)
render_stage "$visual_repo" 6 "$visual_input" COMPLETE
sed '/^# Applicability$/{n;n;s/^Filled$/Non-UI Product/;}' \
  "$visual_repo/docs/product/VisualDesignSpecification_CORE_v1.md" \
  >"$visual_repo/docs/product/VisualDesignSpecification_CORE_v1.md.tmp"
mv "$visual_repo/docs/product/VisualDesignSpecification_CORE_v1.md.tmp" \
  "$visual_repo/docs/product/VisualDesignSpecification_CORE_v1.md"
git -C "$visual_repo" add docs/product/VisualDesignSpecification_CORE_v1.md
git -C "$visual_repo" commit -qm 'record non-ui visual applicability'
assert_output $'NEXT_ACTION:\nCREATE docs/mvp/MVPDefinition_CORE_v1.md' \
  "$resolver" --project-root "$visual_repo"

complete_repo="$tmp_root/complete"
new_product_repo "$complete_repo"
complete_through "$complete_repo" 12
assert_output $'NEXT_ACTION:\nPRODUCT_DEVELOPMENT_COMPLETE' \
  "$resolver" --project-root "$complete_repo"

stale_repo="$tmp_root/stale"
cp -R "$complete_repo" "$stale_repo"
printf '\nHuman supplement.\n' >>"$stale_repo/docs/problem/ProblemDefinition_CORE_v1.md"
git -C "$stale_repo" add docs/problem/ProblemDefinition_CORE_v1.md
git -C "$stale_repo" commit -qm 'supplement problem'
assert_output $'NEXT_ACTION:\nREVALIDATE docs/solution/SolutionDefinition_CORE_v1.md INPUT_COMMIT_MISMATCH' \
  "$resolver" --project-root "$stale_repo"

verification_repo="$tmp_root/verification-fail"
cp -R "$complete_repo" "$verification_repo"
sed 's/conclusion_status=PASS/conclusion_status=FAIL/' \
  "$verification_repo/docs/verification/ImplementationVerification_CORE_v1.md" \
  >"$verification_repo/docs/verification/ImplementationVerification_CORE_v1.md.tmp"
mv "$verification_repo/docs/verification/ImplementationVerification_CORE_v1.md.tmp" \
  "$verification_repo/docs/verification/ImplementationVerification_CORE_v1.md"
git -C "$verification_repo" add docs/verification/ImplementationVerification_CORE_v1.md
git -C "$verification_repo" commit -qm 'record verification failure'
assert_output $'NEXT_ACTION:\nREWORK docs/build/BuildResult_CORE_v1.md IMPLEMENTATION_VERIFICATION_FAILED' \
  "$resolver" --project-root "$verification_repo"

validation_repo="$tmp_root/validation-fail"
cp -R "$complete_repo" "$validation_repo"
sed 's/conclusion_status=PASS/conclusion_status=FAIL/' \
  "$validation_repo/docs/validation/UserValidation_CORE_v1.md" \
  >"$validation_repo/docs/validation/UserValidation_CORE_v1.md.tmp"
mv "$validation_repo/docs/validation/UserValidation_CORE_v1.md.tmp" \
  "$validation_repo/docs/validation/UserValidation_CORE_v1.md"
git -C "$validation_repo" add docs/validation/UserValidation_CORE_v1.md
git -C "$validation_repo" commit -qm 'record user validation failure'
assert_output $'NEXT_ACTION:\nREWORK docs/mvp/MVPDefinition_CORE_v1.md USER_VALIDATION_FAILED' \
  "$resolver" --project-root "$validation_repo"

release_repo="$tmp_root/release-fail"
cp -R "$complete_repo" "$release_repo"
sed 's/conclusion_status=COMPLETE/conclusion_status=FAIL/' \
  "$release_repo/docs/release/ReleaseResult_CORE_v1.md" \
  >"$release_repo/docs/release/ReleaseResult_CORE_v1.md.tmp"
mv "$release_repo/docs/release/ReleaseResult_CORE_v1.md.tmp" \
  "$release_repo/docs/release/ReleaseResult_CORE_v1.md"
git -C "$release_repo" add docs/release/ReleaseResult_CORE_v1.md
git -C "$release_repo" commit -qm 'record release failure'
assert_output $'NEXT_ACTION:\nRETRY docs/release/ReleaseResult_CORE_v1.md RELEASE_FAILED' \
  "$resolver" --project-root "$release_repo"

baseline_repo="$tmp_root/baseline-reuse"
cp -R "$complete_repo" "$baseline_repo"
printf '\nBounded bug fix or refactor task.\n' \
  >>"$baseline_repo/docs/tasks/TaskPackage_CORE_v1.md"
git -C "$baseline_repo" add docs/tasks/TaskPackage_CORE_v1.md
git -C "$baseline_repo" commit -qm 'approve bounded maintenance task'
assert_output $'NEXT_ACTION:\nREVALIDATE docs/build/BuildResult_CORE_v1.md INPUT_COMMIT_MISMATCH' \
  "$resolver" --project-root "$baseline_repo"
