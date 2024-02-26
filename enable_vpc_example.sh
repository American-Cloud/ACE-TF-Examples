#!/usr/bin/env bash

for i in *.example.vpc; do
  cp -- "$i" "${i%.example.vpc}"
done

cd variables || exit

for i in *.example.vpc; do
  cp -- "$i" "${i%.example.vpc}"
done
