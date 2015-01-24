function law(Image)
    
    clc
    Image = imread(Image);
    try
       Image = rgb2gray(Image);
    catch
    end
    figure('name', 'original image')
    imshow(Image)
    figure('name', 'final energy masks')
    Image = double(Image);
    % Define law's vectors
    L5 = [1, 4, 6, 4, 1];
    E5 = [-1, -2, 0, 2, 1];
    S5 = [-1, 0, 2, 0, -1];
    R5 = [1, -4, 6, -4, 1];

    % Define masks
    L5L5 = L5' * L5; 
    L5E5 = L5' * E5;
    L5S5 = L5' * S5;
    L5R5 = L5' * R5;
    E5E5 = E5' * E5;
    E5L5 = E5' * L5;
    E5S5 = E5' * S5;
    E5R5 = E5' * R5;
    S5S5 = S5' * S5;
    S5L5 = S5' * L5;
    S5E5 = S5' * E5;
    S5R5 = S5' * R5;
    R5R5 = R5' * R5;
    R5L5 = R5' * L5;
    R5E5 = R5' * E5;
    R5S5 = R5' * S5;
    
    % Preprocess image
    average = conv2(Image, ones(15)/225, 'same');
    Image = abs(Image - average);
   
    % Run masks
    fk1 = imfilter(Image, double(L5L5), 'same');
    fk2 = imfilter(Image, double(L5E5), 'same');
    fk3 = imfilter(Image, double(L5S5), 'same');
    fk4 = imfilter(Image, double(L5R5), 'same');
    fk5 = imfilter(Image, double(E5E5), 'same');
    fk6 = imfilter(Image, double(E5L5), 'same');
    fk7 = imfilter(Image, double(E5R5), 'same');
    fk8 = imfilter(Image, double(E5S5), 'same');
    fk9 = imfilter(Image, double(S5S5), 'same');
    fk10 = imfilter(Image, double(S5L5), 'same');
    fk11 = imfilter(Image, double(S5R5), 'same');
    fk12 = imfilter(Image, double(S5E5), 'same');
    fk13 = imfilter(Image, double(R5R5), 'same');
    fk14 = imfilter(Image, double(R5L5), 'same');
    fk15 = imfilter(Image, double(R5S5), 'same');
    fk16 = imfilter(Image, double(R5E5), 'same');
   
    
    
    % Create energy maps
    e1 = imfilter(abs(fk1), ones(7)/49, 'same');
    e2 = imfilter(abs(fk2), ones(7)/49, 'same');
    e3 = imfilter(abs(fk3), ones(7)/49, 'same');
    e4 = imfilter(abs(fk4), ones(7)/49, 'same');
    e5 = imfilter(abs(fk5), ones(7)/49, 'same');
    e6 = imfilter(abs(fk6), ones(7)/49, 'same');
    e7 = imfilter(abs(fk7), ones(7)/49, 'same');
    e8 = imfilter(abs(fk8), ones(7)/49, 'same');
    e9 = imfilter(abs(fk9), ones(7)/49, 'same');
    e10 = imfilter(abs(fk10), ones(7)/49, 'same');
    e11 = imfilter(abs(fk11), ones(7)/49, 'same');
    e12 = imfilter(abs(fk12), ones(7)/49, 'same');
    e13 = imfilter(abs(fk13), ones(7)/49, 'same');
    e14 = imfilter(abs(fk14), ones(7)/49, 'same');
    e15 = imfilter(abs(fk15), ones(7)/49, 'same');
    e16 = imfilter(abs(fk16), ones(7)/49, 'same');
    
    
    % Create nine final energy maps
    fe1 = (e2 + e6) / 2;
    fe2 = (e4 + e14) / 2;
    fe3 = (e8 + e12) / 2;
    fe4 = e9;
    fe5 = e13;
    fe6 = (e3 + e10) / 2;
    fe7 = e5;
    fe8 = (e7 + e16) / 2;
    fe9 = (e11 + e15) / 2;
    
    % Display results
    subplot(3, 3, 1)
    imshow(uint8(fe1))
    
    subplot(3, 3, 2)
    imshow(uint8(fe2))
    
    subplot(3, 3, 3)
    imshow(uint8(fe3))
    
    subplot(3, 3, 4)
    imshow(uint8(fe4))
    
    subplot(3, 3, 5)
    imshow(uint8(fe5))
    
    subplot(3, 3, 6)
    imshow(uint8(fe6))
    
    subplot(3, 3, 7)
    imshow(uint8(fe7))
    
    subplot(3, 3, 8)
    imshow(uint8(fe8))
    
    subplot(3, 3, 9)
    imshow(uint8(fe9))
    
