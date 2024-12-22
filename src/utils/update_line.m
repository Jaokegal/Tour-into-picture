function update_line(rect, point, radial_lines, img)
    % Update the line based on the new positions of the rear-wall and vanishing-point
    % Input: rect (Rückwand), vanishing point, radial_lines, img
    vp = point.Position';
    verts = rect.Vertices';
    % reorder clockwise:
    wall_corners = [verts(:, 1), verts(:, 4), verts(:, 3), verts(:, 2)];
    
    % recalculate radial-lines:
    line_corners = zeros(2, 4);
    for i=1:1:radial_lines.size()
        rli = [vp, wall_corners(:, i)];
        line_corners(:, i) = get_corner_pt(img, rli);
        set(radial_lines.get(i-1), 'XData', [vp(1,1), line_corners(1, i)], 'YData', [vp(2,1), line_corners(2, i)]);
    end

end