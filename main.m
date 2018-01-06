subjects = {'atheism', 'politics', 'science', 'sports'};
[vocabulary, number_files] = readFiles(subjects);
[Xtrain, ytrain] = get_matrices(1, number_files, vocabulary, subjects);
[Xtest, ytest] = get_matrices(0, number_files, vocabulary, subjects);
theta = naive_bayes(Xtrain, ytrain, length(subjects), 10^0);
classes_train = predict(Xtrain, theta);
classes_test = predict(Xtest, theta);
err_train = sum(ytrain!=classes_train);
fprintf('Error on training set = %f\n', err_train/length(classes_train)*100);
err_test = sum(ytest!=classes_test);
fprintf('Error on test set = %f\n', err_test/length(classes_test)*100);

