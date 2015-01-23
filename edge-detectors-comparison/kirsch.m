function B = kirsch(Image)
    % Convert int to double
    Image = double(Image);
    
    % Define convolution matrices
    g1 = [5 5 5; -3 0 -3; -3 -3 -3];
    g2 = [5 5 -3; 5 0 -3; -3 -3 -3];
    g3 = [5 -3 -3; 5 0 -3; 5 -3 -3];
    g4 = [-3 -3 -3; 5 0 -3; 5 5 -3];
    g5 = [-3 -3 -3; -3 0 -3; 5 5 5];
    g6 = [-3 -3 -3; -3 0 5; -3 5 5];
    g7 = [-3 -3 5; -3 0 5; -3 -3 5];
    g8 = [-3 5 5; -3 0 5; -3 -3 -3];
    
    
    % Run convolution masks
    orientation1 = conv2(Image, g1, 'same');
    orientation2 = conv2(Image, g2, 'same');
    orientation3 = conv2(Image, g3, 'same');
    orientation4 = conv2(Image, g4, 'same');
    orientation5 = conv2(Image, g5, 'same');
    orientation6 = conv2(Image, g6, 'same');
    orientation7 = conv2(Image, g7, 'same');
    orientation8 = conv2(Image, g8, 'same');
    
    % Take max values
    final = maxWise(orientation1, orientation2);
    final = maxWise(final, orientation3);
    final = maxWise(final, orientation4);
    final = maxWise(final, orientation5);
    final = maxWise(final, orientation6);
    final = maxWise(final, orientation7);
    final = maxWise(final, orientation8);
    
    % Set all values between 0 and 255
    final = valuesForImage(final);
    
    % Make all values between 0 and 1
    final = final ./255;
    
    % Find threshold value
    level = graythresh(final);
    
    % Apply threshold
    final = im2bw(final, level);
       
    % Convert double to logical
    B = logical(final);    
  
    




