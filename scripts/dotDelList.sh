#!/bin/bash
fName=$1
#UNKNOWN_PRODUCER\(CONSTANT\_DATA\) 
nNames="KLTFreeFloatImage KLTFreeFeatureList \
        KLTFreeTrackingContext KLTWriteFeatureListToPPM \
        pgmRead printSetupTxt \
        pnmReadHeader printHeader printInteger printFeatureTxt printShutdown \
        printSetupBin KLTFreeFeatureTable pgmReadHeader \
        printFeatureBin findStringWidth KLTComputeSmoothSigma \
		main solveEquation KLTSelectGoodFeatures \
		KLTGetKernelWidths KLTReplaceLostFeatures \
		KLTCreateFloatImage_s KLTCreatePyramid_s pgmReadFile \
		KLTTrackFeatures trackFeature_s convolveSeparate_s \
		KLTComputeGradients_s KLTComputeSmoothedImage_s"

# nNames="KLTFreeFloatImage KLTFreeFeatureList \
#         enforceMinimumDistance KLTFreeTrackingContext KLTWriteFeatureListToPPM \
#         pgmRead ppmWriteFileRGB KLTWriteFeatureTable ppmWrite printSetupTxt \
#         pnmReadHeader printHeader printInteger printFeatureTxt printShutdown \
#         printSetupBin KLTFreeFeatureTable fillFeaturemap pgmReadHeader \
#         printFeatureBin findStringWidth outOfBounds KLTComputeSmoothSigma \
#         main sortPointList solveEquation KLTSelectGoodFeatures \
#         KLTGetKernelWidths KLTReplaceLostFeatures \
#         KLTCreateFloatImage_s KLTCreatePyramid_s pgmReadFile \
#         KLTTrackFeatures trackFeature_s compute2by2GradientMatrix \
#         sumAbsFloatWindow compute2by1ErrorVector convolveSeparate_s \
#         KLTComputeGradients_s KLTComputeSmoothedImage_s "

cp $fName out.dot;

for nName in $nNames;
do
    echo "Deleting the Node ($nName) and its Edges from file ($fName)"
    #nNo=`awk '/'\"$nName\"'/ {print $1}' $fName`
    nNo=`awk '/'\ $nName\ '/ {print $1}' $fName`
    if [ "$nNo" == "" ];
    then
        echo "Node ($nName) not found in file ($fName)";
    else
        echo "Deleting Node ($nName) with No ($nNo)";
        grep -v $nNo out.dot > temp
        mv temp out.dot
    fi
done

dot -Tpdf out.dot -o out.pdf
