load('ratvideo1_046.jpg')
I = imread('ratvideo1_046.jpg');
I = imresize(I,imageSize(1:2));
[bboxes,scores] = detect(detector,I);
figure
imshow(I);
disp(bboxes)

bboxes= [25 25 10 10];

if ~isempty(bboxes)
    I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
    figure
    imshow(I)
end