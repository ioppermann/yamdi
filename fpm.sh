#!/bin/bash

if [ -z $1 ] 
  then 
    echo "Usage: <version> [vendor] [maintainer] [url]";
    exit 1; 
fi

rm -rf build/

mkdir -p build/{deb,bin}
mkdir -p build/share/{doc/yamdi,man/man1}

make clean
make yamdi

cp yamdi build/bin/
cp {README,LICENSE,CHANGES} build/share/doc/yamdi/
gzip -cf man1/yamdi.1 > build/share/man/man1/yamdi1.gz

rm -f yamdi_*.deb
fpm -t deb -s dir -C build -n yamdi -v $1 -a all --prefix /usr --depends 'libc6 (>= 2.4)' \
  --vendor "$2" --maintainer "$3" --url "$4" \
  bin/ share/
