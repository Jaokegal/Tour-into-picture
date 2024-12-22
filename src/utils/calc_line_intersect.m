function intersection = calc_line_intersect(l1, l2)
    % This function claculates the intersection of two lines and returns
    % the intersection point.
    % lines are defined by two points [x1; y2]:
    % l = [x1, x2; y1, y2];
    
    % Calculate the intersection point
    A = [l1(:, 2)-l1(:, 1), -(l2(:, 2)-l2(:, 1))];
    b = l2(:, 1) - l1(:, 1);
    
    if det(A) ~= 0
        s = A\b;
        intersection = l1(:, 1) + s(1)*(l1(:, 2)-l1(:, 1));
    else
        intersection = [inf; inf];
        disp('The lines are parallel or coincident & do not intersect at a unique point!');
    end
end