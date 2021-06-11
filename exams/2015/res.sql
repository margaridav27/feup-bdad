.mode columns
.headers ON

/* 1. */
select caption
from Photo
where user = (select id from User where name = 'Daniel Ramos') and 
      (julianday(uploadDate) - julianday(creationDate)) = 2;

/* 2. */
select name from User except
select name from User where exists (select user from Photo where user = User.id);

/* 3. */
drop view if exists LikedPhotos;
create view LikedPhotos as 
select id as photo
from Photo join Likes on Photo.id = Likes.photo
group by Photo.id
having count(*) > 3;

drop view if exists UserCountPerPhoto;
create view UserCountPerPhoto as
select LikedPhotos.photo, count(*) as userCount
from AppearsIn join LikedPhotos on AppearsIn.photo = LikedPhotos.photo
group by AppearsIn.photo;

select avg(userCount)
from UserCountPerPhoto;

/* 3. different approach */
select avg(nr) 
from (select count(*) as nr
      from AppearsIn, (select Likes.photo as likedPhoto, count(*) as nrLikes
                       from Likes
                       group by Likes.photo
                       having nrLikes > 3)
where likedPhoto = AppearsIn.photo
group by AppearsIn.photo);

/* 4. */
drop view if exists FriendsList;
create view FriendsList as
select id from User where name like 'Daniel Ramos'
union
select U2.id 
from User U1, Friend, User U2
where U1.id = Friend.user1 and 
      Friend.user2 = U2.id and
      U1.name like 'Daniel Ramos'
union
select U3.id 
from User U1, Friend F1, User U2, Friend F2, User U3
where U1.id = F1.user1 and 
      F1.user2 = U2.id and
      U2.id = F2.user1 and
      U3.id = F2.user2 and
      U1.name like 'Daniel Ramos';

select distinct Photo.caption
from Photo join AppearsIn on Photo.id = AppearsIn.photo
where AppearsIn.user in (select * from FriendsList);

/* 4. different approach */
select distinct Photo.caption
from Photo, User, Friend F1, Friend F2, AppearsIn
where User.name = "Daniel Ramos" and
      AppearsIn.photo = Photo.id and
      F1.user1 = User.id and
      F2.user1 = F1.user2 and
      (AppearsIn.user = User.ID and
       AppearsIn.user = F2.user1 or
       AppearsIn.user = F2.user2);

/* 5. */
delete from photo
where julianday('2010-01-01') - julianday(uploadDate) > 0 and 
      not exists (select photo from AppearsIn where photo = id 
                  group by photo having count(distinct user) >= 2);

/* 5. different approach */
delete from photo
where julianday('2010-01-01') - julianday(uploadDate) > 0 and
      (select count(distinct user) from AppearsIn where photo = id) < 2;

/* trigger */
drop trigger if exists LikesPhotoIfAppearsIn;
create trigger LikesPhotoIfAppearsIn
after insert on AppearsIn
when not exists (select * from Likes where user = new.user and photo = new.photo)
begin 
    insert into Likes values (new.user, new.photo);
end;