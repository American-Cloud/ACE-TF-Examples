#!/usr/bin/env bash

for i in *.example.non-vpc; do
  cp -- "$i" "${i%.example.non-vpc}"
done

cd variables || exit

for i in *.example.non-vpc; do
  cp -- "$i" "${i%.example.non-vpc}"
done
