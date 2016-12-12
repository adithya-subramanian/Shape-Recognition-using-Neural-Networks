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

2.Segmentation:
The segmentation is done on the basis of the component labelling.All the pixles with the same labels are segmented out as a single region and this region is subtracted from the original image .This process is done iterativel unti all the labels haven't been removed from the image.

3.Invariant Moments:
There are seven invariant moments proposed by hu these moments are translational,Scalar and Rotational Invariant.The program Iteratively finds all the moments for the segmented images.

the moments are of nth order is defined as the summation over x and y for the values p(th moment for x) and q(th moment for y) as the powers of x and y respectively for the product of summation(x^(p)*y^(q)*I(x,y)).

To make the moments translational Invariant we subtract the x and y with their mean values resulting in summation((x-mean(x))^(p)*(y - mean(y))^(q)*I(x,y))

Then further these moments are divided by the based moments i.e = summation((x-mean(x))^(p)*(y - mean(y))^(q)*I(x,y))/summation(I(x,y)) brings the scalaing changes adaptablity.

Then we finally calculate all the seven moments for each of the images and these moments are:

These seven moments are then fed into the neural network further classifies what kind of shape it is.

