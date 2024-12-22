function plot_room(morphed_imgs, corner_points, ax, axLimits)
    % ...
    
    % create figure for plot:
    % figure;
    hold(ax,"on");

    for i=1:1:size(morphed_imgs, 2)
        % get respective mesh:
        X = corner_points{i}{1};
        Y = corner_points{i}{2};
        Z = corner_points{i}{3};

        % Create a surface and map the image as texture
        surf(ax, X, Y, Z, 'CData', morphed_imgs{i}, 'FaceColor', 'texturemap');
    end
    axis(ax, 'equal');
    title(ax,'Tour Into Picture');
    % set default camera position and angle:
    % set(ax, 'CameraPosition', [-axLimits(1), axLimits(2), -axLimits(3)]);
    % camorbit(ax, -60,0,'data',[0 0 1]);
    % camorbit(ax, 25,0,'data',[0 1 0]);
    % camorbit(ax, -15,0,'data',[1 0 0]);
    % view(0, -30);
    % view(ax, 3);
    % view(eye(4))
    xlabel(ax, 'X'), ylabel(ax,'Y'), zlabel(ax,'Z');
    % remove axis-scaling:
    set(ax,'XTick',[], 'YTick', [], 'ZTick', []);
    % set respective ax-limits:
    xlim(ax, [-axLimits(1)/2, axLimits(1)/2]);
    ylim(ax, [0, axLimits(2)]);
    zlim(ax, [-axLimits(3), 0]);
    grid(ax, "on");
    % hold(ax, "off");
end