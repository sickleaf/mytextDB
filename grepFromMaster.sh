#!/bin/bash

#$1     masterFileName

masterFile=master/"$1"
masterFileName=$1

# present Dir
scriptDir=$(cd $(dirname $0); pwd)
cd ${scriptDir}

# $1 should be non-zero
[ -n "$1" ] || { echo "!! arg(\$1) is blank. \$1 should be one of below."; find ${scriptDir}/master -type f | grep -v "\." | rev | cut -d/ -f1 | rev; exit; }

# $1 should be filename in master dir
[ -f ${masterFile} ] || { echo "!! arg(\$1) is not masterfile. \$1 should be one of below."; find ${scriptDir}/master -type f | grep -v "\." | rev | cut -d/ -f1 | rev; exit; }

jpName="jp_"
enName="en_"


dirName=${scriptDir}/${masterFileName}

mkdir -p ${dirName}

grepJP=${scriptDir}/${masterFileName}/${jpName}${masterFileName}
grepEN=${scriptDir}/${masterFileName}/${enName}${masterFileName}


#JP
cat ${masterFile} | grep -E "[ぁ-んァ-ン亜-熙]" > ${grepJP}
echo "${grepJP} generated."

#EN
cat ${masterFile} | grep -vE "[ぁ-んァ-ン亜-熙]" > ${grepEN}
echo "${grepEN} generated."
