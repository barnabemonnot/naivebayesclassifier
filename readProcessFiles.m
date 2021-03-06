function [Xtrain, ytrain, Xtest, ytest] = readProcessFiles(subjects)
	vocabulary = {};
	total_train = 0;
	total_test = 0;
	for i = 1:length(subjects)
		tic();
		filepath = ['files/*/' subjects{i} '/*.json'];
		files = glob(filepath);
		for j = 1:length(files)
			fprintf('process file %s\n', files{j});
			fflush(stdout);
			file = processFile(files{j});
			if length(findstr(files{j},'test')) > 0 % test file
				total_test += 1;
			else
				total_train += 1;
			end
			vocabulary = union(vocabulary, file);
		end
		elapsed = toc();
		fprintf('finished %s in %f seconds\n', filepath, elapsed);
		fflush(stdout);
	end
	number_files = [total_train, total_test];
	
	[Xtrain, ytrain] = get_matrices(1, number_files, vocabulary, subjects);
	[Xtest, ytest] = get_matrices(0, number_files, vocabulary, subjects);
end

