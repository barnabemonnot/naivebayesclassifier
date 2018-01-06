function theta = naive_bayes(X, y, k, alpha)
	V = size(X,2); % Vocabulary size
	theta = zeros(V+1, k); % In theta(1,l) we store frequency of class l
	for l = 1:k
		ex = X(y==l,:); % ex holds all training examples labeled l
		theta(1,l) = sum(y==l)/length(y);
		theta(2:end,l) = (sum(ex)'+alpha)/(sum(sum(ex))+k*alpha);
	end
end		
