function temp = data_split( file, d, filename_index, T,  delay )
    % Inputs are:
    % file <string> - File path and name of the csv file to process
    % d <string> - Prefix to save each signal, so we can tell them apart, e.g. 'd_0cm_'
    % filename_index <int> - To ennumerate table elements
    % T <float> - Signal period in ms
    % delay <float> - Time where the first useful datapoint is
    
    % Read data
    data = readtable(file, 'HeaderLines',1);
    
    % Calculate signal length
    ts = 3.1e-6;
    % T = 6245e-6;
    le = round(T/ts);

    % Useful data starts here Inicio de los datos útiles: t = -0.082448298 - delay osciloscopio
    start_idx = zeros(1,32);
    start_idx(1) = find(data.second == delay);
    
    % Get indexes where the signals will be split
    for i=2:32
        start_idx(i) = start_idx(i-1) + le;
    end
    
    % Get start and top indexes of each signal
    stop_idx = zeros(1,32);
    stop_idx(1) = start_idx(1) + le;

    for i=2:32
        stop_idx(i) = stop_idx(i-1) + le;
    end

    % Plot them so we can visually see if the split was succesful
    a = linspace(0,T,le+1);
    figure
    hold on
    % get filename
    [~, fn, ~] = fileparts(file);
    for i=1:30
        plot( a, data.Volt( start_idx(i):stop_idx(i) ))
    end
    title([d 'Split data from ' fn], 'Interpreter', 'none')
    xlabel('Time [s]')
    ylabel('Voltage [V]')
    % Write to MAT table
    for i=1:30
       % Make temp table to write
       temp.([d, num2str(filename_index + i )]) = data.Volt( start_idx(i):stop_idx(i) );
    end
    
    % Assign output
    temp = struct2table(temp);
end