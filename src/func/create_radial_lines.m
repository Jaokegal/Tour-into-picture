function radial_lines = create_radial_lines(img, vp, rw,ax)
    % This function creates radial lines, based on the position and shape
    % of the corresponding vanishing-point and rear-wall-rectangle. The
    % lengths of the radial lines are specified by their intersection
    % points with the respective image-side.
    % Input Paramers:
    % img: image to be subdevided later on.
    % vp: vanishing-point defining the radial lines
    % rw: rear-wall-rectangle defining the radial-lines.
    % Return value:
    % radial_lines: list of Line-objects with respective carracteristics.

    % extract current corner-coordinates:
    verts = rw.Vertices';
    % reorder clockwise:
    wall_corners = [verts(:, 1), verts(:, 4), verts(:, 3), verts(:, 2)];
    % extract current vanishing point-coordinates:
    vp_coords = vp.Position';

  
    % calculate radial-lines:
    line_corners = zeros(2, 4);
    % create list of radial lines through corners:
    radial_lines = java.util.LinkedList;
    li = radial_lines.listIterator;
    for i=1:1:4
        rli = [vp_coords, wall_corners(:, i)];
        line_corners(:, i) = get_corner_pt(img, rli);
        new_line = line(ax,'XData', [vp_coords(1,1), line_corners(1, i)], 'YData', [vp_coords(2,1), line_corners(2, i)], 'Color', [0.0, 0.0, 0.8], 'LineWidth', 1);
        li.add(new_line);
    end
    
    % Set up listeners for the rectangle's movement:
    addlistener(rw, 'MovingROI', @(src, evt) update_line(src, vp, radial_lines, img));
    addlistener(rw, 'ROIMoved', @(src, evt) update_line(src, vp, radial_lines, img));
    
    % Set up listeners for the point's movement:
    addlistener(vp, 'MovingROI', @(src, evt) update_line(rw, src, radial_lines, img));
    addlistener(vp, 'ROIMoved', @(src, evt) update_ine(rw, src, radial_lines, img));
end