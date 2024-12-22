function corner_pt = get_corner_pt(img, ln)
    % lines are defined by two points [x1; y2]:
    % ln = [x1, x2; y1, y2];

    % get image dimensions:
    [im_h, im_w] = size(img, [1, 2]);

    % define image-corner lines:

    % define image-corner lines:

    ln_im_up = [0, im_w; 
                0, 0];
    ln_im_right = [im_w, im_w; 
                   0, im_h];
    ln_im_down = [im_w, 0; 
                  im_h, im_h];
    ln_im_left = [0, 0; 
                  im_h, 0];


    % check which radial-line has been passed:
    vp_delta = ln(:, 1) - ln(:, 2); % delta between vansihing point (always first point) and rear-wall corner-point

     if vp_delta(1, 1) >= 0 && vp_delta(2, 1) >= 0       % rl1
            % check where intersection with left corner:
            int_l = calc_line_intersect(ln, ln_im_left);
            if int_l(2, 1) < 0
                corner_pt = int_l;

            else
                corner_pt = calc_line_intersect(ln, ln_im_up);
            end

        elseif vp_delta(1, 1) < 0 && vp_delta(2, 1) >= 0    % rl2
            % check where intersection with upper corner:
            int_u = calc_line_intersect(ln, ln_im_up);
            if int_u(1, 1) < im_w
                corner_pt = calc_line_intersect(ln, ln_im_right);
            else
                corner_pt = int_u;
            end

        elseif vp_delta(1, 1) < 0 && vp_delta(2, 1) < 0     % rl3
            % check where intersection with right corner:
            int_r = calc_line_intersect(ln, ln_im_right);
            if int_r(2, 1) < im_h
                corner_pt = calc_line_intersect(ln, ln_im_down);
            else
                corner_pt = int_r;
            end

        elseif vp_delta(1, 1) >= 0 && vp_delta(2, 1) < 0    % rl4
            % check where intersection with lower corner:
            int_d = calc_line_intersect(ln, ln_im_down);
            if int_d(1, 1) < 0
                corner_pt = int_d;
            else
                corner_pt = calc_line_intersect(ln, ln_im_left);
            end

    end


end