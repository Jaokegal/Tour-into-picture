function H = calculateHomography(points)
    % Punkte für die Homographie berechnen
    % points ist ein 5x2-Array: [Fluchtpunkt; Ecke1; Ecke2; Ecke3; Ecke4]
    
    srcPoints = points(2:5, :);
    dstPoints = [0 0; 1 0; 1 1; 0 1]; % Zielpunkte, normalisiert
    
    tform = fitgeotrans(srcPoints, dstPoints, 'projective');
    H = tform.T;
end
