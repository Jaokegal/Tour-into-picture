function polygons = get_trapezoidal_polys(img, rear_wall, radial_lines)
    % This function extracts the corner-points of the rear wall and trapezoids which later on form
    % floor, ceiling and sidewalls. The corner points are already specified, by
    % the rear wall and the radial lines resulting from the rear wall and the
    % vanishing-point.
    % Input parameters:
    % img: image to be subdevided in polygons.
    % rear_wall: rear-wall-rectangle defining the background.
    % radial_lines: list of line objects containing the deviding radial-lines.
    % Return value:
    % polygons: cell-array containing the divided trapezoids in clockwise
    % order, starting from the center and continuing with the left-wall.

    % get image dimensions:
    [im_h, im_w] = size(img, [1, 2]);
    % define image-corner lines:
    ln_im_up = [0, im_w; 
                0, 0];
    ln_im_right = [im_w, im_w; 
                   0, im_h];
    ln_im_down = [im_w, 0; 
                  im_h, im_h];
    ln_im_left = [0, 0; 
                  im_h, 0];

    % get points from radial lines:
    % sorted clockwise, starting from up left:
    rl = {zeros(4), zeros(4), zeros(4), zeros(4)};
    for i=1:1:radial_lines.size()
        rli_x = get(radial_lines.get(i-1), 'XData');
        rli_y = get(radial_lines.get(i-1), 'YData');
        rl{i} = [rli_x; rli_y];
    end
    
    % extract current corner-coordinates:
    verts = rear_wall.Vertices';
    % reorder clockwise:
    wall_corners = [verts(:, 1), verts(:, 4), verts(:, 3), verts(:, 2)];

    % define 1. polygon:
    poly_1 = wall_corners;

    % define 2. polygon:
    int_rl1_lleft = calc_line_intersect(rl{1}, ln_im_left);
    int_rl4_lleft = calc_line_intersect(rl{4}, ln_im_left);

    poly_2 = [int_rl1_lleft, wall_corners(:, 1), wall_corners(:, 4), int_rl4_lleft];

    % define 3. polygon:
    int_rl1_lup = calc_line_intersect(rl{1}, ln_im_up);
    int_rl2_lup = calc_line_intersect(rl{2}, ln_im_up);

    poly_3 = [int_rl1_lup, int_rl2_lup, wall_corners(:, 2), wall_corners(:, 1)];

    % define 4. polygon:
    int_rl2_lright = calc_line_intersect(rl{2}, ln_im_right);
    int_rl3_lright = calc_line_intersect(rl{3}, ln_im_right);

    poly_4 = [wall_corners(:, 2), int_rl2_lright, int_rl3_lright, wall_corners(:, 3)];

    % define 5. polygon:
    int_rl3_ldown = calc_line_intersect(rl{3}, ln_im_down);
    int_rl4_ldown = calc_line_intersect(rl{4}, ln_im_down);

    poly_5 = [wall_corners(:, 4), wall_corners(:, 3), int_rl3_ldown, int_rl4_ldown];

    % return polygons:
    polygons = {poly_1, poly_2, poly_3, poly_4, poly_5};

end

