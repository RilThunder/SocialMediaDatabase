/*
	Populate some user into the DB
*/

INSERT INTO ACCOUNT VALUES('Thuan', 'Tran', 'AsianGuy', 'Asian@gmail.com', 'Password', 'Male');
INSERT INTO ACCOUNT VALUES('Michael', 'Smith', 'Mike', 'Michael@gmail.com', 'Password1', 'Male');
INSERT INTO ACCOUNT VALUES('John', 'Smith', 'John', 'Smith@gmail.com', 'Password2', 'Male'); 

/*
	Create some friend for an account
*/
INSERT INTO FRIEND VALUES('Asian@gmail.com', 'Michael@gmail.com');
INSERT INTO FRIEND VALUES('Michael@gmail.com', 'Smith@gmail.com');
INSERT INTO FRIEND VALUES('Smith@gmail.com', 'Asian@gmail.com');

/*
	Create some post
*/
INSERT INTO POST VALUES('Today is a wonderful day', '03/02/2017', '13:00:00', 'Asian@gmail.com');
INSERT INTO POST VALUES('Time to browse 9Gag', '02/28/2017', '23:59:59', 'Smith@gmail.com');
INSERT INTO POST VALUES('Time to get a Nintendo Switch' , '03/03/2017', '00:00:01', 'Michael@gmail.com');

/*
	Specify the Media attached to each post
*/
INSERT INTO MEDIA ([Type], Caption, PostID, FileName)
VALUES ('Image', 'Sunny day',
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Asian@gmail.com' /* Should not directly enter like that. But too long so shortcut */
AND PostDate = '03/02/2017' AND PostTime = '13:00:00'), 'Sunny.jpg') ;

INSERT INTO MEDIA ([Type], Caption, PostID, FileName)
VALUES ('Video', 'Hands on the Switch',
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Michael@gmail.com'
AND PostDate = '03/03/2017' AND PostTime = '00:00:01'), 'NintendoSwitch.mp4') ;

INSERT INTO MEDIA ([Type], Caption, PostID, FileName)
VALUES ('Image', 'Browse 9Gag ',
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Smith@gmail.com'
AND PostDate = '02/28/2017' AND PostTime = '23:59:59'), 'Selfie.jpg' ) ;

/*
	Create some Reaction
*/
INSERT INTO REACTION VALUES('Smile');
INSERT INTO REACTION VALUES('Sad');
INSERT INTO REACTION VALUES('Excited');


/*
	Identify who make the reaction
*/
INSERT INTO POST_REACTION (UserEmail,PostID, ReactionType )
VALUES('Smith@gmail.com', /* Should not directly manually insert like this but it was too long */
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Asian@gmail.com'
AND PostDate = '03/02/2017' AND PostTime = '13:00:00'), 'Smile'); /* Should not do this as well */

INSERT INTO POST_REACTION (UserEmail,PostID, ReactionType )
VALUES('Smith@gmail.com', /* Should not directly manually insert like this but it was too long */
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Michael@gmail.com'
AND PostDate = '03/03/2017' AND PostTime = '00:00:01') , 'Excited'); /* Should not do this as well */

INSERT INTO POST_REACTION (UserEmail,PostID, ReactionType )
VALUES('Michael@gmail.com', /* Should not directly manually insert like this but it was too long */
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Smith@gmail.com'
AND PostDate = '02/28/2017' AND PostTime = '23:59:59'), 'Sad'); /* Should not do this as well */



/*
	Populate some comments for a post
*/
INSERT INTO POST_COMMENTS (PostID, CommentTime, CommentDate, CommentContent, Commenter)
VALUES(
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Smith@gmail.com'
AND PostDate = '02/28/2017' AND PostTime = '23:59:59'), '05:06:30', '03/08/2017', 'Nice one', 'Asian@gmail.com');

INSERT INTO POST_COMMENTS (PostID, CommentTime, CommentDate, CommentContent, Commenter)
VALUES(
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Michael@gmail.com'
AND PostDate = '03/03/2017' AND PostTime = '00:00:01'), '05:15:38', '03/08/2017', 'Good Job', 'Smith@gmail.com');

INSERT INTO POST_COMMENTS (PostID, CommentTime, CommentDate, CommentContent, Commenter)
VALUES(
(Select PostID
from POST, ACCOUNT
where POST.UserEmail = ACCOUNT.Email AND POST.UserEmail = 'Michael@gmail.com'
AND PostDate = '03/03/2017' AND PostTime = '00:00:01'), '05:15:30', '03/08/2017', 'Good Job', 'Asian@gmail.com');


/*
	Create some message Thread
*/
INSERT INTO MESSAGE_THREAD VALUES ('Asian@gmail.com');
INSERT INTO MESSAGE_THREAD VALUES ('Smith@gmail.com');
INSERT INTO MESSAGE_THREAD VALUES ('Michael@gmail.com');


/*
	Identify the Thread_Participant. Should not directly enter the value
*/
INSERT INTO THREAD_PARTICIPANT(ThreadID,UserEmail)
VALUES(
(select ThreadID
from MESSAGE_THREAD
where OwnerEmail = 'Asian@gmail.com'), 'Michael@gmail.com');

INSERT INTO THREAD_PARTICIPANT(ThreadID,UserEmail)
VALUES(
(select ThreadID
from MESSAGE_THREAD
where OwnerEmail = 'Asian@gmail.com'), 'Smith@gmail.com');

INSERT INTO THREAD_PARTICIPANT(ThreadID,UserEmail)
VALUES(
(select ThreadID
from MESSAGE_THREAD
where OwnerEmail = 'Michael@gmail.com'), 'Asian@gmail.com');
	
/*
	Create some message
*/
INSERT INTO MESSAGE (ThreadID, Sender, MsgDate, MsgTime, Content)
VALUES(
(select ThreadID
from MESSAGE_THREAD
where OwnerEmail = 'Asian@gmail.com' ), 'Michael@gmail.com', '05/03/2017','03:05:08', 'Hey');

INSERT INTO MESSAGE (ThreadID, Sender, MsgDate, MsgTime, Content)
VALUES(
(select ThreadID
from MESSAGE_THREAD
where OwnerEmail = 'Michael@gmail.com') , 'Asian@gmail.com', '05/03/2017','03:05:10', 'Dude');

INSERT INTO MESSAGE (ThreadID, Sender, MsgDate, MsgTime, Content)
VALUES(
(select ThreadID
from MESSAGE_THREAD
where OwnerEmail = 'Asian@gmail.com') , 'Smith@gmail.com', '05/03/2017','03:05:09', 'Hey');


