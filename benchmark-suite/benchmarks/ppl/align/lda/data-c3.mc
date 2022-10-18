let vocabsize: Int = 100
let numdocs: Int = 25
let numtopics: Int = 10

let docs:[(Int,Int)] = [(2,1),(3,1),(23,1),(24,1),(33,1),(37,1),(40,4),(58,2),(67,1),(68,1),(77,1),(81,1),(82,2),(86,1),(92,1),(8,1),(13,1),(15,1),(25,1),(31,1),(37,1),(39,1),(41,1),(44,1),(45,1),(49,1),(54,1),(64,1),(66,1),(71,1),(73,1),(83,1),(84,1),(95,1),(99,1),(9,1),(15,1),(39,2),(41,1),(45,1),(48,2),(55,2),(60,1),(64,1),(78,3),(80,1),(89,2),(97,1),(99,1),(3,1),(5,1),(12,1),(16,1),(19,1),(27,1),(47,2),(54,1),(55,1),(57,1),(64,2),(65,2),(78,1),(79,1),(81,1),(92,1),(97,1),(3,1),(11,1),(22,2),(31,1),(37,1),(43,1),(45,1),(57,1),(66,1),(71,1),(72,1),(75,1),(79,3),(80,1),(88,1),(95,2),(15,3),(22,1),(37,1),(39,1),(45,1),(49,2),(54,1),(62,1),(64,1),(69,4),(84,2),(85,1),(89,1),(7,1),(10,1),(13,1),(16,1),(17,1),(32,1),(38,1),(41,2),(42,1),(45,1),(55,2),(56,1),(67,1),(68,1),(70,1),(73,2),(81,1),(1,1),(14,1),(23,1),(25,2),(26,2),(36,1),(37,1),(40,1),(41,3),(47,1),(49,1),(51,1),(55,1),(58,1),(71,1),(80,1),(18,4),(30,1),(35,1),(40,1),(43,1),(45,1),(51,1),(54,2),(62,1),(63,1),(68,1),(70,1),(74,2),(82,1),(84,1),(4,1),(8,3),(13,1),(22,1),(47,3),(52,2),(55,1),(59,1),(72,2),(77,2),(84,1),(87,1),(88,1),(7,1),(14,1),(18,1),(33,1),(37,1),(47,1),(50,1),(54,3),(64,2),(79,3),(81,1),(83,2),(84,1),(95,1),(10,1),(13,1),(22,2),(34,4),(47,1),(52,2),(54,1),(65,1),(72,1),(79,2),(82,1),(84,1),(88,1),(93,1),(2,1),(4,1),(10,1),(15,1),(16,1),(18,1),(24,1),(49,1),(58,1),(64,1),(66,1),(69,1),(72,1),(81,5),(88,1),(89,1),(1,1),(7,1),(23,1),(24,1),(26,2),(28,1),(46,4),(64,1),(66,2),(72,3),(87,1),(90,1),(96,1),(1,1),(2,1),(5,1),(18,2),(24,1),(25,1),(31,1),(35,1),(39,1),(40,1),(54,1),(63,1),(64,1),(67,1),(77,3),(84,1),(95,1),(4,1),(9,1),(13,2),(19,1),(35,1),(45,1),(47,1),(48,1),(54,2),(58,1),(69,1),(73,1),(78,1),(84,1),(87,1),(89,1),(91,1),(99,1),(1,1),(8,2),(12,1),(14,1),(15,2),(35,1),(37,1),(40,1),(47,1),(56,1),(62,1),(66,1),(72,1),(75,1),(82,1),(88,1),(95,2),(8,1),(10,1),(15,1),(22,1),(24,1),(34,1),(35,2),(40,1),(48,1),(50,1),(51,1),(54,3),(66,1),(79,3),(92,1),(10,2),(11,1),(59,1),(65,1),(73,1),(78,2),(81,4),(84,4),(85,1),(89,1),(93,1),(99,1),(23,1),(26,2),(45,1),(49,1),(64,3),(67,1),(69,1),(70,3),(73,1),(81,1),(84,1),(93,2),(96,1),(99,1),(1,2),(5,1),(16,1),(25,1),(29,1),(37,2),(38,1),(45,1),(52,1),(58,1),(64,1),(71,1),(78,1),(84,2),(87,1),(88,1),(97,1),(1,1),(5,1),(8,1),(28,1),(32,1),(40,2),(43,1),(49,1),(54,2),(58,1),(68,1),(69,1),(72,1),(75,1),(79,1),(82,1),(84,1),(95,1),(10,1),(18,1),(22,1),(23,1),(26,2),(59,1),(69,1),(70,2),(71,2),(73,1),(81,2),(84,1),(85,2),(93,1),(95,1),(5,1),(11,3),(14,1),(18,2),(34,1),(40,1),(51,1),(56,1),(66,1),(74,2),(75,1),(77,1),(80,1),(84,1),(90,1),(99,1),(9,1),(11,1),(13,2),(18,2),(24,1),(36,1),(40,2),(46,1),(57,2),(63,2),(68,1),(74,3),(84,1)]

let docids:[Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,24]

-- True parameter values
-- let thetas = [
--[0.00151532009606,0.000366522444653,0.5711800852,5.65021415791e-08,0.327938517148,0.0800428255849,0.000171857864237,1.40734299625e-16,0.018784815146,1.3255348815e-11,]
--[0.00916236255261,2.40536463928e-07,9.50228662999e-06,0.000498804341578,3.86789980339e-05,0.549712437587,0.436482016463,2.2040816215e-06,9.77021943358e-10,0.00409375217579,]
--[7.28822345706e-14,7.98682194269e-11,1.27810841159e-12,0.00015826055112,0.322017485738,4.16597011918e-05,0.16768657762,0.00940944917971,0.0761583261304,0.424528240999,]
--[0.336807437117,0.227771818897,5.12804918809e-08,6.76375620873e-07,0.000603753253416,0.319613949657,4.24519191128e-07,0.00275764157877,0.00507059272197,0.1073736546,]
--[9.37243104161e-07,0.186723508191,0.0739804978657,0.00525414015964,6.47264662117e-06,0.653141746671,0.0310665651155,8.85597897706e-07,0.0497979459988,2.7300511004e-05,]
--[2.74160053137e-09,1.77105859896e-13,8.27245195338e-06,0.108422370775,7.38102891423e-12,0.303999719523,0.57137267986,9.17393957458e-05,0.0160423016883,6.29135568332e-05,]
--[2.66735306299e-08,0.161266163319,0.041312782507,0.0976054339276,0.673624986082,0.0251112145423,6.95153382684e-06,1.14035915415e-09,0.00018473674925,0.000887703524773,]
--[0.303768113532,1.20992638391e-05,3.11878457701e-06,0.131484855986,0.344089658002,0.000469180109765,0.0772688830559,0.14131083327,0.00159007207047,3.18592555072e-06,]
--[0.106467854289,0.120315702142,2.55869526527e-05,0.506101600368,0.0812016904626,0.0833013709129,0.00058461396834,1.54110403672e-08,1.85819926466e-05,0.101982983501,]
--[0.113993238083,4.09298569402e-15,0.00368445897595,0.000225925039732,8.15816394404e-12,9.2510085848e-06,0.00433957680491,0.0436866086201,0.834060429278,5.12180603411e-07,]
--[0.287796083335,0.00205735551638,4.67131703625e-12,1.42508375875e-06,3.33055041953e-08,0.487112414821,0.091127025853,0.131905335169,2.73097122924e-07,5.38142896542e-08,]
--[0.000211206661182,0.154740715636,0.00809096300623,0.00508833772533,1.1652994018e-08,0.19898396032,1.32474866722e-05,0.000597452094971,0.631862586039,0.000411519377176,]
--[0.00499120984876,0.336223275871,0.0787666200451,0.0127783859545,9.42582236998e-07,0.000235095905138,0.161236120688,0.405641530473,1.30485305803e-14,0.000126818631872,]
--[1.09771897097e-10,8.82047273618e-07,0.000407756659029,0.000437914167161,3.90110093577e-09,0.00221703896663,1.76925240441e-09,0.996568885762,0.000134830702484,0.000232685915779,]
--[0.000118382856759,0.000570943706476,0.81191789979,0.0847082782547,1.60759718557e-07,2.23412597718e-08,0.0975602675384,8.43824492405e-10,0.00276301323243,0.00236103067661,]
--[0.000513065627384,1.89332053568e-07,9.8037217688e-08,0.00154829977754,5.76769645928e-11,1.0205499657e-06,7.10767276264e-10,0.0142061837764,2.57767678588e-05,0.983705365363,]
--[0.466941036204,0.000943945834375,0.112472213289,7.4718281594e-06,0.00537293432287,0.138568902932,0.000103896355412,0.0055121289659,0.268798542325,0.00127892794274,]
--[1.39987460497e-08,2.27636522019e-12,0.0814446629493,0.222107051215,0.00050398254779,0.651688572387,0.0441632265264,8.26665412356e-05,9.82381671897e-06,1.59168360518e-11,]
--[1.50285792763e-07,0.820179548811,0.00520071565421,0.000511311056105,0.00943237994874,0.03094486917,0.000654846325755,2.50566669275e-17,0.0244523217174,0.108623857031,]
--[0.00920573937745,0.19190386684,7.62688312218e-13,0.000980463456117,0.000698645522109,0.00442674648151,0.180665442204,0.396982033891,1.49685025289e-09,0.215137060731,]
--[0.230109767018,0.222336762118,0.0151692572568,0.0196719826707,0.228466401002,3.82370503626e-08,0.0674633520835,1.85646974346e-06,9.16055880551e-12,0.216780583135,]
--[8.81037092873e-07,3.89619970379e-05,0.418275718754,0.00044108619598,2.03781315136e-12,0.13939781593,0.435969826705,9.89187658257e-17,0.000870384193745,0.00500532518504,]
--[0.0416992608339,0.55936870356,0.0397471708355,6.8750817077e-14,1.45422858875e-06,1.19546577525e-06,0.321937358565,0.00392808047818,0.0332139032401,0.000102872792963,]
--[5.2958075953e-08,0.0483990855965,0.173027704892,0.511018077564,6.25622793393e-06,0.265186709392,1.86709981677e-08,1.70441270712e-06,0.00236039028641,1.6280440041e-13,]
--[0.000107003108627,9.49413561282e-12,0.0648621848956,0.92418274964,0.00324609753926,1.58048807109e-13,0.00759573928483,9.53530465087e-08,5.78123050553e-06,3.48938340196e-07,]
--]
-- let phis = [
--[1.15631922093e-06,0.000128966054819,1.49535720734e-06,0.000201007540381,7.38949395346e-05,2.18133753314e-06,0.0277119450353,0.00155701782598,0.0222743242672,3.07658704348e-07,1.43130596873e-06,0.0093889743389,0.039246568366,4.446711297e-05,0.0751000711844,0.0750713123492,0.000328188359369,0.00204718275333,6.35874655645e-07,0.000136436686667,6.65609264601e-08,0.00109086927706,0.000265420742325,0.000217199351845,3.2476808254e-05,0.000148962388908,4.05204447365e-12,0.0132832823182,0.000548269371954,0.0191215821588,0.00179600938945,2.82481532297e-10,7.81908704168e-08,0.0825589881688,0.00761512879745,0.00057285866535,2.06723294427e-10,0.109481610763,2.22694880065e-07,3.2136459762e-05,0.00026913481811,0.00466663254311,0.00161417297683,0.000736901244899,0.00281638118019,0.00307481753864,2.21903411794e-06,0.130100082011,0.000410084450198,0.00435906155744,0.00843318638317,0.0112227539828,1.18680320681e-05,1.83953591109e-06,2.17173914995e-06,7.33635518337e-14,0.0206865196951,0.0036330822482,0.000201481191187,5.51532872499e-09,0.0024405415548,0.000827329987933,0.00158541464004,0.00449911835127,0.0409326101426,0.0774211637034,0.00398530059602,0.00245424233557,0.00011031135234,0.00319522659208,0.00251056700568,0.00149647280657,0.000200167666277,0.00831072888808,0.00235703717737,0.0370964082253,8.3410569111e-09,0.0352836676175,0.00948005195795,1.36268698226e-05,1.52065658816e-08,4.17032992316e-13,0.000168925642193,1.52942390873e-06,0.000461860572991,0.0003922453728,3.41116875752e-09,0.00438671576015,0.00843600674875,0.000187036189806,0.0010196009508,0.00455488310869,5.04921088106e-09,0.0121805702579,0.00206801416857,0.000435061593984,0.00114784587037,0.0439387042383,0.0032731550848,0.00082270259139,]
--[0.00116209379243,0.00072817033668,0.000407129709863,0.00111933646829,1.01226018179e-06,4.74342344909e-06,0.00565772096356,0.000333242086161,0.0010832673584,0.000206944985916,0.0384757415561,2.66625781101e-08,0.000444942663773,7.61556204148e-08,0.000320620612454,8.71295212243e-05,0.0342289712711,0.000282298755382,0.0037521160332,0.000486238662893,2.58442562834e-05,0.00559173824773,0.0215837335626,0.00180857990474,0.000167349890708,0.00178442019952,0.0218822819857,0.00243907003049,4.42152676024e-08,0.0027464459152,0.00363598459462,0.00380410040292,6.19419225982e-06,0.000792251493166,0.0111738549845,0.00219810883639,0.000302420438351,0.00471229534084,0.000271053569038,0.00145254344215,0.00508734887316,0.000119480248984,0.00102227147672,0.0043284565266,4.8725983487e-06,0.0187854332589,9.33031804264e-07,0.000106914110756,0.0225216761956,2.13251612998e-07,0.00270089070918,0.00438920346868,0.00546769565302,3.06529834586e-05,0.00127131208192,0.00897752005353,1.86995998629e-06,0.0143931561368,0.000552723749127,0.00701401176372,1.0035991436e-05,0.00167335003011,9.06690077274e-06,0.000527770383658,0.0182466663641,2.87919574315e-05,5.47572902431e-06,3.53702518029e-05,1.1020773907e-05,0.00617659350036,0.0690507907422,0.0487453447515,9.60978596965e-05,0.039614263255,0.000108694943592,0.0200098013519,6.17707055159e-05,0.00332544122379,0.0143523054632,1.70217958855e-06,0.00292255406738,0.187827262043,7.19024020144e-05,3.3139091225e-05,0.112849495545,0.0317124461852,0.00393683211127,0.000649966569077,0.000173293091686,0.0282559592736,0.000192562466747,7.65933189765e-11,1.97680766573e-09,0.0246428619877,8.36348954643e-08,3.34564569837e-07,0.0065494792463,0.0844971273428,0.000555781974039,0.0211017870774,]
--[0.000709472095226,0.0319167525568,0.0446362773586,0.01872480378,0.00541054551263,0.0035960267941,0.000562753477387,0.00446063493308,8.40569762773e-07,0.000312888650124,4.0182100094e-07,0.0114275805873,1.28197183951e-07,1.53428239135e-07,0.0203358767221,6.08870605088e-05,0.000495653008554,0.00303404695023,6.14357698469e-07,0.00180299118628,0.000243733847032,0.000340411001521,0.00181688517009,0.000139103346506,0.0888444310697,0.000282230621361,4.09893274548e-07,0.000102755275539,0.00699139581355,0.0299937887023,0.00353682714009,0.0243504826852,0.000121084249191,0.000103176155176,4.28454662094e-07,0.0204108942697,0.00193157170677,0.00303512554057,6.75488996942e-08,0.00330686887416,0.0996800360515,0.00449028266682,0.0101962649813,2.05628975461e-06,0.0154505701041,0.0103760023546,0.000550127445097,0.0018449481802,2.33409896136e-05,1.3892691745e-06,0.000138553302335,0.00485167653403,7.51995463027e-06,5.06947874344e-10,1.18155436069e-05,2.69996138212e-05,6.19791397419e-14,7.46058584819e-09,0.0628060501586,0.000238936655816,1.17874840587e-05,0.0107687253374,7.15102609787e-06,0.0205000731875,0.00323749379887,0.00013725779689,0.00592410528112,0.0100607248405,0.0408065175085,0.00425006520629,0.00130814844867,5.71273107789e-06,0.000275373081552,0.00526609022013,1.93065900349e-12,0.074300691632,0.000203204505407,0.0823245914784,2.2152807164e-05,0.00749410314379,0.0170109459131,0.00237183770998,0.000663013503209,0.000191388818895,1.59158315898e-05,0.0104444246846,0.0328071784568,0.00839602544712,0.000232839722732,0.0173297726,0.0303418541714,0.00196441655325,0.0421139589185,1.64947216607e-06,0.000632990153973,0.0246520347197,1.6040123915e-05,2.37736486027e-07,0.000139151531501,3.27759389796e-05,]
--[1.05296450836e-08,2.84312405136e-06,0.00247984684799,0.00292731735745,0.00523129922838,1.29380855277e-06,0.0175478417569,0.0118488434712,0.0129390067982,0.00932868377459,8.19076389096e-07,0.0565461109931,0.00224002480188,0.0062506662574,0.00352414063923,1.05770152771e-06,0.00202252062453,0.00755274121542,0.18000869663,1.27032558826e-08,2.73850834607e-06,0.00998769286257,4.0378426937e-05,2.07303896126e-10,2.18773553255e-05,0.00373711791328,3.18375459144e-06,7.15519846365e-06,2.37972984262e-05,0.00462657436775,4.46220050259e-06,0.0209858988382,0.00196682718536,0.00413056690738,0.000961696238702,0.0178786381825,0.0364846628685,0.000954320784864,0.000122746306085,0.000619575745603,0.0189276770908,7.33896617715e-06,0.00900487071599,0.000116391180359,0.00200063254412,9.38700556245e-05,0.0204950570758,3.45300145302e-10,2.79969849896e-06,0.000169241266456,0.00183940066633,0.0418658242572,0.00493404352544,0.0179388156942,0.0148650821709,0.000234184171496,0.0290926659748,0.00718826717038,0.0256709098651,1.00457766927e-06,0.00422854199972,0.00318297129523,0.0464644928335,0.017864524316,0.000423294857014,0.00590787496732,0.000833960743001,1.2396131928e-12,0.00478967544233,0.000456677404661,1.97173181359e-06,0.000223556586095,0.00171356245281,4.88272951524e-05,0.13322506654,0.00563065533197,2.65212534118e-05,2.47593764007e-07,0.00271644307038,0.0238648557459,0.000426189450488,0.000347420520867,0.000341937269762,2.97480243281e-05,0.00360581875464,4.24234724858e-06,1.00454922227e-09,5.25551480479e-06,2.88144429946e-05,0.00410853184889,0.010850526546,0.0127550767378,0.00535446139918,0.0340446154875,1.15359448423e-06,9.69721398322e-15,0.000461633915333,0.0348223350774,6.48729263534e-05,0.023681878173,]
--[0.000334025254277,5.71753522772e-05,1.09036075875e-10,8.42544463772e-06,0.00883306251865,0.0410428808197,0.000468528088638,0.00113372817287,5.87180264492e-06,0.00132717931681,0.0113978964247,1.93483314741e-09,6.53585529456e-07,0.00184324022496,5.09507190046e-07,4.35990931029e-06,0.144638482793,0.0064202315452,7.15226705892e-06,4.86384834147e-05,0.00161030029809,5.3079362124e-05,0.00374096853076,0.0132809776916,0.0120224291621,0.051497231131,0.00121384142745,2.92003952373e-10,5.14180564463e-05,0.00602154724957,0.0062940302215,0.000948652701079,0.021681807736,0.0091140163287,0.00103537567518,0.00236053964431,0.00034999956204,0.0395213229371,0.0122448658826,0.000280418954555,0.02263213266,0.0853127374664,0.0138222928741,0.0018046313717,0.000226781398146,0.0022424610393,0.00109453070833,0.0358804865157,4.35023270085e-07,0.00630986882985,3.02359683523e-05,2.29126068704e-07,0.000420847910276,0.0207902900572,0.00827359661433,0.0734218967909,2.46985744463e-06,7.3499817646e-11,0.00260288020937,0.000251877338171,1.68612683578e-11,0.00012698103928,1.36721659629e-06,0.0205141577397,4.06594676962e-05,0.0123431386161,0.0140198822476,0.0536533074525,0.0200063512739,1.86983932456e-05,0.000756153797225,0.0232689472851,1.36424046911e-05,7.40644659197e-05,0.000255107997765,5.1540203736e-08,7.87940142954e-05,0.0024329484293,8.26660817229e-06,0.000475425827069,0.0153661860531,0.00436112908216,0.0811481448357,0.0012050589526,0.000284434028247,8.78340494784e-08,0.0172562238358,0.00133043491844,1.98963963768e-05,0.00673498647119,0.000788644522106,0.00027118324776,0.00470754369085,0.000148972350581,1.35208096434e-09,0.00180639634258,2.64880054737e-07,0.0225966009455,0.0126863020621,0.00518401413434,]
--[9.16352697843e-06,5.76613703868e-07,0.00222372589539,0.00981164706732,0.00225461326484,0.0243300101515,0.00138152408428,4.339357505e-05,5.14502325339e-06,1.2728277663e-05,0.000351367284773,0.00721299485513,2.62954752658e-05,1.06501532728e-06,0.00117499538665,0.0232052199596,0.0028326468177,0.00186077842451,0.000583517898075,0.007544724815,0.00169491258311,0.0146113274016,0.0334662678255,0.00462616537767,0.000532459977062,1.81250675983e-06,0.000478803383161,0.00079306166746,0.000189128720918,3.90256565039e-05,1.22041286579e-05,0.0224141613223,6.91820157063e-05,0.0021483411542,0.0379621332969,0.00710803253514,2.50363397659e-06,0.0323644800152,0.0015860569366,9.05729616354e-07,0.00675239094016,0.00244419168558,0.00024803132102,0.0235500749413,0.00652616811188,0.0471124774436,2.0711144246e-07,0.00805297878342,0.000676591080214,1.04857127318e-05,0.0627762241448,0.000352412598529,8.48347703583e-06,0.000557543574942,0.0855436238809,0.0293679607909,1.56479052151e-08,0.00110108787073,0.00183872610391,8.12624625338e-05,0.00587799628343,1.15324566149e-06,0.0131387172961,0.000220558949845,0.000162240070545,0.00530503712684,0.0683436816406,0.00542349699363,0.000429963510832,0.00241598796885,0.0187217493785,0.0147218710521,9.30177079809e-05,1.04797625735e-06,5.90103131759e-05,0.00029728589273,0.0256844423154,0.000468530333126,0.00465361048275,0.125931021293,0.00185678653559,0.0114695123772,0.002171780105,0.0275513234908,4.5385065769e-06,1.61485286083e-05,6.81315491982e-07,0.00192533471495,1.37152912175e-05,2.45775188518e-05,0.0259882583966,5.89013601147e-05,3.70428490683e-05,7.74385266545e-06,5.80439952815e-07,0.0859554290852,0.00713538982598,0.00231933170259,0.000475278934909,0.0190691883734,]
--[0.007200199148,0.0097444120927,0.0527882926738,0.00023562937282,0.00193394161048,0.00416535893389,0.00917557874805,0.000112258612103,0.0423167232103,4.22008017614e-05,0.000448832277065,6.41049331704e-12,0.00721031607574,0.0390191302866,0.00163499154546,0.0410082268992,3.07672712995e-06,2.67295875026e-07,0.0107352537381,3.96501901878e-05,0.000234165501297,2.43227636374e-07,2.37750102676e-05,0.0249141212824,0.00498604444425,0.00894210875082,0.0274599623943,2.46722803632e-05,0.0143263365039,0.000321700583209,1.55263345384e-06,1.82985108e-07,0.0169896332468,0.000847388891493,0.0234475793635,4.62022922954e-06,7.62009092167e-10,3.55770330705e-05,0.000869958966421,0.0292980471718,0.00361636710101,1.02176416019e-05,1.07849239585e-05,0.000207437429865,0.000152247888051,0.00594258341213,0.000773198601496,0.00146526679462,0.00805620478912,0.1133568953,1.47272813331e-08,0.0314953773174,0.000462534143848,9.5493791172e-09,0.0219533778252,0.0112365449055,5.36493250372e-07,1.4631122438e-05,5.47246591258e-05,0.000567029107992,0.00383067071569,0.00470498035199,0.00435249316471,0.00247192999893,0.0849158812394,0.00427935672879,0.000179264407535,3.12893993299e-06,0.00504421935527,0.125800471423,0.000112734176034,0.00544117266027,0.0170904681212,0.0121200310296,0.00597658919489,7.08668613947e-09,0.00545324002305,0.00196762359063,2.91988611538e-05,0.0061176524835,0.000150483364817,4.03200060044e-05,0.0114909435967,0.000109280526973,0.0700520982943,0.00268000637774,0.00034552328522,0.00133271572217,0.0133559684737,0.0132774386491,7.34850571471e-05,4.16947558369e-08,1.54090689927e-08,0.0125654188024,0.00218844785095,0.00235992323823,5.5469771931e-05,6.45455954493e-05,4.86727323058e-05,9.27579327282e-08,]
--[0.0140598478589,0.00648371922931,0.00629114418863,7.01115509139e-05,0.0113878172172,0.00356709684322,4.05715940553e-05,0.0463135218105,1.34735343557e-14,3.18351733679e-06,2.56651379917e-09,0.016078075678,0.000107757108142,0.00385157179937,0.00694320133412,0.00775106097901,0.00645899049141,0.000225788595302,0.0034851828755,2.22283963272e-05,0.0294463493807,5.77728108664e-12,0.00810932417671,0.0773176197782,0.0715621736639,0.00374335697047,0.0681543289802,1.7457524398e-06,0.0325651949741,0.00687646569884,1.36112495894e-07,2.02071437144e-05,0.0162188996384,0.00265145216865,1.95168513831e-06,1.98126370485e-06,0.0353855379868,1.5260950931e-06,0.0135550275961,5.92711917688e-08,0.00792589478143,1.92679681508e-05,2.37127678093e-08,0.00699363114337,0.000104997401369,0.00255933797777,0.0145951539688,0.0182569486766,9.15654533368e-06,1.19573472022e-08,0.00108468234353,8.19478556362e-10,1.00259239578e-12,0.0164036451008,2.07141087081e-09,7.54061981293e-05,1.13310962734e-05,2.93886616428e-05,0.00599789928287,0.00257222217365,7.25394737669e-10,0.000237148276126,0.000240572556289,0.0025462698712,0.139569823249,0.000232727816639,0.0314706197185,2.62210444872e-05,2.40505095324e-09,1.52321841624e-05,0.0023719936243,2.24487223378e-05,0.0507180349574,0.0380078678759,2.56966199854e-06,6.94531509736e-05,2.90172504329e-08,6.03192833653e-08,8.22999556542e-07,0.00184679230481,0.00394747255631,2.91248269846e-05,0.000244961809172,0.028175219004,0.01235476376,0.00285602236979,5.90882326033e-07,0.01963740038,6.19512078158e-06,0.000281561509221,0.0195068084834,0.00019812188763,0.00818429477528,1.17923873975e-06,0.000130019094305,2.93046734266e-08,0.0305686858241,0.00209738343322,0.0200506882027,0.00895757319871,]
--[0.0151955831893,0.017072003289,5.61035670341e-07,1.46052661387e-08,0.00264881436926,0.0146524070486,0.000144281139579,0.000863534781793,0.0882573213706,0.011091634395,0.000162419745312,2.01579082801e-06,1.10128217599e-09,0.0727494918223,0.0143173147719,6.30450540369e-07,9.78775626317e-11,0.00118111349697,0.00449966579076,0.00373610818224,3.0229584005e-05,1.95327350423e-08,0.000261365398666,1.25700704904e-08,0.000206655370562,8.69419123341e-05,1.04492414595e-05,0.0013989804195,0.00118878983182,3.65144168845e-06,0.00118882436588,2.75663598928e-10,2.79227931852e-06,0.0108829424825,0.04127784477,0.000308405394897,0.0338149894687,5.67277471428e-06,6.38896003553e-06,0.009337805399,4.79111751045e-05,0.00153721323862,0.000740617750095,4.33794999923e-09,0.0001663832761,0.00439699431821,8.72424603476e-06,0.0231179849738,0.0129999054422,0.00180295011249,8.3475519721e-05,2.78362629031e-05,0.174856301641,3.8303137716e-05,1.51335587433e-07,0.0409593501187,2.04223979134e-12,4.1125471728e-05,0.00108571907111,0.0360428752991,0.00343694592487,0.00513115004767,2.54212084387e-13,2.01839668144e-05,6.39246983151e-07,0.0336496401539,0.00232688067473,9.96055091384e-05,0.0232553297626,0.000227431441461,7.90902459444e-06,0.000104873831482,0.0740072688366,0.000215274274916,3.77740823096e-05,0.00875087068493,0.0150240434712,0.0508702187891,0.00554921666098,1.75049012967e-06,2.45623508378e-06,0.00871027518566,0.0361842247746,2.07017313496e-05,3.3513948537e-05,6.34604941745e-05,0.0079001966564,4.90446819367e-08,0.0105461514322,5.18357314766e-05,0.0063517570566,0.00119550869347,0.0373147969397,0.014133693413,3.7322416472e-08,0.00264390392263,5.37135883022e-05,4.43266145076e-05,0.00364540065993,0.00384548500308,]
--[6.54800885787e-06,0.0250590749719,0.0122410495942,0.000938920058999,0.0271007500394,0.000231577192891,5.47962833521e-07,0.00330711490683,2.57548682748e-06,0.0228751172929,0.0309432025756,0.0111646963171,4.91003803185e-05,0.0359138756099,0.0002703652206,0.0126956463648,2.54492849182e-08,0.00329128259125,7.5270691019e-06,0.00611110963262,0.00973671342507,0.00445744244082,5.68782161711e-05,0.00279383528134,9.71030902124e-05,0.0173996763097,0.00604471059335,0.000960965127626,0.00022897379453,0.00354228462584,1.77585808933e-05,0.0215679506954,9.78900632197e-05,4.75755881145e-08,0.000854454906593,0.0199673521711,0.00716297221706,0.00011268372393,7.04634199582e-08,0.000369411536636,3.37255417554e-05,2.61168427718e-07,6.86702245274e-05,0.0156483665184,8.31458963574e-06,0.0803666041768,4.73892604522e-05,0.0114354410275,0.0667689289899,1.72232515942e-10,0.00417469067793,3.63319560209e-05,9.23834615012e-05,5.59069472344e-09,0.0391389240458,0.00382814997859,0.00744404543625,3.26776012853e-08,0.024057666474,0.00142076284128,0.0070086828581,6.16604839111e-07,2.99032234891e-05,0.0121606855374,0.0147045421469,4.40855049203e-07,7.45746951284e-06,0.0158252247547,0.000592010414452,0.00569191409344,0.000353395033324,0.0111584751172,4.16622360841e-10,0.0272789024934,0.000793283877042,1.14229871253e-06,0.00435467280979,0.000717472628145,0.0805419127427,0.000115566419847,0.000285232942031,9.41474118882e-06,0.000153104195182,4.55532198612e-05,0.036954598222,0.0109899626412,0.0521354193538,0.0264958595971,2.64257000762e-07,0.0434152966285,1.0540792377e-05,0.0216166647786,0.00186887506241,0.0124317034797,0.000257224594999,0.00712293240746,0.0250239581648,0.000381357296602,6.87760086265e-05,0.037146983448,]
--]
