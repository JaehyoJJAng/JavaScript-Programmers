#!/bin/bash
# 커밋 자동화 스크립트

git=$(which git)

if [[ -z $(git status --porcelain) ]]
then
  exit 1
else
  ${git} add ./
  commitMsg=$(${git} status --porcelain | grep "practice" | awk '{print $2}' | awk -F'/' '{print $2}' | awk -F'.' '{print $1}')
fi

${git} commit -m ${commitMsg}
${git} push -u origin main