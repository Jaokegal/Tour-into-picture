function walk_through_3D_plot(axSys, axLimits, app)

    % define bounding-box for the user to stay inside: [lower_bound'; upper_bound']
    % bb = [  -axLimits(1)/2, 0, -axLimits(3);
    %         axLimits(1)/2, axLimits(2), 0];
    
    enableDefaultInteractivity(axSys);

    % plot tour-entrance point (just for initial orientation):
    plot3(axSys, 0, axLimits(2)/2, -axLimits(3)+1, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    text(axSys, 0, axLimits(2)/2, -axLimits(3)+1, 'entrance point');
    % axis vis3d;

    % % Initial camera parameters
    % camPos = [0, axLimits(2)/2, 0];
    % camTarget = [0, axLimits(2)/2, 1];
    % camUp = [0, 1, 0];

    % Set initial camera view
    camproj(axSys, 'perspective');
    campos(axSys, app.camPos);
    camtarget(axSys, app.camTarget);
    camup(axSys, app.camUp);

    % Create figure window and set key press function
    fig = ancestor(axSys, 'figure');
    set(fig, 'KeyPressFcn', @key_move_callback);

    function key_move_callback(~, event)
        stepSize = 5;   % 0.5;
        angleStep = 5;
        rollStep = 5;

        switch event.Key
            case 'w'  % Move forward
                % v = app.camPos + stepSize * (app.camTarget - app.camPos) / norm(app.camTarget - app.camPos);
                % if ~any((bb(1, :) - v) >0) || ~any((bb(2, :) - v) < 0)
                %     app.camPos = v;
                % end
                app.camPos = app.camPos + stepSize * (app.camTarget - app.camPos) / norm(app.camTarget - app.camPos);
            case 's'  % Move backward
                % v = app.camPos - stepSize * (app.camTarget - app.camPos) / norm(app.camTarget - app.camPos);
                % if ~any((bb(1, :) - v) >0) || ~any((bb(2, :) - v) < 0)
                %     app.camPos = v;
                % end
                app.camPos = app.camPos - stepSize * (app.camTarget - app.camPos) / norm(app.camTarget - app.camPos);
            case 'a'  % Move left
                sideStep = cross(app.camUp, app.camTarget - app.camPos);
                sideStep = sideStep / norm(sideStep);
                app.camPos = app.camPos + stepSize * sideStep;
                app.camTarget = app.camTarget + stepSize * sideStep;
            case 'd'  % Move right
                sideStep = cross(app.camTarget - app.camPos, app.camUp);
                sideStep = sideStep / norm(sideStep);
                app.camPos = app.camPos + stepSize * sideStep;
                app.camTarget = app.camTarget + stepSize * sideStep;
            case 'uparrow'  % Look up
                rotationMatrix = makehgtform('axisrotate', cross(app.camTarget - app.camPos, app.camUp), deg2rad(angleStep));
                app.camUp = (rotationMatrix(1:3, 1:3) * app.camUp')';
                app.camTarget = app.camPos + (rotationMatrix(1:3, 1:3) * (app.camTarget - app.camPos)')';
            case 'downarrow'  % Look down
                rotationMatrix = makehgtform('axisrotate', cross(app.camTarget - app.camPos, app.camUp), -deg2rad(angleStep));
                app.camUp = (rotationMatrix(1:3, 1:3) * app.camUp')';
                app.camTarget = app.camPos + (rotationMatrix(1:3, 1:3) * (app.camTarget - app.camPos)')';
            case 'leftarrow'  % Look left
                rotationMatrix = makehgtform('axisrotate', app.camUp, deg2rad(angleStep));
                app.camTarget = app.camPos + (rotationMatrix(1:3, 1:3) * (app.camTarget - app.camPos)')';
            case 'rightarrow'  % Look right
                rotationMatrix = makehgtform('axisrotate', app.camUp, -deg2rad(angleStep));
                app.camTarget = app.camPos + (rotationMatrix(1:3, 1:3) * (app.camTarget - app.camPos)')';
            case 'q'  % Roll left
                rotationMatrix = makehgtform('axisrotate', app.camTarget - app.camPos, deg2rad(rollStep));
                app.camUp = (rotationMatrix(1:3, 1:3) * app.camUp')';
            case 'e'  % Roll right
                rotationMatrix = makehgtform('axisrotate', app.camTarget - app.camPos, -deg2rad(rollStep));
                app.camUp = (rotationMatrix(1:3, 1:3) * app.camUp')';
        end

        % Update camera view
        disp(['camPos:      ', num2str(app.camPos)]);
        disp(['camTarget:   ', num2str(app.camTarget)]);
        disp(['camUp:       ', num2str(app.camUp)]);
        disp(' ');
        campos(axSys, app.camPos);
        camtarget(axSys, app.camTarget);
        camup(axSys, app.camUp);

        % % track camera-movement:
        % plot3(axSys, app.camPos(1), app.camPos(2), app.camPos(3), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'k');
    end
end