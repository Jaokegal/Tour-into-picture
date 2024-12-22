function [vanishing_point, rear_wall] = select_rear_wall(img, vp_x, vp_y,ax)
    % This function asks the user to select a "start"-vanishing-point on
    % the passed image and creates 1 ROI-Point-object and 1
    % ROI-Rectangle-object. The Point-object serves as vanishing-point,
    % while the rectangle-object serves as rear-wall in the application.
    % The rear-wall is set to a default-size.
    % Retun value:
    % vanishing_point: movable point-object representing the vanishing-point.
    % rear_wall: rectangle-object representing the rear-wall of the room to be created.


    % get image dimensions:
    [im_h, im_w] = size(img, [1, 2]);
    
    % % load image & ask user to specify vanishing point:
    % fig = figure;
    % imshow(img);
    % title('Press Enter to confirm')
    % 
    % % ask user to select first position of vanishing-point:
    % [vp_x, vp_y] = ginput(1);
    % % vp_x = 350;
    % % vp_y = 500;
    
    % create default rear-wall as region of interest around vanishing point:
    def_rw_h = floor(im_h/3);
    def_rw_w = floor(im_w/3);
    
    % upper left corner of ROI:
    rw_x_pos = vp_x - floor(def_rw_w/2);
    rw_y_pos = vp_y - floor(def_rw_h/2);
    
    if rw_x_pos < 0
        rw_x_pos = 0;
    end
    if rw_y_pos < 0
        rw_y_pos = 0;
    end
    
    % plot rear-wall (interactive rectangle):
    rear_wall = images.roi.Rectangle(ax,'Position', [rw_x_pos, rw_y_pos, def_rw_w, def_rw_h],'Color', [0.0, 0.2, 0.8]);
    bringToFront(rear_wall);

    % plot vanishing-point:
    vanishing_point = images.roi.Point(ax, 'Position',[vp_x, vp_y], 'Color', [1.0, 0.0, 0.0],'markersize', 10)';
    bringToFront(vanishing_point);

end