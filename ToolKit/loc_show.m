function im_loc = loc_show(im, bbox, color, locate)

%% ͼ��ֲ��Ŵ���ʾ���ο�
% Zebin Chen
% ZB302 ZHBIT
% March 20��2017
%

%% ��ͼ���оֲ���ʾ���ο�
% X    = 120; %���ο����Ͻǵĺ�����   
% Y    = 60; %���ο����Ͻǵ�������
% dX   = 30;    
% dY   = 30;  
% bbox = [X, Y, dX, dY];
im_1 = insertShape(im, 'Rectangle', bbox, 'LineWidth', 2, ...
    'Color', color);

%% �ü��;ֲ�����ֵ�Ŵ�
scale     = 4;
im_crop   = imcrop(im, bbox); 
im_crop_b = imresize(im_crop, scale, 'bicubic'); 

%% �ֲ���ʾ
[row_1, col_1, ~]                         = size(im);
[row_2, col_2, ~]                         = size(im_crop_b);
im_loc                                  = im_1;
if locate == 'l'
    im_loc(row_1-row_2+1:row_1, 1:col_2, :) = im_crop_b;
    bbox  = [1,row_1-row_2+1,col_2,row_2];
elseif locate == 'r'
    im_loc(row_1-row_2+1:row_1, col_1-col_2+1:col_1, :) = im_crop_b;
    bbox  = [col_1-col_2+1,row_1-row_2+1,col_2,row_2];
end
im_loc  = insertShape(im_loc, 'Rectangle', bbox, 'LineWidth', 2, ...
    'Color', color);







