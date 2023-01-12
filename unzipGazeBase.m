

%%
%unzip main GazeBase folder

% downloads main unzipped folder
urlGB = "https://figshare.com/ndownloader/files/27039812";

%%%%%%%%%%%%%%% change destinationGB to desired path
destinationGB = "C:\Users\David\Downloads\unzippedGB";

mainFolder = unzip(urlGB, destinationGB);

%%

%access round folders
for round = 1:9

    zipRound = strcat(destinationGB, '\Round_', num2str(round));

    subNumber = 0;

    %access subject folders
    while subNumber < 335
        subNumber = subNumber + 1;
        subRound = (round .* 1000) + subNumber;
        zipRoundName = strcat(zipRound, '\Subject_', num2str(subRound), '.zip');

        %does the folder exist?
        %if yes, unzip and delete zipped file
        if exist(zipRoundName) ~= 0
            roundOutputFolder = strcat(zipRound, '\Subject_', num2str(subRound));
            roundFiles = unzip(zipRoundName,roundOutputFolder);
            delete(zipRoundName);
        else
            continue
        end

    end

end