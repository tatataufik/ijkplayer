#!/bin/bash

IJK_OPENSSL_UPSTREAM=https://github.com/openssl/openssl
IJK_OPENSSL_FORK=https://github.com/bbcallen/openssl.git
IJK_OPENSSL_COMMIT=OpenSSL_1_0_1g
IJK_OPENSSL_LOCAL_REPO=extra/openssl

set -e
TOOLS=tools

echo "== pull openssl base =="
echo "$TOOLS/pull-repo-base.sh $IJK_OPENSSL_UPSTREAM $IJK_OPENSSL_LOCAL_REPO"
bash $TOOLS/pull-repo-base.sh $IJK_OPENSSL_UPSTREAM $IJK_OPENSSL_LOCAL_REPO
pull_fork()
{
    echo "== pull openssl fork $1 =="
    echo "bash $TOOLS/pull-repo-ref.sh $IJK_OPENSSL_FORK android/openssl-$1 ${IJK_OPENSSL_LOCAL_REPO}"
    bash $TOOLS/pull-repo-ref.sh $IJK_OPENSSL_FORK android/openssl-$1 ${IJK_OPENSSL_LOCAL_REPO}
    cd android/openssl-$1
    git checkout ${IJK_FFMPEG_COMMIT}
    cd -
}

pull_fork "armv7a"
pull_fork "armv5"
pull_fork "x86"
