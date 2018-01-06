function classes = predict(X, theta)
	[val, classes] = max([ones(size(X,1), 1) X]*log(theta),[],2);
end
