% Ephemeris .txt file reader function v1

%Inputs:
% - filepath to .txt file (future version: variable file type)
%Outputs:
% - eph.JD: Julian Dates
% - eph.r: position vectors
% - eph.v: velocity vectors

function eph = readEphemeris(filepath)
    data = readmatrix(filepath, ...
        "FileType","text", ...
        'Delimiter', ',', ...
        'NumHeaderLines', 3, ...
        'LineEnding', '\r');

    eph.JD = data(:, 1);
    eph.r = data(:, 3:5);
    eph.v = data(:, 6:8);
end