var numParticles = 676;
var width = 1677;
var height = 1844

//load images
run("Image Sequence...", "open=[C:/Users/luisf/Desktop/HW ALL/HW All M/] sort");

//threshold and analyze particles to get overlays
setAutoThreshold("Default dark");
setOption("BlackBackground", true);
run("Convert to Mask", "method=Default background=Light calculate black");
run("Analyze Particles...", "size=0.455-infinity show=Overlay display include stack");//change size to set particle size range
run("To ROI Manager");

//create new set of blank images
newImage("Masks", "8-bit white", 1677, 1844, 227);

//loop through images/ROIs, draw 1 ROI on each image
selectWindow("Masks");
run("Overlay Options...", "stroke=black width=1 fill=black set apply");
for (i = 0; i < 227; i++) {
	roiManager("Select", i);
	setSlice(i+1);
	run("Add Selection...");
}
run("Flatten", "stack");
run("8-bit");
