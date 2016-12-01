#!/bin/bash
fName=$1
#UNKNOWN_PRODUCER\(CONSTANT\_DATA\)

nNames="KLTFreeFloatImage KLTFreeFeatureList \
        enforceMinimumDistance KLTFreeTrackingContext KLTWriteFeatureListToPPM \
        pgmRead ppmWriteFileRGB KLTWriteFeatureTable ppmWrite printSetupTxt \
        pnmReadHeader printHeader printInteger printFeatureTxt printShutdown \
        printSetupBin KLTFreeFeatureTable fillFeaturemap pgmReadHeader \
        printFeatureBin findStringWidth outOfBounds KLTComputeSmoothSigma \
		main sortPointList solveEquation KLTSelectGoodFeatures \
		KLTGetKernelWidths KLTReplaceLostFeatures \
		KLTCreateFloatImage_s KLTCreatePyramid_s pgmReadFile \
		KLTTrackFeatures trackFeature_s compute2by2GradientMatrix \
		sumAbsFloatWindow compute2by1ErrorVector convolveSeparate_s \
		KLTComputeGradients_s KLTComputeSmoothedImage_s	"

cp $fName out.dot;

for nName in $nNames;
do
    echo "Deleting the Node ($nName) and its Edges from file ($fName)"
    nNo=`awk '/'\"$nName\"'/ {print $1}' $fName`
    if [ "$nNo" == "" ];
    then
        echo "Node ($nName) not found in file ($fName)";
    else
        echo "Deleting Node ($nName) with No ($nNo)";
        grep -v $nNo out.dot > temp
        mv temp out.dot
    fi
done

nName1="UNKNOWN_PRODUCER\(CONSTANT\_DATA\)"
n1=`awk '/'\"$nName1\"'/ {print $1}' out.dot`
nName2="KLTToFloatImage\_s"
n2=`awk '/'\"$nName2\"'/ {print $1}' out.dot`
lines2Del=`grep -n $n1 out.dot | grep -v -E "$nName1|$n2" | cut -f1 -d:`
delString=`echo $lines2Del" " | sed 's/ /d; /g'`
sed --in-place "$delString" out.dot

dot -Tpdf out.dot -o out.pdf

# lineNos=${lines2Del// /*}
# echo ${lines2Del// /_}

# Following can also be used to get line nubmers
# cat input.dot | awk '/00000000/ && !/CONSTANT/ && !/0000000b/ {print NR}' | sed ':a;N;$!ba;s/\n/d; /g'