#!/bin/bash

echo "Japan
South Korea
Australia
New Zealand" > countries.txt
./scripted.R -o asia_oceania.pdf

echo "France
Belgium
Netherlands
Luxemburg" > countries.txt
./scripted.R -o benelux.pdf

echo "United States
United Kingdom
France
Germany
Canada
Japan
" > countries.txt
./scripted.R -o g7.pdf

