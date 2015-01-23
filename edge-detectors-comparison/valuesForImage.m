function bw = valuesForImage(Image)
    sz = size(Image);
    bw = zeros(sz(1), sz(2));
    for i = 1:sz(1)
        for j = 1:sz(2)
            if Image(i, j) < 0
                bw(i, j) = 0;
            elseif Image(i, j) > 255
                bw(i, j) = 255;
            else
                bw(i, j) = Image(i, j);
            end
        end
    end
          