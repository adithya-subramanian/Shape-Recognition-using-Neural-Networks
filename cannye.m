function imgaeg 
%BW = imread('C:\Users\Adithyaanirudhha\Documents\Visual Studio 2015\Projects\ConsoleApplication2\org.png');
%BW = imread('C:\Users\Adithyaanirudhha\OneDrive\Pictures\Documents\img pbl\New folder\images.png');
BW = imread('C:\Users\Adithyaanirudhha\Documents\portfolio\startbootstrap-agency-gh-pages\im1.png');
%imshow(BW);
if(size(BW,3) == 3)
BW = rgb2gray(BW);
end
[M N] =size(BW);
BW = edge(BW,'canny',0.5);
[L,num] = bwlabel(BW);
img = zeros(M,N,num);
for s = 1:num
[r,c] = find(L == s);
mask = false(size(BW));
mask(min(r):max(r),min(c):max(c)) = true;
p1 = mask + BW;
p1(min(r) : max(r),min(c) : max(c)) = false;
p2 = BW - p1;
img(:,:,s) = p2;
BW = BW - p2;
end
for s = 1:num
    imshow(img(:,:,s)); %= im2bw(img(:,:,s));
end
 imshow(img(:,:,1));
global moment00;
global moment10;
global moment01;
global p;
global q;
global x_bar;
global y_bar;
global rp;
mv = 1;
prompt1 = 'p value?';
prompt2 = 'q value?';
for n = 1:3
    if(n == 1)
        p = 0;
        q = 0;
    elseif(n == 2)
        p = 0;
        q = 1;
    elseif(n == 3)
        p = 1;
        q = 0;
    end
    for s = 1:num
        if(p == 0 && q==0)
             moment00(s) = moments(img(:,:,s),p,q,0,0,1,0);
        elseif(p == 1 && q==0)
             moment10(s) = moments(img(:,:,s),p,q,0,0,1,0);    
        elseif(p == 0 && q == 1)
             moment01(s) = moments(img(:,:,s),p,q,0,0,1,0);    
        end
end
end

for i = 1:num
    x_bar(i) = moment10(i)/moment00(i);
    y_bar(i) = moment01(i)/moment00(i);
end
global moment20;
global moment21;
global moment03;
global moment11;
global moment30;
global moment02;
global moment12;
global mewmoment00;
mv = 1;
for n = 1:8
    if(n == 1)
        p = 2;
        q = 0;
    elseif(n == 2)
        p = 0;
        q = 2;
    elseif(n == 3)
        p = 1;
        q = 1;
    elseif(n == 4)
        p = 3;
        q = 0;
    elseif(n == 5)
        p = 1;
        q = 2;
    elseif(n == 6)
        p = 2;
        q = 1;
    elseif(n == 7)
        p = 0;
        q = 3;
    elseif(n == 8)
        p = 0;
        q = 0;
    end
    %p = input(prompt1);
    %q = input(prompt2);
    rp(n) = (p + q + 1)/2; 
for s = 1:num
if(p == 2 && q==0)
moment20(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);    
elseif(p == 0 && q == 2)
moment02(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);    
elseif(p == 1 && q == 1)
moment11(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);    
elseif(p == 3 && q == 0)
moment30(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);    
elseif(p == 1 && q == 2)
moment12(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);    
elseif(p == 0 && q == 3)
moment03(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);
elseif(p == 2 && q == 1)
moment21(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);    
elseif(p == 0 && q == 0)
mewmoment00(s) = moments(img(:,:,s),p,q,x_bar,y_bar,s,1);
end
end
end

global mewmoment20;
global mewmoment21;
global mewmoment03;
global mewmoment11;
global mewmoment30;
global mewmoment02;
global mewmoment12;

for i = 1:num
    mewmoment20(i) = moment20(i)/(mewmoment00(i))^(rp(1));
    mewmoment02(i) = moment02(i)/(mewmoment00(i))^(rp(2));
    mewmoment11(i) = moment11(i)/(mewmoment00(i))^(rp(3));
    mewmoment30(i) = moment30(i)/(mewmoment00(i))^(rp(4));
    mewmoment12(i) = moment12(i)/(mewmoment00(i))^(rp(5));
    mewmoment03(i) = moment03(i)/(mewmoment00(i))^(rp(6));
    mewmoment21(i) = moment21(i)/(mewmoment00(i))^(rp(7));
end
for i = 1 : num
    inv1(i) = mewmoment20(i) + mewmoment02(i);
    inv2(i) = (mewmoment20(i) - mewmoment02(i))^(2) + 4*((mewmoment11(i))^(2));
    inv3(i) = (mewmoment30(i) - 3*mewmoment12(i))^(2) + (mewmoment03(i) - 3*mewmoment21(i))^2;
    inv4(i) = ((mewmoment30(i) + mewmoment12(i))^(2)) + ((mewmoment03(i) + mewmoment21(i))^(2));
    inv5(i) = ((3*mewmoment30(i) - 3*mewmoment12(i))*(mewmoment30(i)+mewmoment12(i))*(((mewmoment30(i)+mewmoment12(i))^(2))- ((3)*(mewmoment21(i) + mewmoment03(i))^2)) + ((3*mewmoment21(i) - mewmoment03(i))*(mewmoment21(i)+ mewmoment03(i))*((3)*((mewmoment30(i)+mewmoment12(i))^(2))-((mewmoment21(i) + mewmoment03(i))^(2)))));
    inv6(i) = ((mewmoment20(i) - mewmoment02(i))*(((mewmoment30(i)+mewmoment12(i))^(2))-((mewmoment21(i)+mewmoment03(i))^(2))))+((4)*(mewmoment11(i))*(mewmoment30(i)+mewmoment12(i))*(mewmoment21(i)+mewmoment03(i)));
    inv7(i) = ((3*mewmoment21(i) - mewmoment03(i))*(mewmoment30(i)+mewmoment12(i))*(((mewmoment30(i)+ mewmoment12(i))^(2)) - (3*(mewmoment21(i) + mewmoment03(i))^(2))))+((3*mewmoment12(i)-mewmoment03(i))*(mewmoment21(i)+mewmoment30(i))*(3*((mewmoment30(i)+mewmoment12(i))^(2)) - ((mewmoment21(i)+mewmoment30(i))^(2))));
end
for i = 1:num
A = [inv1(i) inv2(i) inv3(i) inv4(i) inv5(i) inv6(i) inv7(i)];
%B = [1];
dlmwrite('dataset987.csv',A,'delimiter',',','-append');
%dlmwrite('dataset8.csv',B,'delimiter',',','-append');
end
% load dataset5;
% load dataset6;
% 
% inputs = dataset5;
% targets = dataset6;
%  
% %Create a Fitting Network
% hiddenLayerSize = 3;
% net = fitnet(hiddenLayerSize);
% 
% % Set up Division of Data for Training, Validation, Testing
% net.divideParam.trainRatio = 70/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 15/100;
%  
% % Train the Network
% [net,tr] = train(net,inputs,targets);
%  
% % Test the Network
% outputs = net(inputs);

    
% errors = gsubtract(outputs,targets);
% performance = perform(net,targets,outputs)
%  
% View the Network
%view(net) 
% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
% figure, plotfit(targets,outputs)
% figure, plotregression(targets,outputs)
% figure, ploterrhist(errors)

end
function  [moment] = moments(image,p,q,x_bar,y_bar,s,n)
moment = 0;
[row column] = size(image);
for i = 1 : row
    for j = 1 : column
        if(n == 1)
        moment = moment + (((i-x_bar(s))^(p))*((j-y_bar(s))^(q))*(image(i,j)));
        else
        moment = moment + (((i)^(p))*((j)^(q))*(image(i,j)));
        end
    end
end
end


  