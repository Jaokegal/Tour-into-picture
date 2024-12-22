function main
%%Start to launch gui
disp('Initializing: Tour into the picture')
scriptDir = fileparts(mfilename('fullpath'));

allFolders = genpath(scriptDir);

addpath(allFolders);

disp('Launching GUI');

app = cv_challenge_app_desinger;
app.UIFigure.Visible = 'on';
end
