drop table
paymentCancle,
payment,
orderProduct,
order_,
penalty,
reportDetail,
report,
couponUsage,
userCoupon,
coupon,
usePointDetail,
usePoint,
point_,
message,
chatRoom,
notice,
board,
review,
scheduleDetail,
schedule_,
program,
lessonPrice,
qualify,
trainerInfo,
centerPrice,
centerInfo,
fileDetail,
file_,
nonMember,
tempPwd,
member;





create table member(
mbNo INTEGER primary key auto_increment not null,
mbAuth CHAR(1) null DEFAULT 'U',  -- 'U', 'C', 'T', 'M' : 일반유저, 센터, 트레이너, 관리자
mbEmail VARCHAR(50) null,
mbPwd VARCHAR(100) not null,
mbPwdSalt VARCHAR(5) not null,
mbName VARCHAR(24) not null,
mbPhone INTEGER null,
mbAddr VARCHAR(50) not null,
mbDate DATETIME not null default NOW(),
mbDateM DATETIME null,
mbDelYN CHAR(1) not null DEFAULT 'N' -- 'Y', 'N' : 탈퇴, 탈퇴x
);

create table tempPwd(
mbNo INTEGER not null,
mbTempPwd VARCHAR(50) not null,
mbTempDate DATETIME not null default NOW(),
foreign key(mbNo) references member(mbNo) on update cascade
);

create table nonMember(
nmNo INTEGER primary key auto_increment not null,
nmName VARCHAR(24) null,
nmBirth INTEGER not null,
nmPhone INTEGER not null,
nmPwd INTEGER not null,
nmDate DATETIME not null default NOW(),
nmDelYN CHAR(1) not null DEFAULT 'N' -- 'Y', 'N' : 접속불가능, 접속가능
);


create table file_(
flNo INTEGER primary key auto_increment not null,
flCf CHAR(1) null, -- 'T', 'C', 'R', 'B' : 트레이너, 센터, 리뷰, 게시판
flCfNo INTEGER null,
flDate DATETIME not null,
flDateM DATETIME not null,
flDelYN CHAR(1) not null DEFAULT 'N' -- 'Y', 'N' : 삭제, 삭제x
);

create table fileDetail(
fdNo INTEGER primary key auto_increment not null,
flNo INTEGER not null,  -- 'U', 'C', 'T', 'M' : 일반유저, 센터, 트레이너, 관리자
fdName VARCHAR(50) not null,
fdPName VARCHAR(50) not null,
fdDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(flNo) references file_(flNo) on update cascade
);

create table centerInfo(
ctNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
flNo INTEGER null,
ctName VARCHAR(50) not null,
ctIntro TEXT not null,
ctOperate TEXT not null,
ctInfo TEXT null,
ctBn INTEGER not null,
ctDate DATETIME not null default NOW(),
ctDateM DATETIME null,
ctDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 탈퇴, 탈퇴x
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(flNo) references file_(flNo) on update cascade
);

create table centerPrice(
cpNo INTEGER primary key auto_increment not null,
ctNo INTEGER null,
cpCount VARCHAR(20) null,
cpDate DATETIME not null default NOW(),
cpDateM DATETIME null,
cpDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 탈퇴, 탈퇴x
foreign key(ctNo) references centerInfo(ctNo) on update cascade
);

create table trainerInfo(
tnNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
ctNo INTEGER null,
flNo INTEGER null,
tnOneLine VARCHAR(50) null,
tnIntro TEXT null,
tnTicket INTEGER null,
tnDate DATETIME not null default NOW(),
tnDateM DATETIME null,
tnDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 탈퇴, 탈퇴x
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(ctNo) references centerInfo(ctNo) on update cascade,
foreign key(flNo) references file_(flNo) on update cascade
);

create table qualify(
qlNo INTEGER primary key auto_increment not null,
tnNo INTEGER not null,
qualify VARCHAR(50) not null,
qlDate DATETIME not null default NOW(),
qlDateM DATETIME null,
qlDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(tnNo) references trainerInfo(tnNo) on update cascade
);

create table lessonPrice(
lpNo INTEGER primary key auto_increment not null,
tnNo INTEGER not null,
lpCf CHAR(1) not null,  -- 'C', 'T': 횟수, 기간
lpCount VARCHAR(20) not null,
lessonPrice INTEGER not null,
lpDate DATETIME not null default NOW(),
lpDateM DATETIME null,
lpDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(tnNo) references trainerInfo(tnNo) on update cascade
);

create table program(
pgNo INTEGER primary key auto_increment not null,
tnNo INTEGER not null,
pgContent TEXT not null,
pgDate DATETIME not null default NOW(),
pgDateM DATETIME null,
pgDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(tnNo) references trainerInfo(tnNo) on update cascade
);

create table schedule_(
scNo INTEGER primary key auto_increment not null,
tnNo INTEGER not null,
scDate DATETIME not null default NOW(),
scDateM DATETIME null,
scDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(tnNo) references trainerInfo(tnNo) on update cascade
);

create table scheduleDetail(
sdNo INTEGER primary key auto_increment not null,
scNo INTEGER not null,
sdStart INTEGER not null,
sdEnd INTEGER not null,
sdDay INTEGER not null,
sdDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(scNo) references schedule_(scNo) on update cascade
);

create table review(
rvNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
tnNo INTEGER not null,
flNo INTEGER null,
rvContent TEXT not null,
rvRate INTEGER not null,
rvDate DATETIME not null default NOW(),
rvDateM DATETIME null,
rvDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(tnNo) references trainerInfo(tnNo) on update cascade,
foreign key(flNo) references file_(flNo) on update cascade
);

create table board(
bdNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
flNo INTEGER null,
bdTitle VARCHAR(100) not null,
bdDate DATETIME not null default NOW(),
bdDateM DATETIME null,
bdDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(flNo) references file_(flNo) on update cascade
);

create table notice(
bdNo INTEGER primary key auto_increment not null,
ntContent TEXT not null,
foreign key(bdNo) references board(bdNo) on update cascade
);

create table chatRoom(
crNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null, -- 생성자
mbNo2 INTEGER not null, -- 초대받은유저
crDate DATETIME not null default NOW(),
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(mbNo2) references member(mbNo) on update cascade
);


create table message(
msNo INTEGER primary key auto_increment not null,
crNo INTEGER not null,
mbNo INTEGER not null,
msContent TEXT not null,
msDate DATETIME not null default NOW(),
msCheck INTEGER null,
mbDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(crNo) references chatRoom(crNo) on update cascade,
foreign key(mbNo) references member(mbNo) on update cascade
);

create table point_(
ptNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
ptPoint INTEGER null,
ptBalance INTEGER not null,
ptContent TEXT null,
ptDate DATETIME not null default NOW(),
ptDateM DATETIME null,
foreign key(mbNo) references member(mbNo) on update cascade
);

create table usePoint(
upNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
usePoint INTEGER not null,
useContent TEXT null,
useDate DATETIME not null default NOW(),
foreign key(mbNo) references member(mbNo) on update cascade
);

create table usePointDetail(
upNo INTEGER not null,
ptNo INTEGER not null,
usePoint INTEGER not null,
foreign key(upNo) references usePoint(upNo) on update cascade,
foreign key(ptNo) references point_(ptNo) on update cascade
);


create table coupon(
cpNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null, -- 쿠폰 발급한 사람(관리자)
cpName VARCHAR(30) null,
cpRate DOUBLE not null,
cpDeadline INTEGER not null,
cpWho CHAR(1) not null DEFAULT 'A', -- 'A', 'N' : 모든유저, 신규유저x
cpDate DATETIME not null default NOW(),
cpDelYN CHAR(1) not null DEFAULT 'N', -- 'Y', 'N' : 삭제, 삭제x
foreign key(mbNo) references member(mbNo) on update cascade
);


create table userCoupon(
ucNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null, -- 발급된 쿠폰을 받는 사람
cpNo INTEGER not null,
ucDate DATETIME not null default NOW(),
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(cpNo) references coupon(cpNo) on update cascade
);

create table couponUsage(
ucNo INTEGER not null,
ucDate DATETIME not null default NOW(),
foreign key(ucNo) references userCoupon(ucNo) on update cascade
);

create table report(
rpNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null, -- 피신고자
rpContCf VARCHAR(50) null,
rpContNo VARCHAR(100) not null,
rpCheck CHAR(1) null DEFAULT 'N', -- 'Y', 'N' : 처리됨, 처리안됨
foreign key(mbNo) references member(mbNo) on update cascade
);


create table reportDetail(
rdNo INTEGER primary key auto_increment not null,
rpNo INTEGER not null,
mbNo INTEGER not null, -- 신고자
rpContent TEXT null,
rpDate DATETIME not null DEFAULT NOW(),
rpCf CHAR(3) null DEFAULT 'etc', -- 'etc', 'prn', 'vlt', 'adv', 'cht', 'inf' : 기타, 음란, 폭력, 광고, 사기, 표기오류
foreign key(rpNo) references report(rpNo) on update cascade,
foreign key(mbNo) references member(mbNo) on update cascade
);


create table penalty(
pnNo INTEGER primary key auto_increment not null,
mbNo INTEGER not null,
pnCheck VARCHAR(4) null DEFAULT 'NP',  -- '3D', '1W', '1M', 'PM', 'NP : 3일정지, 1주일정지, 1달정지, 영구정지, 페널티없음
pnDate DATETIME not null default NOW(),
pnDateM DATETIME null,
foreign key(mbNo) references member(mbNo) on update cascade
);

create table order_(
odNo VARCHAR(30) primary key not null,
mbNo INTEGER null,
nmNo INTEGER null,
odPoint INTEGER null,
odCoupon INTEGER null,
odPrice INTEGER not null,
odDate DATETIME not null default NOW(),
foreign key(mbNo) references member(mbNo) on update cascade,
foreign key(nmNo) references nonMember(nmNo) on update cascade
);

create table orderProduct(
opNo INTEGER primary key auto_increment not null,
odNo VARCHAR(30) not null,
tnNo INTEGER not null,
opIntro TEXT null,
foreign key(odNo) references order_(odNo) on update cascade,
foreign key(tnNo) references trainerInfo(tnNo) on update cascade
);

create table payment(
pmNo VARCHAR(30) primary key not null,
odNo VARCHAR(30) not null,
portOneNo VARCHAR(30) not null,
pgCorp VARCHAR(20) not null,
pmMethod VARCHAR(20) not null,
pmCard VARCHAR(10) not null,
pmPrice INTEGER not null,
odDate DATETIME not null,
pmState VARCHAR(10) not null,
foreign key(odNo) references order_(odNo) on update cascade
);

create table paymentCancle(
pcNo VARCHAR(30) primary key not null,
odNo VARCHAR(30) not null,
pgCorpNo VARCHAR(30) not null,
pcPrice INTEGER not null,
pcContent TEXT not null,
pcDate DATETIME not null,
pcState VARCHAR(10) not null,
foreign key(odNo) references order_(odNo) on update cascade
);


