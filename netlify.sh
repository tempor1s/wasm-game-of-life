#!/usr/bin/env bash

set -e

cweb_version=0.6.16
cweb=https://github.com/koute/cargo-web/releases/download/$cweb_version/cargo-web-x86_64-unknown-linux-gnu.gz
curl -Lo cargo-web.gz $cweb
gunzip cargo-web.gz
chmod u+x cargo-web

binaryen_version=version_51
binaryen=https://github.com/WebAssembly/binaryen/releases/download/$binaryen_version/binaryen-$binaryen_version-x86_64-linux.tar.gz
curl -Lo binaryen.tar.gz $binaryen
tar -xzf binaryen.tar.gz

curl https://sh.rustup.rs -sSf | sh -s - --default-toolchain nightly -y
source ~/.cargo/env
rustup target add wasm32-unknown-unknown

./cargo-web deploy --target=wasm32-unknown-unknown --release

shopt -s nullglob
for filename in ./target/deploy/*.wasm
do
    ./binaryen-$binaryen_version/wasm-opt -Oz -d -o $filename $filename 2> /dev/null
done
