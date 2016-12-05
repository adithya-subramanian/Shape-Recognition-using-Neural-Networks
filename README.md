# Shape-Recognition-using-Neural-Networks

Software Requirements:
1.MATLAB
2.Neural Fitting App matlab.

Theory:
Component Labelling Algorithm:
Different labels are assigned to various disjoint connected components of an Image.
Connected Component labelling is a fundamental step in a automated image analysis
      Shape of that particular region.
      Area of the particular region
      Boundary of the particular region
      Shape / Area / Boundary based features etc..

![Alt text](https://drive.google.com/open?id=0BzgaHB8luhGKdzFsTUtQRFlaMlk)
Procedure:
Scan the image from left to right and top to bottom (Assume 4-connectivity)
1.P be a pixel at any step in the scanning process
2.l(p)  = Pixel value at position p
3.L(p) = Label assigned to pixel location p.
4.If l(p)=0, move to next scanning position
5.If l(p)=1 and l(r)=l(t)=0 then
    Assign a new label to position p
6.If l(p) = 1 and only one of the two neighbor is 1 then
    Assign its label to p
7.If l(p)  = 1 and both r and t are 1’s then
8.    If L(r)  =  L(t)  then  L(p)  =  L(r)
9.    If L(r)  ≠ L(t)  then assign one of the labels to p and make a note
      that the two labels are equivalent

At the end of the scan all pixels with value 1 are labelled
Some labels are equivalent.

During the second pass process equivalent pairs to form equivalent classes.

Assign a different label to each class.
In the second pass through the image replace each label by the label assigned to its equivalence class

Region belongings of a particular pixel.
Working:
The input image is first labelled using the Classical Connected Component algorithm.  
