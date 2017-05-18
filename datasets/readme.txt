subs.txt : reposting records
	every line is a point in the tensor with the format (destination  source  topic  time)

vals.txt : reposting times, related to subs.txt
        every line is an integer representing the times of reposting related to the 4-tuple record in the same line of subs.txt.

X.txt : user-user intimacy matrix. The value of (i,j) represents the intimacy degree from the i-th user to the j-th user.

Y.txt : user-topic interest matrix. The order of users is the same as X.txt.

Z.txt : topic-topic correlation matrix. The order of topics is the same as Y.txt.
