function position = run_gauntlet()
syms x y % symbolic sxpressions for the function and gradient
wheel_base = 0.235; % meters

% The scaling factor applied to the gradient when calculating step size
lambda = 0.835;


f = log(((x - 1/2)^2 + (y - 1)^2)^(1/2)) - log((((2^(1/2)*(x + 1/4))/2 ...
- (2^(1/2)*(y + 1))/2 + 1/4)^2 + ((2^(1/2)*(x + 1/4))/2 + ...
(2^(1/2)*(y + 1))/2 - 1/4)^2)^(1/2))/2 - log((((2^(1/2)*(x + 1/4))/2 ...
- (2^(1/2)*(y + 1))/2 + 1/4)^2 + ((2^(1/2)*(x + 1/4))/2 + ...
(2^(1/2)*(y + 1))/2 + 1/4)^2)^(1/2)) - log((((2^(1/2)*(y + 1))/2 ...
- (2^(1/2)*(x + 1/4))/2 + 1/4)^2 + ((2^(1/2)*(x + 1/4))/2 ...
+ (2^(1/2)*(y + 1))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x + 1/4))/2 - (2^(1/2)*(y + 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 - 1/4)^2 ...
+ ((2^(1/2)*(x + 1/4))/2 - (2^(1/2)*(y + 1))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x + 1/4))/2 - (2^(1/2)*(y + 1))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(y + 1))/2 - (2^(1/2)*(x + 1/4))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 - 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x + 1/4))/2 - (2^(1/2)*(y + 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 - 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 - 1/4)^2 ...
+ ((2^(1/2)*(y + 1))/2 - (2^(1/2)*(x + 1/4))/2 + 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(y + 1))/2 - (2^(1/2)*(x + 1/4))/2 + 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(y + 7/10))/2 - (2^(1/2)*(x - 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 + 1/4)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 - (2^(1/2)*(y + 7/10))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 - 1/4)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 - (2^(1/2)*(y + 7/10))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 + 1/4)^2)^(1/2)) ...
- log((((2^(1/2)*(y + 7/10))/2 - (2^(1/2)*(x - 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 - (2^(1/2)*(y + 7/10))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 - 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 - (2^(1/2)*(y + 7/10))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 - (2^(1/2)*(y + 7/10))/2 + 1/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(y + 7/10))/2 - (2^(1/2)*(x - 1))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 - 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 - (2^(1/2)*(y + 7/10))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 - 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 - 1/4)^2 ...
+ ((2^(1/2)*(y + 7/10))/2 - (2^(1/2)*(x - 1))/2 + 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(x - 1))/2 + (2^(1/2)*(y + 7/10))/2 + 1/4)^2 ...
+ ((2^(1/2)*(y + 7/10))/2 - (2^(1/2)*(x - 1))/2 + 3/20)^2)^(1/2))/2 ...
- log((((2^(1/2)*(y + 1))/2 - (2^(1/2)*(x + 1/4))/2 + 1/4)^2 ...
+ ((2^(1/2)*(x + 1/4))/2 + (2^(1/2)*(y + 1))/2 + 1/4)^2)^(1/2))/2 ...
+ log(((x + 1/2)^2 + (y - 1)^2)^(1/2)) + log(((x - 3/2)^2 ...
+ (y - 1)^2)^(1/2)) + log(((x + 3/2)^2 + (y - 1)^2)^(1/2)) ...
+ log(((x - 5/2)^2 + (y - 1)^2)^(1/2)) + log(((x - 1/10)^2 ...
+ (y - 1)^2)^(1/2)) + log(((x + 1/10)^2 + (y - 1)^2)^(1/2)) ...
+ log(((x - 3/10)^2 + (y - 1)^2)^(1/2)) + log(((x + 3/10)^2 ...
+ (y - 1)^2)^(1/2)) + log(((x - 7/10)^2 + (y - 1)^2)^(1/2)) ...
+ log(((x + 7/10)^2 + (y - 1)^2)^(1/2)) + log(((x - 9/10)^2 ...
+ (y - 1)^2)^(1/2)) + log(((x + 9/10)^2 + (y - 1)^2)^(1/2)) ...
+ log(((x - 11/10)^2 + (y - 1)^2)^(1/2)) + log(((x + 11/10)^2 ...
+ (y - 1)^2)^(1/2)) + log(((x - 13/10)^2 + (y - 1)^2)^(1/2)) ...
+ log(((x + 13/10)^2 + (y - 1)^2)^(1/2)) + log(((x - 17/10)^2 ...
+ (y - 1)^2)^(1/2)) + log(((x - 19/10)^2 + (y - 1)^2)^(1/2)) ...
+ log(((x - 21/10)^2 + (y - 1)^2)^(1/2)) + log(((x - 23/10)^2 ...
+ (y - 1)^2)^(1/2)) - log(((x - 29/25)^2 + (y + 7/4)^2)^(1/2))/2 ...
- log(((x - 29/25)^2 + (y + 9/4)^2)^(1/2)) - log(((x - 34/25)^2 ...
+ (y + 7/4)^2)^(1/2))/2 - log(((x - 34/25)^2 + (y + 9/4)^2)^(1/2))/2 ...
- log(((x - 39/25)^2 + (y + 7/4)^2)^(1/2))/2 - log(((x - 39/25)^2 ...
+ (y + 9/4)^2)^(1/2))/2 + log(((x + 3/2)^2 + (y - 3/100)^2)^(1/2)) ...
+ log(((x - 5/2)^2 + (y - 3/100)^2)^(1/2)) - log(((x - 29/25)^2 ...
+ (y + 37/20)^2)^(1/2))/2 - log(((x - 29/25)^2 ...
+ (y + 41/20)^2)^(1/2))/2 + log(((x + 3/2)^2 + (y + 17/100)^2)^(1/2)) ...
+ log(((x - 5/2)^2 + (y + 17/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y - 23/100)^2)^(1/2)) + log(((x - 5/2)^2 + (y - 23/100)^2)^(1/2)) ...
+ log(((x + 3/2)^2 + (y + 37/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 37/100)^2)^(1/2)) - log(((x - 83/50)^2 + (y + 9/4)^2)^(1/2))/2 ...
+ log(((x + 3/2)^2 + (y - 43/100)^2)^(1/2)) + log(((x - 5/2)^2 + ...
(y - 43/100)^2)^(1/2)) + log(((x + 3/2)^2 + (y + 57/100)^2)^(1/2)) ...
+ log(((x - 5/2)^2 + (y + 57/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y - 63/100)^2)^(1/2)) + log(((x - 5/2)^2 + (y - 63/100)^2)^(1/2)) ...
+ log(((x + 3/2)^2 + (y + 77/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 77/100)^2)^(1/2)) + log(((x + 3/2)^2 + (y - 83/100)^2)^(1/2)) ...
+ log(((x - 5/2)^2 + (y - 83/100)^2)^(1/2)) - log(((x - 83/50)^2 ...
+ (y + 37/20)^2)^(1/2))/2 - log(((x - 83/50)^2 ...
+ (y + 41/20)^2)^(1/2))/2 + log(((x + 3/2)^2 + (y + 97/100)^2)^(1/2)) ...
+ log(((x - 5/2)^2 + (y + 97/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 117/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 117/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 137/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 137/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 157/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 157/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 177/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 177/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 197/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 197/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 217/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 217/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 237/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 237/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 257/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 257/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 277/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 277/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 297/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 297/100)^2)^(1/2)) + log(((x + 3/2)^2 ...
+ (y + 317/100)^2)^(1/2)) + log(((x - 5/2)^2 ...
+ (y + 317/100)^2)^(1/2)) + log(((x - 1/2)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 1/2)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 3/2)^2 ...
+ (y + 337/100)^2)^(1/2)) + 2*log(((x + 3/2)^2 ...
+ (y + 337/100)^2)^(1/2)) + 2*log(((x - 5/2)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 1/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 1/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 3/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 3/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 7/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 7/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 9/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 9/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 11/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 11/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 13/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x + 13/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 17/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 19/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 21/10)^2 ...
+ (y + 337/100)^2)^(1/2)) + log(((x - 23/10)^2 ...
+ (y + 337/100)^2)^(1/2)) ...
+ (2*log(((x - 2253719725459081/4503599627370496)^2 ...
+ (y + 5662361255536685/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5826972935901969/2251799813685248)^2 ...
+ (x - 580835805886253/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 8969523127543341/9007199254740992)^2 ...
+ (y + 5732047907508205/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5494814135476029/2251799813685248)^2 ...
+ (x - 2284498012837863/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 8501818541785761/9007199254740992)^2 ...
+ (y + 5984871058599771/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 2487149247367907/4503599627370496)^2 ...
+ (y + 2986972452709893/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 367413524822121/140737488355328)^2 ...
+ (x - 2368039503116917/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1537671716626571/562949953421312)^2 ...
+ (x - 7606529651674005/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 6192406285483717/2251799813685248)^2 ...
+ (x - 3363751325489099/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 2422823973831897/4503599627370496)^2 ...
+ (y + 1481942691264621/562949953421312)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1279402647533871/562949953421312)^2 ...
+ (x - 5818320072053183/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 4633703349887981/9007199254740992)^2 ...
+ (y + 2720458985343081/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1281948598094451/562949953421312)^2 ...
+ (x - 3888403551385105/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 6063347341698987/9007199254740992)^2 ...
+ (y + 6165203877384847/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 2624623784092019/1125899906842624)^2 ...
+ (x - 2547468204893647/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 2731568223819031/1125899906842624)^2 ...
+ (x - 4453312984637751/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 35768464461985/70368744177664)^2 ...
+ (y + 1443339096424089/562949953421312)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5517658643695797/2251799813685248)^2 ...
+ (x - 4481156589218895/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1297131421731167/562949953421312)^2 ...
+ (x - 8155140651792519/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 562246852190303/562949953421312)^2 ...
+ (y + 2786649158480949/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 6064527266488407/2251799813685248)^2 ...
+ (x - 8184600740850723/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 4458755356820575/4503599627370496)^2 ...
+ (y + 2893398237954699/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 4421947599301125/4503599627370496)^2 ...
+ (y + 5839973385264617/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 8324243479356953/9007199254740992)^2 ...
+ (y + 5225663956254739/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1316709304297369/562949953421312)^2 ...
+ (x - 2119417733970393/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 4317502767218629/4503599627370496)^2 ...
+ (y + 2969753967384125/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 317171290913567/140737488355328)^2 ...
+ (x - 446133213860695/562949953421312)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 673613256317785/281474976710656)^2 ...
+ (x - 2359804980051851/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 7972052072743331/9007199254740992)^2 ...
+ (y + 5155793482510129/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1266697405234933/562949953421312)^2 ...
+ (x - 1672411990544501/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 3072627552816209/1125899906842624)^2 ...
+ (x - 2926439970020427/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 8003739467975863/9007199254740992)^2 ...
+ (y + 6098024452047139/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5410276496549061/2251799813685248)^2 ...
+ (x - 4414722207872095/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 323397282583849/140737488355328)^2 ...
+ (x - 1357553183716649/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 2945523654736767/1125899906842624)^2 ...
+ (x - 4374706062159429/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 350380731389567/140737488355328)^2 ...
+ (x - 4505547095823991/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 6169325909969299/2251799813685248)^2 ...
+ (x - 7394149897431387/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5550056032249003/2251799813685248)^2 ...
+ (x - 1131533630415267/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 3785678282536861/4503599627370496)^2 ...
+ (y + 1276202043545257/562949953421312)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 6465267432806711/9007199254740992)^2 ...
+ (y + 5071241875359349/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5081272055770785/2251799813685248)^2 ...
+ (x - 780473225819619/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 1206464376467641/2251799813685248)^2 ...
+ (y + 1334824515239401/562949953421312)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 2604852409876103/1125899906842624)^2 ...
+ (x - 5255079220474887/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 193446573573663/70368744177664)^2 ...
+ (x - 1738107408915585/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 1)^2 + (y + 5/2)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 3905202597099183/4503599627370496)^2 ...
+ (y + 6126840291500621/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5067959777966375/2251799813685248)^2 ...
+ (x - 6914685458591693/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 1522537148943139/562949953421312)^2 ...
+ (x - 5461010985350311/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 330220303586157/562949953421312)^2 ...
+ (y + 6055541463695851/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 2182884922603477/2251799813685248)^2 ...
+ (y + 334975434349181/140737488355328)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 4951384396832033/9007199254740992)^2 ...
+ (y + 5292589668565845/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 6016677461490493/2251799813685248)^2 ...
+ (x - 2560372606854883/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5087064498613787/2251799813685248)^2 ...
+ (x - 1839438313378403/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 4175590953384585/4503599627370496)^2 ...
+ (y + 6026683427629829/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 2838137354829517/1125899906842624)^2 ...
+ (x - 2249853187365533/2251799813685248)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 3091285593364317/1125899906842624)^2 ...
+ (x - 3587693979885747/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 1412857553725895/2251799813685248)^2 ...
+ (y + 3060076537348247/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 2859151232691737/1125899906842624)^2 ...
+ (x - 2265896339578505/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 5096779943926907/2251799813685248)^2 ...
+ (x - 3013708027313061/4503599627370496)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 772475008552577/281474976710656)^2 ...
+ (x - 6280729499171881/9007199254740992)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 8613890024937157/9007199254740992)^2 ...
+ (y + 2655817040057845/1125899906842624)^2)^(1/2)))/log(10) ...
+ (2*log(((x - 1625713600449765/2251799813685248)^2 ...
+ (y + 1547224459605939/562949953421312)^2)^(1/2)))/log(10) ...
+ (2*log(((y + 321472241341581/140737488355328)^2 ...
+ (x - 2809293538389031/4503599627370496)^2)^(1/2)))/log(10);
grad = -1*gradient(f, [x,y]);

% problem descriptions tells us the robot's starting position and heading
heading = [1; 0];
position = [0; 0];

angular_speed = 0.2; % rad/sec
linear_speed = 0.1; % m/sec

% setup with publisher to modulate velocity

pub = rospublisher('/raw_vel');
msg = rosmessage(pub);

% stop the robot's wheels if they were running
msg.Data = [0, 0];
send(pub, msg)
pause(3);

% place the neato in the starting location
placeNeato(position(1), position(2), heading(1), heading(2));
pause(3);

% set a flag to control when we are sufficiently close to the maximum of f
stop = false;

while ~stop
    % find the gradient
    grad_value = double(subs(grad, {x, y}, {position(1), position(2)}));
    
    % calculate the angle to align the robot to the direction of gradValue
    cross_product = cross([heading; 0], [grad_value; 0]);
    
    % find if we should be turning cw or ccw based on the sign of the z
    % component
    direction = sign(cross_product(3));
    
    % find the turn angle
    turn_angle = asin(norm(cross_product)/(norm(heading)*norm(grad_value)));
    
    % time to turn
    turn_time = double(turn_angle)/angular_speed; % sec
    
    % now we actually turn--send the data to the neato
    msg.Data = [-direction*angular_speed*wheel_base/2,...
                direction*angular_speed*wheel_base/2];
    send(pub, msg);
    
    % record start time and wait until desired time
    start_turn = rostic;
    while rostoc(start_turn) < turn_time
        pause(0.01);
    end
    
    heading = grad_value;
    
    % How far forward we're going to move
    forward_dist = norm(grad_value*lambda)
    forward_time = forward_dist/linear_speed
    
    % start moving the neato
    msg.Data = [linear_speed, linear_speed];
    send(pub, msg);
    
    % record the start time and wait until desired time has elapsed
    start_forward = rostic;
    while rostoc(start_forward) < forward_time
        pause(0.01)
    end 
    
    % update position
    position = position + grad_value*lambda;
    
    % make sure that the step is the right size, otherwise breakout of the
    % loop
    stop = forward_dist < 0.01;
end

% stop the robot
msg.Data = [0,0];
send(pub, msg);

end
            
