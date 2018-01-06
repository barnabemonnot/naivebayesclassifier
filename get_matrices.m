function [X, y] = get_matrices(train, number_files, vocabulary, subjects)
	go = '';
	index = 0;
	if train == 1
		go = 'train';
		index = 1;
	else
		go = 'test';
		index = 2;
	end
	X = zeros(number_files(index), length(vocabulary));
	y = zeros(number_files(index), 1);
	k = 1;
	for i = 1:length(subjects)
		tic();
		fprintf('subject %s\n', subjects{i});
		filepath = ['modified/' go '/' subjects{i} '/*.json'];
		fprintf('filepath %s\n', filepath);
		files = glob(filepath);
		for j = 1:length(files)
			file = loadjson(files{j});
			for w = 1:length(file)
				X(k, find(ismember(vocabulary, file{w}))) += 1;
			end
			for l = 1:length(subjects)
				if findstr(filepath, subjects{l}) > 0
					y(k) = l;
				end
			end
			k = k+1;
		end
		elapsed = toc();
		fprintf('get_matrices finished subject %s in %f\n', subjects{i}, elapsed);
		fflush(stdout);
	end
end

