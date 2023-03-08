#!/bin/bash
npm install
sed -i "s/\"http:\/\/localhost:8080\"/window.location.origin/g" ./src/config.js
npm run build
