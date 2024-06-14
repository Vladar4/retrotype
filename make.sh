#!/bin/sh
# Build Retrotype Guide PDF

LIST="retrotype-guide"

for FILE in $LIST
do
    JOB="$FILE-$(date +%Y-%m-%d)" # append current date
    for i in $(seq 3)
    do
        xelatex -synctex=1 -interaction=nonstopmode -jobname="$JOB" "$FILE"
    done

    # compress
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false -sOutputFile="$JOB"-compressed.pdf "$JOB".pdf

    mv "$JOB"-compressed.pdf "$JOB".pdf
done

sh cleanup.sh
exit 0

