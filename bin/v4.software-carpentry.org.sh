#!/usr/bin/env bash

export LC_ALL='en_US.utf8'  # cronjob env has it set wrong!
export PATH=$PATH:/usr/local/bin/

SOURCE='/home/data/sources/v4.software-carpentry.org'
SITE='/home/data/v4.software-carpentry.org'

# Update, overwriting local changes.
cd "${SOURCE}"
git fetch --all
git reset --hard origin/gh-pages

# Rebuild data files and then the site.
jekyll build

# Install.
rm -rf ${SITE}/*
mv ${SOURCE}/_site/* "${SITE}"
