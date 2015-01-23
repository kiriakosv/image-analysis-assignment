function C = maxWise(A, B)

    S = size(A);
    C = ones(S(1), S(2));
    for i = 1:S(1)
        for j = 1:S(2)
            C(i, j) = max(A(i, j), B(i, j));
        end
    end
    
    