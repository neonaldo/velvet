# load shared functions and variables
. `dirname $0`/run-tests.functions

# velveth binary
$VH $DIR/fai.bin $K -shortPaired -fasta.gz $FAI > /dev/null
$VH $DIR/fqi.bin $K -shortPaired -fastq.gz $FQI > /dev/null

# check fai
cmp --quiet $ROADMAP $DIR/fai.bin/Roadmaps
if [ $? -ne 0 ]; then
  problem "$FAI binary mode Roadmap differs to $ROADMAP"
else
  inform "ok"
fi

# check fqi
cmp --quiet $ROADMAP $DIR/fqi.bin/Roadmaps
if [ $? -ne 0 ]; then
  problem "$FQI binary mode Roadmap differs to $ROADMAP"
else
  inform "ok"
fi

