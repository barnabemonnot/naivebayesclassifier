function cell = processFile(filename)
	cell = loadjson(filename);
	for i = 1:length(cell)
		%fprintf('%s at index %d\n', cell{i}, i);
		%fflush(stdout);
		cell{i} = porterStemmer(cell{i});
	end
	last_idx = strfind(filename, '/')(end);
	first_idx = strfind(filename, '/')(1);
	name = strsplit(filename(last_idx+1:end), '.'){1};
	new_filename = [name '-bis.json'];
	savejson('', cell, ['modified' filename(first_idx:last_idx) new_filename]);
end
