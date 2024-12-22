function transformedImg = applyTransformation(input1,input2,img, H)
    % kurze Beschreibung
    % Syntax:
    %   [output1, output2, ...] = functionName(input1, input2, ...)
    % Eingabeparameter:
    %   input1 - Beschreibung des ersten Eingabeparameters, inkl. Typ und Form
    %   input2 - Beschreibung des zweiten Eingabeparameters, inkl. Typ und Form
    %   ...
    %
    % Ausgabeparameter:
    %   output1 - Beschreibung des ersten Ausgabeparameters, inkl. Typ und Form
    %   output2 - Beschreibung des zweiten Ausgabeparameters, inkl. Typ und Form
    transformedImg = imwarp(img, projective2d(H));
end
