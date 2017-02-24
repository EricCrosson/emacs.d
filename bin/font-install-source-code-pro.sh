#!/usr/bin/env bash
# Improved by Eric Crosson
# 2016-12-14
#
# Install (Adobe) Source Code Pro for $USER.
#
# Takes no arguments.
#
# Originally from
# http://askubuntu.com/questions/193072/how-to-use-the-new-adobe-source-code-pro-font/193073#193073

set -o nounset
set -o errexit

workdir=$(mktemp -d adobefont.XXXXX)
mkdir -p ${workdir}
pushd ${workdir} >/dev/null

wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
unzip 1.030R-it.zip

mkdir -p ~/.fonts

cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf ~/.fonts/
fc-cache -f -v

popd >/dev/null
rm -rf ${workdir}
