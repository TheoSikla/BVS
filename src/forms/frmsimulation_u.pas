{
                Copyright (C) 2020 Theodoros Siklafidis

    This file is part of BVS.

    BVS is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    BVS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with BVS. If not, see <https://www.gnu.org/licenses/>.
}

unit frmSimulation_u;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, LCLIntf,
  StdCtrls, math, DateUtils, fgl,
  { Classes }
  clNode_u,
  utlArray_u,
  utlTypes_u;

type
  TShapePointerList = array[0..MaxListSize - 1] of ^TShape;
  TAppenderType = specialize TAppender<Word>;
  ArrayOfWord = Array of Word;
  ArrayOfArrayOfWord = Array of ArrayOfWord;
  TAppenderArrayOfWordType = specialize TAppender<ArrayOfWord>;

  { TfrmSimulation }

  TfrmSimulation = class(TForm)
   shp0, shp1, shp2, shp3, shp4, shp5, shp6, shp7, shp8, shp9, shp10, shp11, shp12, shp13, shp14, shp15, shp16, shp17, shp18, shp19, shp20, shp21, shp22, shp23, shp24, shp25, shp26, shp27, shp28, shp29, shp30, shp31, shp32, shp33, shp34, shp35, shp36, shp37, shp38, shp39, shp40, shp41, shp42, shp43, shp44, shp45, shp46, shp47, shp48, shp49, shp50, shp51, shp52, shp53, shp54, shp55, shp56, shp57, shp58, shp59, shp60, shp61, shp62, shp63, shp64, shp65, shp66, shp67, shp68, shp69, shp70, shp71, shp72, shp73, shp74, shp75, shp76, shp77, shp78, shp79, shp80, shp81, shp82, shp83, shp84, shp85, shp86, shp87, shp88, shp89, shp90, shp91, shp92, shp93, shp94, shp95, shp96, shp97, shp98, shp99, shp100, shp101, shp102, shp103, shp104, shp105, shp106, shp107, shp108, shp109, shp110, shp111, shp112, shp113, shp114, shp115, shp116, shp117, shp118, shp119, shp120, shp121, shp122, shp123, shp124, shp125, shp126, shp127, shp128, shp129, shp130, shp131, shp132, shp133, shp134, shp135, shp136, shp137, shp138, shp139, shp140, shp141, shp142, shp143, shp144, shp145, shp146, shp147, shp148, shp149, shp150, shp151, shp152, shp153, shp154, shp155, shp156, shp157, shp158, shp159, shp160, shp161, shp162, shp163, shp164, shp165, shp166, shp167, shp168, shp169, shp170, shp171, shp172, shp173, shp174, shp175, shp176, shp177, shp178, shp179, shp180, shp181, shp182, shp183, shp184, shp185, shp186, shp187, shp188, shp189, shp190, shp191, shp192, shp193, shp194, shp195, shp196, shp197, shp198, shp199, shp200, shp201, shp202, shp203, shp204, shp205, shp206, shp207, shp208, shp209, shp210, shp211, shp212, shp213, shp214, shp215, shp216, shp217, shp218, shp219, shp220, shp221, shp222, shp223, shp224, shp225, shp226, shp227, shp228, shp229, shp230, shp231, shp232, shp233, shp234, shp235, shp236, shp237, shp238, shp239, shp240, shp241, shp242, shp243, shp244, shp245, shp246, shp247, shp248, shp249, shp250, shp251, shp252, shp253, shp254, shp255, shp256, shp257, shp258, shp259, shp260, shp261, shp262, shp263, shp264, shp265, shp266, shp267, shp268, shp269, shp270, shp271, shp272, shp273, shp274, shp275, shp276, shp277, shp278, shp279, shp280, shp281, shp282, shp283, shp284, shp285, shp286, shp287, shp288, shp289, shp290, shp291, shp292, shp293, shp294, shp295, shp296, shp297, shp298, shp299, shp300, shp301, shp302, shp303, shp304, shp305, shp306, shp307, shp308, shp309, shp310, shp311, shp312, shp313, shp314, shp315, shp316, shp317, shp318, shp319, shp320, shp321, shp322, shp323, shp324, shp325, shp326, shp327, shp328, shp329, shp330, shp331, shp332, shp333, shp334, shp335, shp336, shp337, shp338, shp339, shp340, shp341, shp342, shp343, shp344, shp345, shp346, shp347, shp348, shp349, shp350, shp351, shp352, shp353, shp354, shp355, shp356, shp357, shp358, shp359, shp360, shp361, shp362, shp363, shp364, shp365, shp366, shp367, shp368, shp369, shp370, shp371, shp372, shp373, shp374, shp375, shp376, shp377, shp378, shp379, shp380, shp381, shp382, shp383, shp384, shp385, shp386, shp387, shp388, shp389, shp390, shp391, shp392, shp393, shp394, shp395, shp396, shp397, shp398, shp399, shp400, shp401, shp402, shp403, shp404, shp405, shp406, shp407, shp408, shp409, shp410, shp411, shp412, shp413, shp414, shp415, shp416, shp417, shp418, shp419, shp420, shp421, shp422, shp423, shp424, shp425, shp426, shp427, shp428, shp429, shp430, shp431, shp432, shp433, shp434, shp435, shp436, shp437, shp438, shp439, shp440, shp441, shp442, shp443, shp444, shp445, shp446, shp447, shp448, shp449, shp450, shp451, shp452, shp453, shp454, shp455, shp456, shp457, shp458, shp459, shp460, shp461, shp462, shp463, shp464, shp465, shp466, shp467, shp468, shp469, shp470, shp471, shp472, shp473, shp474, shp475, shp476, shp477, shp478, shp479, shp480, shp481, shp482, shp483, shp484, shp485, shp486, shp487, shp488, shp489, shp490, shp491, shp492, shp493, shp494, shp495, shp496, shp497, shp498, shp499, shp500, shp501, shp502, shp503, shp504, shp505, shp506, shp507, shp508, shp509, shp510, shp511, shp512, shp513, shp514, shp515, shp516, shp517, shp518, shp519, shp520, shp521, shp522, shp523, shp524, shp525, shp526, shp527, shp528, shp529, shp530, shp531, shp532, shp533, shp534, shp535, shp536, shp537, shp538, shp539, shp540, shp541, shp542, shp543, shp544, shp545, shp546, shp547, shp548, shp549, shp550, shp551, shp552, shp553, shp554, shp555, shp556, shp557, shp558, shp559, shp560, shp561, shp562, shp563, shp564, shp565, shp566, shp567, shp568, shp569, shp570, shp571, shp572, shp573, shp574, shp575, shp576, shp577, shp578, shp579, shp580, shp581, shp582, shp583, shp584, shp585, shp586, shp587, shp588, shp589, shp590, shp591, shp592, shp593, shp594, shp595, shp596, shp597, shp598, shp599, shp600, shp601, shp602, shp603, shp604, shp605, shp606, shp607, shp608, shp609, shp610, shp611, shp612, shp613, shp614, shp615, shp616, shp617, shp618, shp619, shp620, shp621, shp622, shp623, shp624, shp625, shp626, shp627, shp628, shp629, shp630, shp631, shp632, shp633, shp634, shp635, shp636, shp637, shp638, shp639, shp640, shp641, shp642, shp643, shp644, shp645, shp646, shp647, shp648, shp649, shp650, shp651, shp652, shp653, shp654, shp655, shp656, shp657, shp658, shp659, shp660, shp661, shp662, shp663, shp664, shp665, shp666, shp667, shp668, shp669, shp670, shp671, shp672, shp673, shp674, shp675, shp676, shp677, shp678, shp679, shp680, shp681, shp682, shp683, shp684, shp685, shp686, shp687, shp688, shp689, shp690, shp691, shp692, shp693, shp694, shp695, shp696, shp697, shp698, shp699, shp700, shp701, shp702, shp703, shp704, shp705, shp706, shp707, shp708, shp709, shp710, shp711, shp712, shp713, shp714, shp715, shp716, shp717, shp718, shp719, shp720, shp721, shp722, shp723, shp724, shp725, shp726, shp727, shp728, shp729, shp730, shp731, shp732, shp733, shp734, shp735, shp736, shp737, shp738, shp739, shp740, shp741, shp742, shp743, shp744, shp745, shp746, shp747, shp748, shp749, shp750, shp751, shp752, shp753, shp754, shp755, shp756, shp757, shp758, shp759, shp760, shp761, shp762, shp763, shp764, shp765, shp766, shp767, shp768, shp769, shp770, shp771, shp772, shp773, shp774, shp775, shp776, shp777, shp778, shp779, shp780, shp781, shp782, shp783, shp784, shp785, shp786, shp787, shp788, shp789, shp790, shp791, shp792, shp793, shp794, shp795, shp796, shp797, shp798, shp799, shp800, shp801, shp802, shp803, shp804, shp805, shp806, shp807, shp808, shp809, shp810, shp811, shp812, shp813, shp814, shp815, shp816, shp817, shp818, shp819, shp820, shp821, shp822, shp823, shp824, shp825, shp826, shp827, shp828, shp829, shp830, shp831, shp832, shp833, shp834, shp835, shp836, shp837, shp838, shp839, shp840, shp841, shp842, shp843, shp844, shp845, shp846, shp847, shp848, shp849, shp850, shp851, shp852, shp853, shp854, shp855, shp856, shp857, shp858, shp859, shp860, shp861, shp862, shp863, shp864, shp865, shp866, shp867, shp868, shp869, shp870, shp871, shp872, shp873, shp874, shp875, shp876, shp877, shp878, shp879, shp880, shp881, shp882, shp883, shp884, shp885, shp886, shp887, shp888, shp889, shp890, shp891, shp892, shp893, shp894, shp895, shp896, shp897, shp898, shp899, shp900, shp901, shp902, shp903, shp904, shp905, shp906, shp907, shp908, shp909, shp910, shp911, shp912, shp913, shp914, shp915, shp916, shp917, shp918, shp919, shp920, shp921, shp922, shp923, shp924, shp925, shp926, shp927, shp928, shp929, shp930, shp931, shp932, shp933, shp934, shp935, shp936, shp937, shp938, shp939, shp940, shp941, shp942, shp943, shp944, shp945, shp946, shp947, shp948, shp949, shp950, shp951, shp952, shp953, shp954, shp955, shp956, shp957, shp958, shp959, shp960, shp961, shp962, shp963, shp964, shp965, shp966, shp967, shp968, shp969, shp970, shp971, shp972, shp973, shp974, shp975, shp976, shp977, shp978, shp979, shp980, shp981, shp982, shp983, shp984, shp985, shp986, shp987, shp988, shp989, shp990, shp991, shp992, shp993, shp994, shp995, shp996, shp997, shp998, shp999, shp1000, shp1001, shp1002, shp1003, shp1004, shp1005, shp1006, shp1007, shp1008, shp1009, shp1010, shp1011, shp1012, shp1013, shp1014, shp1015, shp1016, shp1017, shp1018, shp1019, shp1020, shp1021, shp1022, shp1023, shp1024, shp1025, shp1026, shp1027, shp1028, shp1029, shp1030, shp1031, shp1032, shp1033, shp1034, shp1035, shp1036, shp1037, shp1038, shp1039, shp1040, shp1041, shp1042, shp1043, shp1044, shp1045, shp1046, shp1047, shp1048, shp1049, shp1050, shp1051, shp1052, shp1053, shp1054, shp1055, shp1056, shp1057, shp1058, shp1059, shp1060, shp1061, shp1062, shp1063, shp1064, shp1065, shp1066, shp1067, shp1068, shp1069, shp1070, shp1071, shp1072, shp1073, shp1074, shp1075, shp1076, shp1077, shp1078, shp1079, shp1080, shp1081, shp1082, shp1083, shp1084, shp1085, shp1086, shp1087, shp1088, shp1089, shp1090, shp1091, shp1092, shp1093, shp1094, shp1095, shp1096, shp1097, shp1098, shp1099, shp1100, shp1101, shp1102, shp1103, shp1104, shp1105, shp1106, shp1107, shp1108, shp1109, shp1110, shp1111, shp1112, shp1113, shp1114, shp1115, shp1116, shp1117, shp1118, shp1119, shp1120, shp1121, shp1122, shp1123, shp1124, shp1125, shp1126, shp1127, shp1128, shp1129, shp1130, shp1131, shp1132, shp1133, shp1134, shp1135, shp1136, shp1137, shp1138, shp1139, shp1140, shp1141, shp1142, shp1143, shp1144, shp1145, shp1146, shp1147, shp1148, shp1149, shp1150, shp1151, shp1152, shp1153, shp1154, shp1155, shp1156, shp1157, shp1158, shp1159, shp1160, shp1161, shp1162, shp1163, shp1164, shp1165, shp1166, shp1167, shp1168, shp1169, shp1170, shp1171, shp1172, shp1173, shp1174, shp1175, shp1176, shp1177, shp1178, shp1179, shp1180, shp1181, shp1182, shp1183, shp1184, shp1185, shp1186, shp1187, shp1188, shp1189, shp1190, shp1191, shp1192, shp1193, shp1194, shp1195, shp1196, shp1197, shp1198, shp1199, shp1200, shp1201, shp1202, shp1203, shp1204, shp1205, shp1206, shp1207, shp1208, shp1209, shp1210, shp1211, shp1212, shp1213, shp1214, shp1215, shp1216, shp1217, shp1218, shp1219, shp1220, shp1221, shp1222, shp1223, shp1224, shp1225, shp1226, shp1227, shp1228, shp1229, shp1230, shp1231, shp1232, shp1233, shp1234, shp1235, shp1236, shp1237, shp1238, shp1239, shp1240, shp1241, shp1242, shp1243, shp1244, shp1245, shp1246, shp1247, shp1248, shp1249, shp1250, shp1251, shp1252, shp1253, shp1254, shp1255, shp1256, shp1257, shp1258, shp1259, shp1260, shp1261, shp1262, shp1263, shp1264, shp1265, shp1266, shp1267, shp1268, shp1269, shp1270, shp1271, shp1272, shp1273, shp1274, shp1275, shp1276, shp1277, shp1278, shp1279, shp1280, shp1281, shp1282, shp1283, shp1284, shp1285, shp1286, shp1287, shp1288, shp1289, shp1290, shp1291, shp1292, shp1293, shp1294, shp1295, shp1296, shp1297, shp1298, shp1299, shp1300, shp1301, shp1302, shp1303, shp1304, shp1305, shp1306, shp1307, shp1308, shp1309, shp1310, shp1311, shp1312, shp1313, shp1314, shp1315, shp1316, shp1317, shp1318, shp1319, shp1320, shp1321, shp1322, shp1323, shp1324, shp1325, shp1326, shp1327, shp1328, shp1329, shp1330, shp1331, shp1332, shp1333, shp1334, shp1335, shp1336, shp1337, shp1338, shp1339, shp1340, shp1341, shp1342, shp1343, shp1344, shp1345, shp1346, shp1347, shp1348, shp1349, shp1350, shp1351, shp1352, shp1353, shp1354, shp1355, shp1356, shp1357, shp1358, shp1359, shp1360, shp1361, shp1362, shp1363, shp1364, shp1365, shp1366, shp1367, shp1368, shp1369, shp1370, shp1371, shp1372, shp1373, shp1374, shp1375, shp1376, shp1377, shp1378, shp1379, shp1380, shp1381, shp1382, shp1383, shp1384, shp1385, shp1386, shp1387, shp1388, shp1389, shp1390, shp1391, shp1392, shp1393, shp1394, shp1395, shp1396, shp1397, shp1398, shp1399, shp1400, shp1401, shp1402, shp1403, shp1404, shp1405, shp1406, shp1407, shp1408, shp1409, shp1410, shp1411, shp1412, shp1413, shp1414, shp1415, shp1416, shp1417, shp1418, shp1419, shp1420, shp1421, shp1422, shp1423, shp1424, shp1425, shp1426, shp1427, shp1428, shp1429, shp1430, shp1431, shp1432, shp1433, shp1434, shp1435, shp1436, shp1437, shp1438, shp1439, shp1440, shp1441, shp1442, shp1443, shp1444, shp1445, shp1446, shp1447, shp1448, shp1449, shp1450, shp1451, shp1452, shp1453, shp1454, shp1455, shp1456, shp1457, shp1458, shp1459, shp1460, shp1461, shp1462, shp1463, shp1464, shp1465, shp1466, shp1467, shp1468, shp1469, shp1470, shp1471, shp1472, shp1473, shp1474, shp1475, shp1476, shp1477, shp1478, shp1479, shp1480, shp1481, shp1482, shp1483, shp1484, shp1485, shp1486, shp1487, shp1488, shp1489, shp1490, shp1491, shp1492, shp1493, shp1494, shp1495, shp1496, shp1497, shp1498, shp1499, shp1500, shp1501, shp1502, shp1503, shp1504, shp1505, shp1506, shp1507, shp1508, shp1509, shp1510, shp1511, shp1512, shp1513, shp1514, shp1515, shp1516, shp1517, shp1518, shp1519, shp1520, shp1521, shp1522, shp1523, shp1524, shp1525, shp1526, shp1527, shp1528, shp1529, shp1530, shp1531, shp1532, shp1533, shp1534, shp1535, shp1536, shp1537, shp1538, shp1539, shp1540, shp1541, shp1542, shp1543, shp1544, shp1545, shp1546, shp1547, shp1548, shp1549, shp1550, shp1551, shp1552, shp1553, shp1554, shp1555, shp1556, shp1557, shp1558, shp1559, shp1560, shp1561, shp1562, shp1563, shp1564, shp1565, shp1566, shp1567, shp1568, shp1569, shp1570, shp1571, shp1572, shp1573, shp1574, shp1575, shp1576, shp1577, shp1578, shp1579, shp1580, shp1581, shp1582, shp1583, shp1584, shp1585, shp1586, shp1587, shp1588, shp1589, shp1590, shp1591, shp1592, shp1593, shp1594, shp1595, shp1596, shp1597, shp1598, shp1599, shp1600, shp1601, shp1602, shp1603, shp1604, shp1605, shp1606, shp1607, shp1608, shp1609, shp1610, shp1611, shp1612, shp1613, shp1614, shp1615, shp1616, shp1617, shp1618, shp1619, shp1620, shp1621, shp1622, shp1623, shp1624, shp1625, shp1626, shp1627, shp1628, shp1629, shp1630, shp1631, shp1632, shp1633, shp1634, shp1635, shp1636, shp1637, shp1638, shp1639, shp1640, shp1641, shp1642, shp1643, shp1644, shp1645, shp1646, shp1647, shp1648, shp1649, shp1650, shp1651, shp1652, shp1653, shp1654, shp1655, shp1656, shp1657, shp1658, shp1659, shp1660, shp1661, shp1662, shp1663, shp1664, shp1665, shp1666, shp1667, shp1668, shp1669, shp1670, shp1671, shp1672, shp1673, shp1674, shp1675, shp1676, shp1677, shp1678, shp1679, shp1680, shp1681, shp1682, shp1683, shp1684, shp1685, shp1686, shp1687, shp1688, shp1689, shp1690, shp1691, shp1692, shp1693, shp1694, shp1695, shp1696, shp1697, shp1698, shp1699, shp1700, shp1701, shp1702, shp1703, shp1704, shp1705, shp1706, shp1707, shp1708, shp1709, shp1710, shp1711, shp1712, shp1713, shp1714, shp1715, shp1716, shp1717, shp1718, shp1719, shp1720, shp1721, shp1722, shp1723, shp1724, shp1725, shp1726, shp1727, shp1728, shp1729, shp1730, shp1731, shp1732, shp1733, shp1734, shp1735, shp1736, shp1737, shp1738, shp1739, shp1740, shp1741, shp1742, shp1743, shp1744, shp1745, shp1746, shp1747, shp1748, shp1749, shp1750, shp1751, shp1752, shp1753, shp1754, shp1755, shp1756, shp1757, shp1758, shp1759, shp1760, shp1761, shp1762, shp1763, shp1764, shp1765, shp1766, shp1767, shp1768, shp1769, shp1770, shp1771, shp1772, shp1773, shp1774, shp1775, shp1776, shp1777, shp1778, shp1779, shp1780, shp1781, shp1782, shp1783, shp1784, shp1785, shp1786, shp1787, shp1788, shp1789, shp1790, shp1791, shp1792, shp1793, shp1794, shp1795, shp1796, shp1797, shp1798, shp1799, shp1800, shp1801, shp1802, shp1803, shp1804, shp1805, shp1806, shp1807, shp1808, shp1809, shp1810, shp1811, shp1812, shp1813, shp1814, shp1815, shp1816, shp1817, shp1818, shp1819, shp1820, shp1821, shp1822, shp1823, shp1824, shp1825, shp1826, shp1827, shp1828, shp1829, shp1830, shp1831, shp1832, shp1833, shp1834, shp1835, shp1836, shp1837, shp1838, shp1839, shp1840, shp1841, shp1842, shp1843, shp1844, shp1845, shp1846, shp1847, shp1848, shp1849, shp1850, shp1851, shp1852, shp1853, shp1854, shp1855, shp1856, shp1857, shp1858, shp1859, shp1860, shp1861, shp1862, shp1863, shp1864, shp1865, shp1866, shp1867, shp1868, shp1869, shp1870, shp1871, shp1872, shp1873, shp1874, shp1875, shp1876, shp1877, shp1878, shp1879, shp1880, shp1881, shp1882, shp1883, shp1884, shp1885, shp1886, shp1887, shp1888, shp1889, shp1890, shp1891, shp1892, shp1893, shp1894, shp1895, shp1896, shp1897, shp1898, shp1899, shp1900, shp1901, shp1902, shp1903, shp1904, shp1905, shp1906, shp1907, shp1908, shp1909, shp1910, shp1911, shp1912, shp1913, shp1914, shp1915, shp1916, shp1917, shp1918, shp1919, shp1920, shp1921, shp1922, shp1923, shp1924, shp1925, shp1926, shp1927, shp1928, shp1929, shp1930, shp1931, shp1932, shp1933, shp1934, shp1935, shp1936, shp1937, shp1938, shp1939, shp1940, shp1941, shp1942, shp1943, shp1944, shp1945, shp1946, shp1947, shp1948, shp1949, shp1950, shp1951, shp1952, shp1953, shp1954, shp1955, shp1956, shp1957, shp1958, shp1959, shp1960, shp1961, shp1962, shp1963, shp1964, shp1965, shp1966, shp1967, shp1968, shp1969, shp1970, shp1971, shp1972, shp1973, shp1974, shp1975, shp1976, shp1977, shp1978, shp1979, shp1980, shp1981, shp1982, shp1983, shp1984, shp1985, shp1986, shp1987, shp1988, shp1989, shp1990, shp1991, shp1992, shp1993, shp1994, shp1995, shp1996, shp1997, shp1998, shp1999, shp2000, shp2001, shp2002, shp2003, shp2004, shp2005, shp2006, shp2007, shp2008, shp2009, shp2010, shp2011, shp2012, shp2013, shp2014, shp2015, shp2016, shp2017, shp2018, shp2019, shp2020, shp2021, shp2022, shp2023, shp2024, shp2025, shp2026, shp2027, shp2028, shp2029, shp2030, shp2031, shp2032, shp2033, shp2034, shp2035, shp2036, shp2037, shp2038, shp2039, shp2040, shp2041, shp2042, shp2043, shp2044, shp2045, shp2046, shp2047, shp2048, shp2049, shp2050, shp2051, shp2052, shp2053, shp2054, shp2055, shp2056, shp2057, shp2058, shp2059, shp2060, shp2061, shp2062, shp2063, shp2064, shp2065, shp2066, shp2067, shp2068, shp2069, shp2070, shp2071, shp2072, shp2073, shp2074, shp2075, shp2076, shp2077, shp2078, shp2079, shp2080, shp2081, shp2082, shp2083, shp2084, shp2085, shp2086, shp2087, shp2088, shp2089, shp2090, shp2091, shp2092, shp2093, shp2094, shp2095, shp2096, shp2097, shp2098, shp2099, shp2100, shp2101, shp2102, shp2103, shp2104, shp2105, shp2106, shp2107, shp2108, shp2109, shp2110, shp2111, shp2112, shp2113, shp2114, shp2115, shp2116, shp2117, shp2118, shp2119, shp2120, shp2121, shp2122, shp2123, shp2124, shp2125, shp2126, shp2127, shp2128, shp2129, shp2130, shp2131, shp2132, shp2133, shp2134, shp2135, shp2136, shp2137, shp2138, shp2139, shp2140, shp2141, shp2142, shp2143, shp2144, shp2145, shp2146, shp2147, shp2148, shp2149, shp2150, shp2151, shp2152, shp2153, shp2154, shp2155, shp2156, shp2157, shp2158, shp2159, shp2160, shp2161, shp2162, shp2163, shp2164, shp2165, shp2166, shp2167, shp2168, shp2169, shp2170, shp2171, shp2172, shp2173, shp2174, shp2175, shp2176, shp2177, shp2178, shp2179, shp2180, shp2181, shp2182, shp2183, shp2184, shp2185, shp2186, shp2187, shp2188, shp2189, shp2190, shp2191, shp2192, shp2193, shp2194, shp2195, shp2196, shp2197, shp2198, shp2199, shp2200, shp2201, shp2202, shp2203, shp2204, shp2205, shp2206, shp2207, shp2208, shp2209, shp2210, shp2211, shp2212, shp2213, shp2214, shp2215, shp2216, shp2217, shp2218, shp2219, shp2220, shp2221, shp2222, shp2223, shp2224, shp2225, shp2226, shp2227, shp2228, shp2229, shp2230, shp2231, shp2232, shp2233, shp2234, shp2235, shp2236, shp2237, shp2238, shp2239, shp2240, shp2241, shp2242, shp2243, shp2244, shp2245, shp2246, shp2247, shp2248, shp2249, shp2250, shp2251, shp2252, shp2253, shp2254, shp2255, shp2256, shp2257, shp2258, shp2259, shp2260, shp2261, shp2262, shp2263, shp2264, shp2265, shp2266, shp2267, shp2268, shp2269, shp2270, shp2271, shp2272, shp2273, shp2274, shp2275, shp2276, shp2277, shp2278, shp2279, shp2280, shp2281, shp2282, shp2283, shp2284, shp2285, shp2286, shp2287, shp2288, shp2289, shp2290, shp2291, shp2292, shp2293, shp2294, shp2295, shp2296, shp2297, shp2298, shp2299, shp2300, shp2301, shp2302, shp2303, shp2304, shp2305, shp2306, shp2307, shp2308, shp2309, shp2310, shp2311, shp2312, shp2313, shp2314, shp2315, shp2316, shp2317, shp2318, shp2319, shp2320, shp2321, shp2322, shp2323, shp2324, shp2325, shp2326, shp2327, shp2328, shp2329, shp2330, shp2331, shp2332, shp2333, shp2334, shp2335, shp2336, shp2337, shp2338, shp2339, shp2340, shp2341, shp2342, shp2343, shp2344, shp2345, shp2346, shp2347, shp2348, shp2349, shp2350, shp2351, shp2352, shp2353, shp2354, shp2355, shp2356, shp2357, shp2358, shp2359, shp2360, shp2361, shp2362, shp2363, shp2364, shp2365, shp2366, shp2367, shp2368, shp2369, shp2370, shp2371, shp2372, shp2373, shp2374, shp2375, shp2376, shp2377, shp2378, shp2379, shp2380, shp2381, shp2382, shp2383, shp2384, shp2385, shp2386, shp2387, shp2388, shp2389, shp2390, shp2391, shp2392, shp2393, shp2394, shp2395, shp2396, shp2397, shp2398, shp2399, shp2400, shp2401, shp2402, shp2403, shp2404, shp2405, shp2406, shp2407, shp2408, shp2409, shp2410, shp2411, shp2412, shp2413, shp2414, shp2415, shp2416, shp2417, shp2418, shp2419, shp2420, shp2421, shp2422, shp2423, shp2424, shp2425, shp2426, shp2427, shp2428, shp2429, shp2430, shp2431, shp2432, shp2433, shp2434, shp2435, shp2436, shp2437, shp2438, shp2439, shp2440, shp2441, shp2442, shp2443, shp2444, shp2445, shp2446, shp2447, shp2448, shp2449, shp2450, shp2451, shp2452, shp2453, shp2454, shp2455, shp2456, shp2457, shp2458, shp2459, shp2460, shp2461, shp2462, shp2463, shp2464, shp2465, shp2466, shp2467, shp2468, shp2469, shp2470, shp2471, shp2472, shp2473, shp2474, shp2475, shp2476, shp2477, shp2478, shp2479, shp2480, shp2481, shp2482, shp2483, shp2484, shp2485, shp2486, shp2487, shp2488, shp2489, shp2490, shp2491, shp2492, shp2493, shp2494, shp2495, shp2496, shp2497, shp2498, shp2499, shp2500, shp2501, shp2502, shp2503, shp2504, shp2505, shp2506, shp2507, shp2508, shp2509, shp2510, shp2511, shp2512, shp2513, shp2514, shp2515, shp2516, shp2517, shp2518, shp2519, shp2520, shp2521, shp2522, shp2523, shp2524, shp2525, shp2526, shp2527, shp2528, shp2529, shp2530, shp2531, shp2532, shp2533, shp2534, shp2535, shp2536, shp2537, shp2538, shp2539, shp2540, shp2541, shp2542, shp2543, shp2544, shp2545, shp2546, shp2547, shp2548, shp2549, shp2550, shp2551, shp2552, shp2553, shp2554, shp2555, shp2556, shp2557, shp2558, shp2559, shp2560, shp2561, shp2562, shp2563, shp2564, shp2565, shp2566, shp2567, shp2568, shp2569, shp2570, shp2571, shp2572, shp2573, shp2574, shp2575, shp2576, shp2577, shp2578, shp2579, shp2580, shp2581, shp2582, shp2583, shp2584, shp2585, shp2586, shp2587, shp2588, shp2589, shp2590, shp2591, shp2592, shp2593, shp2594, shp2595, shp2596, shp2597, shp2598, shp2599, shp2600, shp2601, shp2602, shp2603, shp2604, shp2605, shp2606, shp2607, shp2608, shp2609, shp2610, shp2611, shp2612, shp2613, shp2614, shp2615, shp2616, shp2617, shp2618, shp2619, shp2620, shp2621, shp2622, shp2623, shp2624, shp2625, shp2626, shp2627, shp2628, shp2629, shp2630, shp2631, shp2632, shp2633, shp2634, shp2635, shp2636, shp2637, shp2638, shp2639, shp2640, shp2641, shp2642, shp2643, shp2644, shp2645, shp2646, shp2647, shp2648, shp2649, shp2650, shp2651, shp2652, shp2653, shp2654, shp2655, shp2656, shp2657, shp2658, shp2659, shp2660, shp2661, shp2662, shp2663, shp2664, shp2665, shp2666, shp2667, shp2668, shp2669, shp2670, shp2671, shp2672, shp2673, shp2674, shp2675, shp2676, shp2677, shp2678, shp2679, shp2680, shp2681, shp2682, shp2683, shp2684, shp2685, shp2686, shp2687, shp2688, shp2689, shp2690, shp2691, shp2692, shp2693, shp2694, shp2695, shp2696, shp2697, shp2698, shp2699, shp2700, shp2701, shp2702, shp2703, shp2704, shp2705, shp2706, shp2707, shp2708, shp2709, shp2710, shp2711, shp2712, shp2713, shp2714, shp2715, shp2716, shp2717, shp2718, shp2719, shp2720, shp2721, shp2722, shp2723, shp2724, shp2725, shp2726, shp2727, shp2728, shp2729, shp2730, shp2731, shp2732, shp2733, shp2734, shp2735, shp2736, shp2737, shp2738, shp2739, shp2740, shp2741, shp2742, shp2743, shp2744, shp2745, shp2746, shp2747, shp2748, shp2749, shp2750, shp2751, shp2752, shp2753, shp2754, shp2755, shp2756, shp2757, shp2758, shp2759, shp2760, shp2761, shp2762, shp2763, shp2764, shp2765, shp2766, shp2767, shp2768, shp2769, shp2770, shp2771, shp2772, shp2773, shp2774, shp2775, shp2776, shp2777, shp2778, shp2779, shp2780, shp2781, shp2782, shp2783, shp2784, shp2785, shp2786, shp2787, shp2788, shp2789, shp2790, shp2791, shp2792, shp2793, shp2794, shp2795, shp2796, shp2797, shp2798, shp2799, shp2800, shp2801, shp2802, shp2803, shp2804, shp2805, shp2806, shp2807, shp2808, shp2809, shp2810, shp2811, shp2812, shp2813, shp2814, shp2815, shp2816, shp2817, shp2818, shp2819, shp2820, shp2821, shp2822, shp2823, shp2824, shp2825, shp2826, shp2827, shp2828, shp2829, shp2830, shp2831, shp2832, shp2833, shp2834, shp2835, shp2836, shp2837, shp2838, shp2839, shp2840, shp2841, shp2842, shp2843, shp2844, shp2845, shp2846, shp2847, shp2848, shp2849, shp2850, shp2851, shp2852, shp2853, shp2854, shp2855, shp2856, shp2857, shp2858, shp2859, shp2860, shp2861, shp2862, shp2863, shp2864, shp2865, shp2866, shp2867, shp2868, shp2869, shp2870, shp2871, shp2872, shp2873, shp2874, shp2875, shp2876, shp2877, shp2878, shp2879, shp2880, shp2881, shp2882, shp2883, shp2884, shp2885, shp2886, shp2887, shp2888, shp2889, shp2890, shp2891, shp2892, shp2893, shp2894, shp2895, shp2896, shp2897, shp2898, shp2899, shp2900, shp2901, shp2902, shp2903, shp2904, shp2905, shp2906, shp2907, shp2908, shp2909, shp2910, shp2911, shp2912, shp2913, shp2914, shp2915, shp2916, shp2917, shp2918, shp2919, shp2920, shp2921, shp2922, shp2923, shp2924, shp2925, shp2926, shp2927, shp2928, shp2929, shp2930, shp2931, shp2932, shp2933, shp2934, shp2935, shp2936, shp2937, shp2938, shp2939, shp2940, shp2941, shp2942, shp2943, shp2944, shp2945, shp2946, shp2947, shp2948, shp2949, shp2950, shp2951, shp2952, shp2953, shp2954, shp2955, shp2956, shp2957, shp2958, shp2959, shp2960, shp2961, shp2962, shp2963, shp2964, shp2965, shp2966, shp2967, shp2968, shp2969, shp2970, shp2971, shp2972, shp2973, shp2974, shp2975, shp2976, shp2977, shp2978, shp2979, shp2980, shp2981, shp2982, shp2983, shp2984, shp2985, shp2986, shp2987, shp2988, shp2989, shp2990, shp2991, shp2992, shp2993, shp2994, shp2995, shp2996, shp2997, shp2998, shp2999, shp3000, shp3001, shp3002, shp3003, shp3004, shp3005, shp3006, shp3007, shp3008, shp3009, shp3010, shp3011, shp3012, shp3013, shp3014, shp3015, shp3016, shp3017, shp3018, shp3019, shp3020, shp3021, shp3022, shp3023, shp3024, shp3025, shp3026, shp3027, shp3028, shp3029, shp3030, shp3031, shp3032, shp3033, shp3034, shp3035, shp3036, shp3037, shp3038, shp3039, shp3040, shp3041, shp3042, shp3043, shp3044, shp3045, shp3046, shp3047, shp3048, shp3049, shp3050, shp3051, shp3052, shp3053, shp3054, shp3055, shp3056, shp3057, shp3058, shp3059, shp3060, shp3061, shp3062, shp3063, shp3064, shp3065, shp3066, shp3067, shp3068, shp3069, shp3070, shp3071, shp3072, shp3073, shp3074, shp3075, shp3076, shp3077, shp3078, shp3079, shp3080, shp3081, shp3082, shp3083, shp3084, shp3085, shp3086, shp3087, shp3088, shp3089, shp3090, shp3091, shp3092, shp3093, shp3094, shp3095, shp3096, shp3097, shp3098, shp3099, shp3100, shp3101, shp3102, shp3103, shp3104, shp3105, shp3106, shp3107, shp3108, shp3109, shp3110, shp3111, shp3112, shp3113, shp3114, shp3115, shp3116, shp3117, shp3118, shp3119, shp3120, shp3121, shp3122, shp3123, shp3124, shp3125, shp3126, shp3127, shp3128, shp3129, shp3130, shp3131, shp3132, shp3133, shp3134, shp3135, shp3136, shp3137, shp3138, shp3139, shp3140, shp3141, shp3142, shp3143, shp3144, shp3145, shp3146, shp3147, shp3148, shp3149, shp3150, shp3151, shp3152, shp3153, shp3154, shp3155, shp3156, shp3157, shp3158, shp3159, shp3160, shp3161, shp3162, shp3163, shp3164, shp3165, shp3166, shp3167, shp3168, shp3169, shp3170, shp3171, shp3172, shp3173, shp3174, shp3175, shp3176, shp3177, shp3178, shp3179, shp3180, shp3181, shp3182, shp3183, shp3184, shp3185, shp3186, shp3187, shp3188, shp3189, shp3190, shp3191, shp3192, shp3193, shp3194, shp3195, shp3196, shp3197, shp3198, shp3199, shp3200, shp3201, shp3202, shp3203, shp3204, shp3205, shp3206, shp3207, shp3208, shp3209, shp3210, shp3211, shp3212, shp3213, shp3214, shp3215, shp3216, shp3217, shp3218, shp3219, shp3220, shp3221, shp3222, shp3223, shp3224, shp3225, shp3226, shp3227, shp3228, shp3229, shp3230, shp3231, shp3232, shp3233, shp3234, shp3235, shp3236, shp3237, shp3238, shp3239, shp3240, shp3241, shp3242, shp3243, shp3244, shp3245, shp3246, shp3247, shp3248, shp3249, shp3250, shp3251, shp3252, shp3253, shp3254, shp3255, shp3256, shp3257, shp3258, shp3259, shp3260, shp3261, shp3262, shp3263, shp3264, shp3265, shp3266, shp3267, shp3268, shp3269, shp3270, shp3271, shp3272, shp3273, shp3274, shp3275, shp3276, shp3277, shp3278, shp3279, shp3280, shp3281, shp3282, shp3283, shp3284, shp3285, shp3286, shp3287, shp3288, shp3289, shp3290, shp3291, shp3292, shp3293, shp3294, shp3295, shp3296, shp3297, shp3298, shp3299, shp3300, shp3301, shp3302, shp3303, shp3304, shp3305, shp3306, shp3307, shp3308, shp3309, shp3310, shp3311, shp3312, shp3313, shp3314, shp3315, shp3316, shp3317, shp3318, shp3319, shp3320, shp3321, shp3322, shp3323, shp3324, shp3325, shp3326, shp3327, shp3328, shp3329, shp3330, shp3331, shp3332, shp3333, shp3334, shp3335, shp3336, shp3337, shp3338, shp3339, shp3340, shp3341, shp3342, shp3343, shp3344, shp3345, shp3346, shp3347, shp3348, shp3349, shp3350, shp3351, shp3352, shp3353, shp3354, shp3355, shp3356, shp3357, shp3358, shp3359, shp3360, shp3361, shp3362, shp3363, shp3364, shp3365, shp3366, shp3367, shp3368, shp3369, shp3370, shp3371, shp3372, shp3373, shp3374, shp3375, shp3376, shp3377, shp3378, shp3379, shp3380, shp3381, shp3382, shp3383, shp3384, shp3385, shp3386, shp3387, shp3388, shp3389, shp3390, shp3391, shp3392, shp3393, shp3394, shp3395, shp3396, shp3397, shp3398, shp3399, shp3400, shp3401, shp3402, shp3403, shp3404, shp3405, shp3406, shp3407, shp3408, shp3409, shp3410, shp3411, shp3412, shp3413, shp3414, shp3415, shp3416, shp3417, shp3418, shp3419, shp3420, shp3421, shp3422, shp3423, shp3424, shp3425, shp3426, shp3427, shp3428, shp3429, shp3430, shp3431, shp3432, shp3433, shp3434, shp3435, shp3436, shp3437, shp3438, shp3439, shp3440, shp3441, shp3442, shp3443, shp3444, shp3445, shp3446, shp3447, shp3448, shp3449, shp3450, shp3451, shp3452, shp3453, shp3454, shp3455, shp3456, shp3457, shp3458, shp3459, shp3460, shp3461, shp3462, shp3463, shp3464, shp3465, shp3466, shp3467, shp3468, shp3469, shp3470, shp3471, shp3472, shp3473, shp3474, shp3475, shp3476, shp3477, shp3478, shp3479, shp3480, shp3481, shp3482, shp3483, shp3484, shp3485, shp3486, shp3487, shp3488, shp3489, shp3490, shp3491, shp3492, shp3493, shp3494, shp3495, shp3496, shp3497, shp3498, shp3499, shp3500, shp3501, shp3502, shp3503, shp3504, shp3505, shp3506, shp3507, shp3508, shp3509, shp3510, shp3511, shp3512, shp3513, shp3514, shp3515, shp3516, shp3517, shp3518, shp3519, shp3520, shp3521, shp3522, shp3523, shp3524, shp3525, shp3526, shp3527, shp3528, shp3529, shp3530, shp3531, shp3532, shp3533, shp3534, shp3535, shp3536, shp3537, shp3538, shp3539, shp3540, shp3541, shp3542, shp3543, shp3544, shp3545, shp3546, shp3547, shp3548, shp3549, shp3550, shp3551, shp3552, shp3553, shp3554, shp3555, shp3556, shp3557, shp3558, shp3559, shp3560, shp3561, shp3562, shp3563, shp3564, shp3565, shp3566, shp3567, shp3568, shp3569, shp3570, shp3571, shp3572, shp3573, shp3574, shp3575, shp3576, shp3577, shp3578, shp3579, shp3580, shp3581, shp3582, shp3583, shp3584, shp3585, shp3586, shp3587, shp3588, shp3589, shp3590, shp3591, shp3592, shp3593, shp3594, shp3595, shp3596, shp3597, shp3598, shp3599, shp3600, shp3601, shp3602, shp3603, shp3604, shp3605, shp3606, shp3607, shp3608, shp3609, shp3610, shp3611, shp3612, shp3613, shp3614, shp3615, shp3616, shp3617, shp3618, shp3619, shp3620, shp3621, shp3622, shp3623, shp3624, shp3625, shp3626, shp3627, shp3628, shp3629, shp3630, shp3631, shp3632, shp3633, shp3634, shp3635, shp3636, shp3637, shp3638, shp3639, shp3640, shp3641, shp3642, shp3643, shp3644, shp3645, shp3646, shp3647, shp3648, shp3649, shp3650, shp3651, shp3652, shp3653, shp3654, shp3655, shp3656, shp3657, shp3658, shp3659, shp3660, shp3661, shp3662, shp3663, shp3664, shp3665, shp3666, shp3667, shp3668, shp3669, shp3670, shp3671, shp3672, shp3673, shp3674, shp3675, shp3676, shp3677, shp3678, shp3679, shp3680, shp3681, shp3682, shp3683, shp3684, shp3685, shp3686, shp3687, shp3688, shp3689, shp3690, shp3691, shp3692, shp3693, shp3694, shp3695, shp3696, shp3697, shp3698, shp3699, shp3700, shp3701, shp3702, shp3703, shp3704, shp3705, shp3706, shp3707, shp3708, shp3709, shp3710, shp3711, shp3712, shp3713, shp3714, shp3715, shp3716, shp3717, shp3718, shp3719, shp3720, shp3721, shp3722, shp3723, shp3724, shp3725, shp3726, shp3727, shp3728, shp3729, shp3730, shp3731, shp3732, shp3733, shp3734, shp3735, shp3736, shp3737, shp3738, shp3739, shp3740, shp3741, shp3742, shp3743, shp3744, shp3745, shp3746, shp3747, shp3748, shp3749, shp3750, shp3751, shp3752, shp3753, shp3754, shp3755, shp3756, shp3757, shp3758, shp3759, shp3760, shp3761, shp3762, shp3763, shp3764, shp3765, shp3766, shp3767, shp3768, shp3769, shp3770, shp3771, shp3772, shp3773, shp3774, shp3775, shp3776, shp3777, shp3778, shp3779, shp3780, shp3781, shp3782, shp3783, shp3784, shp3785, shp3786, shp3787, shp3788, shp3789, shp3790, shp3791, shp3792, shp3793, shp3794, shp3795, shp3796, shp3797, shp3798, shp3799, shp3800, shp3801, shp3802, shp3803, shp3804, shp3805, shp3806, shp3807, shp3808, shp3809, shp3810, shp3811, shp3812, shp3813, shp3814, shp3815, shp3816, shp3817, shp3818, shp3819, shp3820, shp3821, shp3822, shp3823, shp3824, shp3825, shp3826, shp3827, shp3828, shp3829, shp3830, shp3831, shp3832, shp3833, shp3834, shp3835, shp3836, shp3837, shp3838, shp3839, shp3840, shp3841, shp3842, shp3843, shp3844, shp3845, shp3846, shp3847, shp3848, shp3849, shp3850, shp3851, shp3852, shp3853, shp3854, shp3855, shp3856, shp3857, shp3858, shp3859, shp3860, shp3861, shp3862, shp3863, shp3864, shp3865, shp3866, shp3867, shp3868, shp3869, shp3870, shp3871, shp3872, shp3873, shp3874, shp3875, shp3876, shp3877, shp3878, shp3879, shp3880, shp3881, shp3882, shp3883, shp3884, shp3885, shp3886, shp3887, shp3888, shp3889, shp3890, shp3891, shp3892, shp3893, shp3894, shp3895, shp3896, shp3897, shp3898, shp3899, shp3900, shp3901, shp3902, shp3903, shp3904, shp3905, shp3906, shp3907, shp3908, shp3909, shp3910, shp3911, shp3912, shp3913, shp3914, shp3915, shp3916, shp3917, shp3918, shp3919, shp3920, shp3921, shp3922, shp3923, shp3924, shp3925, shp3926, shp3927, shp3928, shp3929, shp3930, shp3931, shp3932, shp3933, shp3934, shp3935, shp3936, shp3937, shp3938, shp3939, shp3940, shp3941, shp3942, shp3943, shp3944, shp3945, shp3946, shp3947, shp3948, shp3949, shp3950, shp3951, shp3952, shp3953, shp3954, shp3955, shp3956, shp3957, shp3958, shp3959, shp3960, shp3961, shp3962, shp3963, shp3964, shp3965, shp3966, shp3967, shp3968, shp3969, shp3970, shp3971, shp3972, shp3973, shp3974, shp3975, shp3976, shp3977, shp3978, shp3979, shp3980, shp3981, shp3982, shp3983, shp3984, shp3985, shp3986, shp3987, shp3988, shp3989, shp3990, shp3991, shp3992, shp3993, shp3994, shp3995, shp3996, shp3997, shp3998, shp3999, shp4000, shp4001, shp4002, shp4003, shp4004, shp4005, shp4006, shp4007, shp4008, shp4009, shp4010, shp4011, shp4012, shp4013, shp4014, shp4015, shp4016, shp4017, shp4018, shp4019, shp4020, shp4021, shp4022, shp4023, shp4024, shp4025, shp4026, shp4027, shp4028, shp4029, shp4030, shp4031, shp4032, shp4033, shp4034, shp4035, shp4036, shp4037, shp4038, shp4039, shp4040, shp4041, shp4042, shp4043, shp4044, shp4045, shp4046, shp4047, shp4048, shp4049, shp4050, shp4051, shp4052, shp4053, shp4054, shp4055, shp4056, shp4057, shp4058, shp4059, shp4060, shp4061, shp4062, shp4063, shp4064, shp4065, shp4066, shp4067, shp4068, shp4069, shp4070, shp4071, shp4072, shp4073, shp4074, shp4075, shp4076, shp4077, shp4078, shp4079, shp4080, shp4081, shp4082, shp4083, shp4084, shp4085, shp4086, shp4087, shp4088, shp4089, shp4090, shp4091, shp4092, shp4093, shp4094, shp4095, shp4096, shp4097, shp4098, shp4099, shp4100, shp4101, shp4102, shp4103, shp4104, shp4105, shp4106, shp4107, shp4108, shp4109, shp4110, shp4111, shp4112, shp4113, shp4114, shp4115, shp4116, shp4117, shp4118, shp4119, shp4120, shp4121, shp4122, shp4123, shp4124, shp4125, shp4126, shp4127, shp4128, shp4129, shp4130, shp4131, shp4132, shp4133, shp4134, shp4135, shp4136, shp4137, shp4138, shp4139, shp4140, shp4141, shp4142, shp4143, shp4144, shp4145, shp4146, shp4147, shp4148, shp4149, shp4150, shp4151, shp4152, shp4153, shp4154, shp4155, shp4156, shp4157, shp4158, shp4159, shp4160, shp4161, shp4162, shp4163, shp4164, shp4165, shp4166, shp4167, shp4168, shp4169, shp4170, shp4171, shp4172, shp4173, shp4174, shp4175, shp4176, shp4177, shp4178, shp4179, shp4180, shp4181, shp4182, shp4183, shp4184, shp4185, shp4186, shp4187, shp4188, shp4189, shp4190, shp4191, shp4192, shp4193, shp4194, shp4195, shp4196, shp4197, shp4198, shp4199, shp4200, shp4201, shp4202, shp4203, shp4204, shp4205, shp4206, shp4207, shp4208, shp4209, shp4210, shp4211, shp4212, shp4213, shp4214, shp4215, shp4216, shp4217, shp4218, shp4219, shp4220, shp4221, shp4222, shp4223, shp4224, shp4225, shp4226, shp4227, shp4228, shp4229, shp4230, shp4231, shp4232, shp4233, shp4234, shp4235, shp4236, shp4237, shp4238, shp4239, shp4240, shp4241, shp4242, shp4243, shp4244, shp4245, shp4246, shp4247, shp4248, shp4249, shp4250, shp4251, shp4252, shp4253, shp4254, shp4255, shp4256, shp4257, shp4258, shp4259, shp4260, shp4261, shp4262, shp4263, shp4264, shp4265, shp4266, shp4267, shp4268, shp4269, shp4270, shp4271, shp4272, shp4273, shp4274, shp4275, shp4276, shp4277, shp4278, shp4279, shp4280, shp4281, shp4282, shp4283, shp4284, shp4285, shp4286, shp4287, shp4288, shp4289, shp4290, shp4291, shp4292, shp4293, shp4294, shp4295, shp4296, shp4297, shp4298, shp4299, shp4300, shp4301, shp4302, shp4303, shp4304, shp4305, shp4306, shp4307, shp4308, shp4309, shp4310, shp4311, shp4312, shp4313, shp4314, shp4315, shp4316, shp4317, shp4318, shp4319, shp4320, shp4321, shp4322, shp4323, shp4324, shp4325, shp4326, shp4327, shp4328, shp4329, shp4330, shp4331, shp4332, shp4333, shp4334, shp4335, shp4336, shp4337, shp4338, shp4339, shp4340, shp4341, shp4342, shp4343, shp4344, shp4345, shp4346, shp4347, shp4348, shp4349, shp4350, shp4351, shp4352, shp4353, shp4354, shp4355, shp4356, shp4357, shp4358, shp4359, shp4360, shp4361, shp4362, shp4363, shp4364, shp4365, shp4366, shp4367, shp4368, shp4369, shp4370, shp4371, shp4372, shp4373, shp4374, shp4375, shp4376, shp4377, shp4378, shp4379, shp4380, shp4381, shp4382, shp4383, shp4384, shp4385, shp4386, shp4387, shp4388, shp4389, shp4390, shp4391, shp4392, shp4393, shp4394, shp4395, shp4396, shp4397, shp4398, shp4399, shp4400, shp4401, shp4402, shp4403, shp4404, shp4405, shp4406, shp4407, shp4408, shp4409, shp4410, shp4411, shp4412, shp4413, shp4414, shp4415, shp4416, shp4417, shp4418, shp4419, shp4420, shp4421, shp4422, shp4423, shp4424, shp4425, shp4426, shp4427, shp4428, shp4429, shp4430, shp4431, shp4432, shp4433, shp4434, shp4435, shp4436, shp4437, shp4438, shp4439, shp4440, shp4441, shp4442, shp4443, shp4444, shp4445, shp4446, shp4447, shp4448, shp4449, shp4450, shp4451, shp4452, shp4453, shp4454, shp4455, shp4456, shp4457, shp4458, shp4459, shp4460, shp4461, shp4462, shp4463, shp4464, shp4465, shp4466, shp4467, shp4468, shp4469, shp4470, shp4471, shp4472, shp4473, shp4474, shp4475, shp4476, shp4477, shp4478, shp4479, shp4480, shp4481, shp4482, shp4483, shp4484, shp4485, shp4486, shp4487, shp4488, shp4489, shp4490, shp4491, shp4492, shp4493, shp4494, shp4495, shp4496, shp4497, shp4498, shp4499, shp4500, shp4501, shp4502, shp4503, shp4504, shp4505, shp4506, shp4507, shp4508, shp4509, shp4510, shp4511, shp4512, shp4513, shp4514, shp4515, shp4516, shp4517, shp4518, shp4519, shp4520, shp4521, shp4522, shp4523, shp4524, shp4525, shp4526, shp4527, shp4528, shp4529, shp4530, shp4531, shp4532, shp4533, shp4534, shp4535, shp4536, shp4537, shp4538, shp4539, shp4540, shp4541, shp4542, shp4543, shp4544, shp4545, shp4546, shp4547, shp4548, shp4549, shp4550, shp4551, shp4552, shp4553, shp4554, shp4555, shp4556, shp4557, shp4558, shp4559, shp4560, shp4561, shp4562, shp4563, shp4564, shp4565, shp4566, shp4567, shp4568, shp4569, shp4570, shp4571, shp4572, shp4573, shp4574, shp4575, shp4576, shp4577, shp4578, shp4579, shp4580, shp4581, shp4582, shp4583, shp4584, shp4585, shp4586, shp4587, shp4588, shp4589, shp4590, shp4591, shp4592, shp4593, shp4594, shp4595, shp4596, shp4597, shp4598, shp4599, shp4600, shp4601, shp4602, shp4603, shp4604, shp4605, shp4606, shp4607, shp4608, shp4609, shp4610, shp4611, shp4612, shp4613, shp4614, shp4615, shp4616, shp4617, shp4618, shp4619, shp4620, shp4621, shp4622, shp4623, shp4624, shp4625, shp4626, shp4627, shp4628, shp4629, shp4630, shp4631, shp4632, shp4633, shp4634, shp4635, shp4636, shp4637, shp4638, shp4639, shp4640, shp4641, shp4642, shp4643, shp4644, shp4645, shp4646, shp4647, shp4648, shp4649, shp4650, shp4651, shp4652, shp4653, shp4654, shp4655, shp4656, shp4657, shp4658, shp4659, shp4660, shp4661, shp4662, shp4663, shp4664, shp4665, shp4666, shp4667, shp4668, shp4669, shp4670, shp4671, shp4672, shp4673, shp4674, shp4675, shp4676, shp4677, shp4678, shp4679, shp4680, shp4681, shp4682, shp4683, shp4684, shp4685, shp4686, shp4687, shp4688, shp4689, shp4690, shp4691, shp4692, shp4693, shp4694, shp4695, shp4696, shp4697, shp4698, shp4699, shp4700, shp4701, shp4702, shp4703, shp4704, shp4705, shp4706, shp4707, shp4708, shp4709, shp4710, shp4711, shp4712, shp4713, shp4714, shp4715, shp4716, shp4717, shp4718, shp4719, shp4720, shp4721, shp4722, shp4723, shp4724, shp4725, shp4726, shp4727, shp4728, shp4729, shp4730, shp4731, shp4732, shp4733, shp4734, shp4735, shp4736, shp4737, shp4738, shp4739, shp4740, shp4741, shp4742, shp4743, shp4744, shp4745, shp4746, shp4747, shp4748, shp4749, shp4750, shp4751, shp4752, shp4753, shp4754, shp4755, shp4756, shp4757, shp4758, shp4759, shp4760, shp4761, shp4762, shp4763, shp4764, shp4765, shp4766, shp4767, shp4768, shp4769, shp4770, shp4771, shp4772, shp4773, shp4774, shp4775, shp4776, shp4777, shp4778, shp4779, shp4780, shp4781, shp4782, shp4783, shp4784, shp4785, shp4786, shp4787, shp4788, shp4789, shp4790, shp4791, shp4792, shp4793, shp4794, shp4795, shp4796, shp4797, shp4798, shp4799, shp4800, shp4801, shp4802, shp4803, shp4804, shp4805, shp4806, shp4807, shp4808, shp4809, shp4810, shp4811, shp4812, shp4813, shp4814, shp4815, shp4816, shp4817, shp4818, shp4819, shp4820, shp4821, shp4822, shp4823, shp4824, shp4825, shp4826, shp4827, shp4828, shp4829, shp4830, shp4831, shp4832, shp4833, shp4834, shp4835, shp4836, shp4837, shp4838, shp4839, shp4840, shp4841, shp4842, shp4843, shp4844, shp4845, shp4846, shp4847, shp4848, shp4849, shp4850, shp4851, shp4852, shp4853, shp4854, shp4855, shp4856, shp4857, shp4858, shp4859, shp4860, shp4861, shp4862, shp4863, shp4864, shp4865, shp4866, shp4867, shp4868, shp4869, shp4870, shp4871, shp4872, shp4873, shp4874, shp4875, shp4876, shp4877, shp4878, shp4879, shp4880, shp4881, shp4882, shp4883, shp4884, shp4885, shp4886, shp4887, shp4888, shp4889, shp4890, shp4891, shp4892, shp4893, shp4894, shp4895, shp4896, shp4897, shp4898, shp4899, shp4900, shp4901, shp4902, shp4903, shp4904, shp4905, shp4906, shp4907, shp4908, shp4909, shp4910, shp4911, shp4912, shp4913, shp4914, shp4915, shp4916, shp4917, shp4918, shp4919, shp4920, shp4921, shp4922, shp4923, shp4924, shp4925, shp4926, shp4927, shp4928, shp4929, shp4930, shp4931, shp4932, shp4933, shp4934, shp4935, shp4936, shp4937, shp4938, shp4939, shp4940, shp4941, shp4942, shp4943, shp4944, shp4945, shp4946, shp4947, shp4948, shp4949, shp4950, shp4951, shp4952, shp4953, shp4954, shp4955, shp4956, shp4957, shp4958, shp4959, shp4960, shp4961, shp4962, shp4963, shp4964, shp4965, shp4966, shp4967, shp4968, shp4969, shp4970, shp4971, shp4972, shp4973, shp4974, shp4975, shp4976, shp4977, shp4978, shp4979, shp4980, shp4981, shp4982, shp4983, shp4984, shp4985, shp4986, shp4987, shp4988, shp4989, shp4990, shp4991, shp4992, shp4993, shp4994, shp4995, shp4996, shp4997, shp4998, shp4999, shp5000, shp5001, shp5002, shp5003, shp5004, shp5005, shp5006, shp5007, shp5008, shp5009, shp5010, shp5011, shp5012, shp5013, shp5014, shp5015, shp5016, shp5017, shp5018, shp5019, shp5020, shp5021, shp5022, shp5023, shp5024, shp5025, shp5026, shp5027, shp5028, shp5029, shp5030, shp5031, shp5032, shp5033, shp5034, shp5035, shp5036, shp5037, shp5038, shp5039, shp5040, shp5041, shp5042, shp5043, shp5044, shp5045, shp5046, shp5047, shp5048, shp5049, shp5050, shp5051, shp5052, shp5053, shp5054, shp5055, shp5056, shp5057, shp5058, shp5059, shp5060, shp5061, shp5062, shp5063, shp5064, shp5065, shp5066, shp5067, shp5068, shp5069, shp5070, shp5071, shp5072, shp5073, shp5074, shp5075, shp5076, shp5077, shp5078, shp5079, shp5080, shp5081, shp5082, shp5083, shp5084, shp5085, shp5086, shp5087, shp5088, shp5089, shp5090, shp5091, shp5092, shp5093, shp5094, shp5095, shp5096, shp5097, shp5098, shp5099, shp5100, shp5101, shp5102, shp5103, shp5104, shp5105, shp5106, shp5107, shp5108, shp5109, shp5110, shp5111, shp5112, shp5113, shp5114, shp5115, shp5116, shp5117, shp5118, shp5119, shp5120, shp5121, shp5122, shp5123, shp5124, shp5125, shp5126, shp5127, shp5128, shp5129, shp5130, shp5131, shp5132, shp5133, shp5134, shp5135, shp5136, shp5137, shp5138, shp5139, shp5140, shp5141, shp5142, shp5143, shp5144, shp5145, shp5146, shp5147, shp5148, shp5149, shp5150, shp5151, shp5152, shp5153, shp5154, shp5155, shp5156, shp5157, shp5158, shp5159, shp5160, shp5161, shp5162, shp5163, shp5164, shp5165, shp5166, shp5167, shp5168, shp5169, shp5170, shp5171, shp5172, shp5173, shp5174, shp5175, shp5176, shp5177, shp5178, shp5179, shp5180, shp5181, shp5182, shp5183, shp5184, shp5185, shp5186, shp5187, shp5188, shp5189, shp5190, shp5191, shp5192, shp5193, shp5194, shp5195, shp5196, shp5197, shp5198, shp5199, shp5200, shp5201, shp5202, shp5203, shp5204, shp5205, shp5206, shp5207, shp5208, shp5209, shp5210, shp5211, shp5212, shp5213, shp5214, shp5215, shp5216, shp5217, shp5218, shp5219, shp5220, shp5221, shp5222, shp5223, shp5224, shp5225, shp5226, shp5227, shp5228, shp5229, shp5230, shp5231, shp5232, shp5233, shp5234, shp5235, shp5236, shp5237, shp5238, shp5239, shp5240, shp5241, shp5242, shp5243, shp5244, shp5245, shp5246, shp5247, shp5248, shp5249, shp5250, shp5251, shp5252, shp5253, shp5254, shp5255, shp5256, shp5257, shp5258, shp5259, shp5260, shp5261, shp5262, shp5263, shp5264, shp5265, shp5266, shp5267, shp5268, shp5269, shp5270, shp5271, shp5272, shp5273, shp5274, shp5275, shp5276, shp5277, shp5278, shp5279, shp5280, shp5281, shp5282, shp5283, shp5284, shp5285, shp5286, shp5287, shp5288, shp5289, shp5290, shp5291, shp5292, shp5293, shp5294, shp5295, shp5296, shp5297, shp5298, shp5299, shp5300, shp5301, shp5302, shp5303, shp5304, shp5305, shp5306, shp5307, shp5308, shp5309, shp5310, shp5311, shp5312, shp5313, shp5314, shp5315, shp5316, shp5317, shp5318, shp5319, shp5320, shp5321, shp5322, shp5323, shp5324, shp5325, shp5326, shp5327, shp5328, shp5329, shp5330, shp5331, shp5332, shp5333, shp5334, shp5335, shp5336, shp5337, shp5338, shp5339, shp5340, shp5341, shp5342, shp5343, shp5344, shp5345, shp5346, shp5347, shp5348, shp5349, shp5350, shp5351, shp5352, shp5353, shp5354, shp5355, shp5356, shp5357, shp5358, shp5359, shp5360, shp5361, shp5362, shp5363, shp5364, shp5365, shp5366, shp5367, shp5368, shp5369, shp5370, shp5371, shp5372, shp5373, shp5374, shp5375, shp5376, shp5377, shp5378, shp5379, shp5380, shp5381, shp5382, shp5383, shp5384, shp5385, shp5386, shp5387, shp5388, shp5389, shp5390, shp5391, shp5392, shp5393, shp5394, shp5395, shp5396, shp5397, shp5398, shp5399, shp5400, shp5401, shp5402, shp5403, shp5404, shp5405, shp5406, shp5407, shp5408, shp5409, shp5410, shp5411, shp5412, shp5413, shp5414, shp5415, shp5416, shp5417, shp5418, shp5419, shp5420, shp5421, shp5422, shp5423, shp5424, shp5425, shp5426, shp5427, shp5428, shp5429, shp5430, shp5431, shp5432, shp5433, shp5434, shp5435, shp5436, shp5437, shp5438, shp5439, shp5440, shp5441, shp5442, shp5443, shp5444, shp5445, shp5446, shp5447, shp5448, shp5449, shp5450, shp5451, shp5452, shp5453, shp5454, shp5455, shp5456, shp5457, shp5458, shp5459, shp5460, shp5461, shp5462, shp5463, shp5464, shp5465, shp5466, shp5467, shp5468, shp5469, shp5470, shp5471, shp5472, shp5473, shp5474, shp5475, shp5476, shp5477, shp5478, shp5479, shp5480, shp5481, shp5482, shp5483, shp5484, shp5485, shp5486, shp5487, shp5488, shp5489, shp5490, shp5491, shp5492, shp5493, shp5494, shp5495, shp5496, shp5497, shp5498, shp5499, shp5500, shp5501, shp5502, shp5503, shp5504, shp5505, shp5506, shp5507, shp5508, shp5509, shp5510, shp5511, shp5512, shp5513, shp5514, shp5515, shp5516, shp5517, shp5518, shp5519, shp5520, shp5521, shp5522, shp5523, shp5524, shp5525, shp5526, shp5527, shp5528, shp5529, shp5530, shp5531, shp5532, shp5533, shp5534, shp5535, shp5536, shp5537, shp5538, shp5539, shp5540, shp5541, shp5542, shp5543, shp5544, shp5545, shp5546, shp5547, shp5548, shp5549, shp5550, shp5551, shp5552, shp5553, shp5554, shp5555, shp5556, shp5557, shp5558, shp5559, shp5560, shp5561, shp5562, shp5563, shp5564, shp5565, shp5566, shp5567, shp5568, shp5569, shp5570, shp5571, shp5572, shp5573, shp5574, shp5575, shp5576, shp5577, shp5578, shp5579, shp5580, shp5581, shp5582, shp5583, shp5584, shp5585, shp5586, shp5587, shp5588, shp5589, shp5590, shp5591, shp5592, shp5593, shp5594, shp5595, shp5596, shp5597, shp5598, shp5599, shp5600, shp5601, shp5602, shp5603, shp5604, shp5605, shp5606, shp5607, shp5608, shp5609, shp5610, shp5611, shp5612, shp5613, shp5614, shp5615, shp5616, shp5617, shp5618, shp5619, shp5620, shp5621, shp5622, shp5623, shp5624, shp5625, shp5626, shp5627, shp5628, shp5629, shp5630, shp5631, shp5632, shp5633, shp5634, shp5635, shp5636, shp5637, shp5638, shp5639, shp5640, shp5641, shp5642, shp5643, shp5644, shp5645, shp5646, shp5647, shp5648, shp5649, shp5650, shp5651, shp5652, shp5653, shp5654, shp5655, shp5656, shp5657, shp5658, shp5659, shp5660, shp5661, shp5662, shp5663, shp5664, shp5665, shp5666, shp5667, shp5668, shp5669, shp5670, shp5671, shp5672, shp5673, shp5674, shp5675, shp5676, shp5677, shp5678, shp5679, shp5680, shp5681, shp5682, shp5683, shp5684, shp5685, shp5686, shp5687, shp5688, shp5689, shp5690, shp5691, shp5692, shp5693, shp5694, shp5695, shp5696, shp5697, shp5698, shp5699, shp5700, shp5701, shp5702, shp5703, shp5704, shp5705, shp5706, shp5707, shp5708, shp5709, shp5710, shp5711, shp5712, shp5713, shp5714, shp5715, shp5716, shp5717, shp5718, shp5719, shp5720, shp5721, shp5722, shp5723, shp5724, shp5725, shp5726, shp5727, shp5728, shp5729, shp5730, shp5731, shp5732, shp5733, shp5734, shp5735, shp5736, shp5737, shp5738, shp5739, shp5740, shp5741, shp5742, shp5743, shp5744, shp5745, shp5746, shp5747, shp5748, shp5749, shp5750, shp5751, shp5752, shp5753, shp5754, shp5755, shp5756, shp5757, shp5758, shp5759, shp5760, shp5761, shp5762, shp5763, shp5764, shp5765, shp5766, shp5767, shp5768, shp5769, shp5770, shp5771, shp5772, shp5773, shp5774, shp5775, shp5776, shp5777, shp5778, shp5779, shp5780, shp5781, shp5782, shp5783, shp5784, shp5785, shp5786, shp5787, shp5788, shp5789, shp5790, shp5791, shp5792, shp5793, shp5794, shp5795, shp5796, shp5797, shp5798, shp5799, shp5800, shp5801, shp5802, shp5803, shp5804, shp5805, shp5806, shp5807, shp5808, shp5809, shp5810, shp5811, shp5812, shp5813, shp5814, shp5815, shp5816, shp5817, shp5818, shp5819, shp5820, shp5821, shp5822, shp5823, shp5824, shp5825, shp5826, shp5827, shp5828, shp5829, shp5830, shp5831, shp5832, shp5833, shp5834, shp5835, shp5836, shp5837, shp5838, shp5839, shp5840, shp5841, shp5842, shp5843, shp5844, shp5845, shp5846, shp5847, shp5848, shp5849, shp5850, shp5851, shp5852, shp5853, shp5854, shp5855, shp5856, shp5857, shp5858, shp5859, shp5860, shp5861, shp5862, shp5863, shp5864, shp5865, shp5866, shp5867, shp5868, shp5869, shp5870, shp5871, shp5872, shp5873, shp5874, shp5875, shp5876, shp5877, shp5878, shp5879, shp5880, shp5881, shp5882, shp5883, shp5884, shp5885, shp5886, shp5887, shp5888, shp5889, shp5890, shp5891, shp5892, shp5893, shp5894, shp5895, shp5896, shp5897, shp5898, shp5899, shp5900, shp5901, shp5902, shp5903, shp5904, shp5905, shp5906, shp5907, shp5908, shp5909, shp5910, shp5911, shp5912, shp5913, shp5914, shp5915, shp5916, shp5917, shp5918, shp5919, shp5920, shp5921, shp5922, shp5923, shp5924, shp5925, shp5926, shp5927, shp5928, shp5929, shp5930, shp5931, shp5932, shp5933, shp5934, shp5935, shp5936, shp5937, shp5938, shp5939, shp5940, shp5941, shp5942, shp5943, shp5944, shp5945, shp5946, shp5947, shp5948, shp5949, shp5950, shp5951, shp5952, shp5953, shp5954, shp5955, shp5956, shp5957, shp5958, shp5959, shp5960, shp5961, shp5962, shp5963, shp5964, shp5965, shp5966, shp5967, shp5968, shp5969, shp5970, shp5971, shp5972, shp5973, shp5974, shp5975, shp5976, shp5977, shp5978, shp5979, shp5980, shp5981, shp5982, shp5983, shp5984, shp5985, shp5986, shp5987, shp5988, shp5989, shp5990, shp5991, shp5992, shp5993, shp5994, shp5995, shp5996, shp5997, shp5998, shp5999, shp6000, shp6001, shp6002, shp6003, shp6004, shp6005, shp6006, shp6007, shp6008, shp6009, shp6010, shp6011, shp6012, shp6013, shp6014, shp6015, shp6016, shp6017, shp6018, shp6019, shp6020, shp6021, shp6022, shp6023, shp6024, shp6025, shp6026, shp6027, shp6028, shp6029, shp6030, shp6031, shp6032, shp6033, shp6034, shp6035, shp6036, shp6037, shp6038, shp6039, shp6040, shp6041, shp6042, shp6043, shp6044, shp6045, shp6046, shp6047, shp6048, shp6049, shp6050, shp6051, shp6052, shp6053, shp6054, shp6055, shp6056, shp6057, shp6058, shp6059, shp6060, shp6061, shp6062, shp6063, shp6064, shp6065, shp6066, shp6067, shp6068, shp6069, shp6070, shp6071, shp6072, shp6073, shp6074, shp6075, shp6076, shp6077, shp6078, shp6079, shp6080, shp6081, shp6082, shp6083, shp6084, shp6085, shp6086, shp6087, shp6088, shp6089, shp6090, shp6091, shp6092, shp6093, shp6094, shp6095, shp6096, shp6097, shp6098, shp6099, shp6100, shp6101, shp6102, shp6103, shp6104, shp6105, shp6106, shp6107, shp6108, shp6109, shp6110, shp6111, shp6112, shp6113, shp6114, shp6115, shp6116, shp6117, shp6118, shp6119, shp6120, shp6121, shp6122, shp6123, shp6124, shp6125, shp6126, shp6127, shp6128, shp6129, shp6130, shp6131, shp6132, shp6133, shp6134, shp6135, shp6136, shp6137, shp6138, shp6139, shp6140, shp6141, shp6142, shp6143, shp6144, shp6145, shp6146, shp6147, shp6148, shp6149, shp6150, shp6151, shp6152, shp6153, shp6154, shp6155, shp6156, shp6157, shp6158, shp6159, shp6160, shp6161, shp6162, shp6163, shp6164, shp6165, shp6166, shp6167, shp6168, shp6169, shp6170, shp6171, shp6172, shp6173, shp6174, shp6175, shp6176, shp6177, shp6178, shp6179, shp6180, shp6181, shp6182, shp6183, shp6184, shp6185, shp6186, shp6187, shp6188, shp6189, shp6190, shp6191, shp6192, shp6193, shp6194, shp6195, shp6196, shp6197, shp6198, shp6199, shp6200, shp6201, shp6202, shp6203, shp6204, shp6205, shp6206, shp6207, shp6208, shp6209, shp6210, shp6211, shp6212, shp6213, shp6214, shp6215, shp6216, shp6217, shp6218, shp6219, shp6220, shp6221, shp6222, shp6223, shp6224, shp6225, shp6226, shp6227, shp6228, shp6229, shp6230, shp6231, shp6232, shp6233, shp6234, shp6235, shp6236, shp6237, shp6238, shp6239, shp6240, shp6241, shp6242, shp6243, shp6244, shp6245, shp6246, shp6247, shp6248, shp6249, shp6250, shp6251, shp6252, shp6253, shp6254, shp6255, shp6256, shp6257, shp6258, shp6259, shp6260, shp6261, shp6262, shp6263, shp6264, shp6265, shp6266, shp6267, shp6268, shp6269, shp6270, shp6271, shp6272, shp6273, shp6274, shp6275, shp6276, shp6277, shp6278, shp6279, shp6280, shp6281, shp6282, shp6283, shp6284, shp6285, shp6286, shp6287, shp6288, shp6289, shp6290, shp6291, shp6292, shp6293, shp6294, shp6295, shp6296, shp6297, shp6298, shp6299, shp6300, shp6301, shp6302, shp6303, shp6304, shp6305, shp6306, shp6307, shp6308, shp6309, shp6310, shp6311, shp6312, shp6313, shp6314, shp6315, shp6316, shp6317, shp6318, shp6319, shp6320, shp6321, shp6322, shp6323, shp6324, shp6325, shp6326, shp6327, shp6328, shp6329, shp6330, shp6331, shp6332, shp6333, shp6334, shp6335, shp6336, shp6337, shp6338, shp6339, shp6340, shp6341, shp6342, shp6343, shp6344, shp6345, shp6346, shp6347, shp6348, shp6349, shp6350, shp6351, shp6352, shp6353, shp6354, shp6355, shp6356, shp6357, shp6358, shp6359, shp6360, shp6361, shp6362, shp6363, shp6364, shp6365, shp6366, shp6367, shp6368, shp6369, shp6370, shp6371, shp6372, shp6373, shp6374, shp6375, shp6376, shp6377, shp6378, shp6379, shp6380, shp6381, shp6382, shp6383, shp6384, shp6385, shp6386, shp6387, shp6388, shp6389, shp6390, shp6391, shp6392, shp6393, shp6394, shp6395, shp6396, shp6397, shp6398, shp6399, shp6400, shp6401, shp6402, shp6403, shp6404, shp6405, shp6406, shp6407, shp6408, shp6409, shp6410, shp6411, shp6412, shp6413, shp6414, shp6415, shp6416, shp6417, shp6418, shp6419, shp6420, shp6421, shp6422, shp6423, shp6424, shp6425, shp6426, shp6427, shp6428, shp6429, shp6430, shp6431, shp6432, shp6433, shp6434, shp6435, shp6436, shp6437, shp6438, shp6439, shp6440, shp6441, shp6442, shp6443, shp6444, shp6445, shp6446, shp6447, shp6448, shp6449, shp6450, shp6451, shp6452, shp6453, shp6454, shp6455, shp6456, shp6457, shp6458, shp6459, shp6460, shp6461, shp6462, shp6463, shp6464, shp6465, shp6466, shp6467, shp6468, shp6469, shp6470, shp6471, shp6472, shp6473, shp6474, shp6475, shp6476, shp6477, shp6478, shp6479, shp6480, shp6481, shp6482, shp6483, shp6484, shp6485, shp6486, shp6487, shp6488, shp6489, shp6490, shp6491, shp6492, shp6493, shp6494, shp6495, shp6496, shp6497, shp6498, shp6499, shp6500, shp6501, shp6502, shp6503, shp6504, shp6505, shp6506, shp6507, shp6508, shp6509, shp6510, shp6511, shp6512, shp6513, shp6514, shp6515, shp6516, shp6517, shp6518, shp6519, shp6520, shp6521, shp6522, shp6523, shp6524, shp6525, shp6526, shp6527, shp6528, shp6529, shp6530, shp6531, shp6532, shp6533, shp6534, shp6535, shp6536, shp6537, shp6538, shp6539, shp6540, shp6541, shp6542, shp6543, shp6544, shp6545, shp6546, shp6547, shp6548, shp6549, shp6550, shp6551, shp6552, shp6553, shp6554, shp6555, shp6556, shp6557, shp6558, shp6559, shp6560, shp6561, shp6562, shp6563, shp6564, shp6565, shp6566, shp6567, shp6568, shp6569, shp6570, shp6571, shp6572, shp6573, shp6574, shp6575, shp6576, shp6577, shp6578, shp6579, shp6580, shp6581, shp6582, shp6583, shp6584, shp6585, shp6586, shp6587, shp6588, shp6589, shp6590, shp6591, shp6592, shp6593, shp6594, shp6595, shp6596, shp6597, shp6598, shp6599, shp6600, shp6601, shp6602, shp6603, shp6604, shp6605, shp6606, shp6607, shp6608, shp6609, shp6610, shp6611, shp6612, shp6613, shp6614, shp6615, shp6616, shp6617, shp6618, shp6619, shp6620, shp6621, shp6622, shp6623, shp6624, shp6625, shp6626, shp6627, shp6628, shp6629, shp6630, shp6631, shp6632, shp6633, shp6634, shp6635, shp6636, shp6637, shp6638, shp6639, shp6640, shp6641, shp6642, shp6643, shp6644, shp6645, shp6646, shp6647, shp6648, shp6649, shp6650, shp6651, shp6652, shp6653, shp6654, shp6655, shp6656, shp6657, shp6658, shp6659, shp6660, shp6661, shp6662, shp6663, shp6664, shp6665, shp6666, shp6667, shp6668, shp6669, shp6670, shp6671, shp6672, shp6673, shp6674, shp6675, shp6676, shp6677, shp6678, shp6679, shp6680, shp6681, shp6682, shp6683, shp6684, shp6685, shp6686, shp6687, shp6688, shp6689, shp6690, shp6691, shp6692, shp6693, shp6694, shp6695, shp6696, shp6697, shp6698, shp6699, shp6700, shp6701, shp6702, shp6703, shp6704, shp6705, shp6706, shp6707, shp6708, shp6709, shp6710, shp6711, shp6712, shp6713, shp6714, shp6715, shp6716, shp6717, shp6718, shp6719, shp6720, shp6721, shp6722, shp6723, shp6724, shp6725, shp6726, shp6727, shp6728, shp6729, shp6730, shp6731, shp6732, shp6733, shp6734, shp6735, shp6736, shp6737, shp6738, shp6739, shp6740, shp6741, shp6742, shp6743, shp6744, shp6745, shp6746, shp6747, shp6748, shp6749, shp6750, shp6751, shp6752, shp6753, shp6754, shp6755, shp6756, shp6757, shp6758, shp6759, shp6760, shp6761, shp6762, shp6763, shp6764, shp6765, shp6766, shp6767, shp6768, shp6769, shp6770, shp6771, shp6772, shp6773, shp6774, shp6775, shp6776, shp6777, shp6778, shp6779, shp6780, shp6781, shp6782, shp6783, shp6784, shp6785, shp6786, shp6787, shp6788, shp6789, shp6790, shp6791, shp6792, shp6793, shp6794, shp6795, shp6796, shp6797, shp6798, shp6799, shp6800, shp6801, shp6802, shp6803, shp6804, shp6805, shp6806, shp6807, shp6808, shp6809, shp6810, shp6811, shp6812, shp6813, shp6814, shp6815, shp6816, shp6817, shp6818, shp6819, shp6820, shp6821, shp6822, shp6823, shp6824, shp6825, shp6826, shp6827, shp6828, shp6829, shp6830, shp6831, shp6832, shp6833, shp6834, shp6835, shp6836, shp6837, shp6838, shp6839, shp6840, shp6841, shp6842, shp6843, shp6844, shp6845, shp6846, shp6847, shp6848, shp6849, shp6850, shp6851, shp6852, shp6853, shp6854, shp6855, shp6856, shp6857, shp6858, shp6859, shp6860, shp6861, shp6862, shp6863, shp6864, shp6865, shp6866, shp6867, shp6868, shp6869, shp6870, shp6871, shp6872, shp6873, shp6874, shp6875, shp6876, shp6877, shp6878, shp6879, shp6880, shp6881, shp6882, shp6883, shp6884, shp6885, shp6886, shp6887, shp6888, shp6889, shp6890, shp6891, shp6892, shp6893, shp6894, shp6895, shp6896, shp6897, shp6898, shp6899, shp6900, shp6901, shp6902, shp6903, shp6904, shp6905, shp6906, shp6907, shp6908, shp6909, shp6910, shp6911, shp6912, shp6913, shp6914, shp6915, shp6916, shp6917, shp6918, shp6919, shp6920, shp6921, shp6922, shp6923, shp6924, shp6925, shp6926, shp6927, shp6928, shp6929, shp6930, shp6931, shp6932, shp6933, shp6934, shp6935, shp6936, shp6937, shp6938, shp6939, shp6940, shp6941, shp6942, shp6943, shp6944, shp6945, shp6946, shp6947, shp6948, shp6949, shp6950, shp6951, shp6952, shp6953, shp6954, shp6955, shp6956, shp6957, shp6958, shp6959, shp6960, shp6961, shp6962, shp6963, shp6964, shp6965, shp6966, shp6967, shp6968, shp6969, shp6970, shp6971, shp6972, shp6973, shp6974, shp6975, shp6976, shp6977, shp6978, shp6979, shp6980, shp6981, shp6982, shp6983, shp6984, shp6985, shp6986, shp6987, shp6988, shp6989, shp6990, shp6991, shp6992, shp6993, shp6994, shp6995, shp6996, shp6997, shp6998, shp6999, shp7000, shp7001, shp7002, shp7003, shp7004, shp7005, shp7006, shp7007, shp7008, shp7009, shp7010, shp7011, shp7012, shp7013, shp7014, shp7015, shp7016, shp7017, shp7018, shp7019, shp7020, shp7021, shp7022, shp7023, shp7024, shp7025, shp7026, shp7027, shp7028, shp7029, shp7030, shp7031, shp7032, shp7033, shp7034, shp7035, shp7036, shp7037, shp7038, shp7039, shp7040, shp7041, shp7042, shp7043, shp7044, shp7045, shp7046, shp7047, shp7048, shp7049, shp7050, shp7051, shp7052, shp7053, shp7054, shp7055, shp7056, shp7057, shp7058, shp7059, shp7060, shp7061, shp7062, shp7063, shp7064, shp7065, shp7066, shp7067, shp7068, shp7069, shp7070, shp7071, shp7072, shp7073, shp7074, shp7075, shp7076, shp7077, shp7078, shp7079, shp7080, shp7081, shp7082, shp7083, shp7084, shp7085, shp7086, shp7087, shp7088, shp7089, shp7090, shp7091, shp7092, shp7093, shp7094, shp7095, shp7096, shp7097, shp7098, shp7099, shp7100, shp7101, shp7102, shp7103, shp7104, shp7105, shp7106, shp7107, shp7108, shp7109, shp7110, shp7111, shp7112, shp7113, shp7114, shp7115, shp7116, shp7117, shp7118, shp7119, shp7120, shp7121, shp7122, shp7123, shp7124, shp7125, shp7126, shp7127, shp7128, shp7129, shp7130, shp7131, shp7132, shp7133, shp7134, shp7135, shp7136, shp7137, shp7138, shp7139, shp7140, shp7141, shp7142, shp7143, shp7144, shp7145, shp7146, shp7147, shp7148, shp7149, shp7150, shp7151, shp7152, shp7153, shp7154, shp7155, shp7156, shp7157, shp7158, shp7159, shp7160, shp7161, shp7162, shp7163, shp7164, shp7165, shp7166, shp7167, shp7168, shp7169, shp7170, shp7171, shp7172, shp7173, shp7174, shp7175, shp7176, shp7177, shp7178, shp7179, shp7180, shp7181, shp7182, shp7183, shp7184, shp7185, shp7186, shp7187, shp7188, shp7189, shp7190, shp7191, shp7192, shp7193, shp7194, shp7195, shp7196, shp7197, shp7198, shp7199, shp7200, shp7201, shp7202, shp7203, shp7204, shp7205, shp7206, shp7207, shp7208, shp7209, shp7210, shp7211, shp7212, shp7213, shp7214, shp7215, shp7216, shp7217, shp7218, shp7219, shp7220, shp7221, shp7222, shp7223, shp7224, shp7225, shp7226, shp7227, shp7228, shp7229, shp7230, shp7231, shp7232, shp7233, shp7234, shp7235, shp7236, shp7237, shp7238, shp7239, shp7240, shp7241, shp7242, shp7243, shp7244, shp7245, shp7246, shp7247, shp7248, shp7249, shp7250, shp7251, shp7252, shp7253, shp7254, shp7255, shp7256, shp7257, shp7258, shp7259, shp7260, shp7261, shp7262, shp7263, shp7264, shp7265, shp7266, shp7267, shp7268, shp7269, shp7270, shp7271, shp7272, shp7273, shp7274, shp7275, shp7276, shp7277, shp7278, shp7279, shp7280, shp7281, shp7282, shp7283, shp7284, shp7285, shp7286, shp7287, shp7288, shp7289, shp7290, shp7291, shp7292, shp7293, shp7294, shp7295, shp7296, shp7297, shp7298, shp7299, shp7300, shp7301, shp7302, shp7303, shp7304, shp7305, shp7306, shp7307, shp7308, shp7309, shp7310, shp7311, shp7312, shp7313, shp7314, shp7315, shp7316, shp7317, shp7318, shp7319, shp7320, shp7321, shp7322, shp7323, shp7324, shp7325, shp7326, shp7327, shp7328, shp7329, shp7330, shp7331, shp7332, shp7333, shp7334, shp7335, shp7336, shp7337, shp7338, shp7339, shp7340, shp7341, shp7342, shp7343, shp7344, shp7345, shp7346, shp7347, shp7348, shp7349, shp7350, shp7351, shp7352, shp7353, shp7354, shp7355, shp7356, shp7357, shp7358, shp7359, shp7360, shp7361, shp7362, shp7363, shp7364, shp7365, shp7366, shp7367, shp7368, shp7369, shp7370, shp7371, shp7372, shp7373, shp7374, shp7375, shp7376, shp7377, shp7378, shp7379, shp7380, shp7381, shp7382, shp7383, shp7384, shp7385, shp7386, shp7387, shp7388, shp7389, shp7390, shp7391, shp7392, shp7393, shp7394, shp7395, shp7396, shp7397, shp7398, shp7399, shp7400, shp7401, shp7402, shp7403, shp7404, shp7405, shp7406, shp7407, shp7408, shp7409, shp7410, shp7411, shp7412, shp7413, shp7414, shp7415, shp7416, shp7417, shp7418, shp7419, shp7420, shp7421, shp7422, shp7423, shp7424, shp7425, shp7426, shp7427, shp7428, shp7429, shp7430, shp7431, shp7432, shp7433, shp7434, shp7435, shp7436, shp7437, shp7438, shp7439, shp7440, shp7441, shp7442, shp7443, shp7444, shp7445, shp7446, shp7447, shp7448, shp7449, shp7450, shp7451, shp7452, shp7453, shp7454, shp7455, shp7456, shp7457, shp7458, shp7459, shp7460, shp7461, shp7462, shp7463, shp7464, shp7465, shp7466, shp7467, shp7468, shp7469, shp7470, shp7471, shp7472, shp7473, shp7474, shp7475, shp7476, shp7477, shp7478, shp7479, shp7480, shp7481, shp7482, shp7483, shp7484, shp7485, shp7486, shp7487, shp7488, shp7489, shp7490, shp7491, shp7492, shp7493, shp7494, shp7495, shp7496, shp7497, shp7498, shp7499, shp7500, shp7501, shp7502, shp7503, shp7504, shp7505, shp7506, shp7507, shp7508, shp7509, shp7510, shp7511, shp7512, shp7513, shp7514, shp7515, shp7516, shp7517, shp7518, shp7519, shp7520, shp7521, shp7522, shp7523, shp7524, shp7525, shp7526, shp7527, shp7528, shp7529, shp7530, shp7531, shp7532, shp7533, shp7534, shp7535, shp7536, shp7537, shp7538, shp7539, shp7540, shp7541, shp7542, shp7543, shp7544, shp7545, shp7546, shp7547, shp7548, shp7549, shp7550, shp7551, shp7552, shp7553, shp7554, shp7555, shp7556, shp7557, shp7558, shp7559, shp7560, shp7561, shp7562, shp7563, shp7564, shp7565, shp7566, shp7567, shp7568, shp7569, shp7570, shp7571, shp7572, shp7573, shp7574, shp7575, shp7576, shp7577, shp7578, shp7579, shp7580, shp7581, shp7582, shp7583, shp7584, shp7585, shp7586, shp7587, shp7588, shp7589, shp7590, shp7591, shp7592, shp7593, shp7594, shp7595, shp7596, shp7597, shp7598, shp7599, shp7600, shp7601, shp7602, shp7603, shp7604, shp7605, shp7606, shp7607, shp7608, shp7609, shp7610, shp7611, shp7612, shp7613, shp7614, shp7615, shp7616, shp7617, shp7618, shp7619, shp7620, shp7621, shp7622, shp7623, shp7624, shp7625, shp7626, shp7627, shp7628, shp7629, shp7630, shp7631, shp7632, shp7633, shp7634, shp7635, shp7636, shp7637, shp7638, shp7639, shp7640, shp7641, shp7642, shp7643, shp7644, shp7645, shp7646, shp7647, shp7648, shp7649, shp7650, shp7651, shp7652, shp7653, shp7654, shp7655, shp7656, shp7657, shp7658, shp7659, shp7660, shp7661, shp7662, shp7663, shp7664, shp7665, shp7666, shp7667, shp7668, shp7669, shp7670, shp7671, shp7672, shp7673, shp7674, shp7675, shp7676, shp7677, shp7678, shp7679, shp7680, shp7681, shp7682, shp7683, shp7684, shp7685, shp7686, shp7687, shp7688, shp7689, shp7690, shp7691, shp7692, shp7693, shp7694, shp7695, shp7696, shp7697, shp7698, shp7699, shp7700, shp7701, shp7702, shp7703, shp7704, shp7705, shp7706, shp7707, shp7708, shp7709, shp7710, shp7711, shp7712, shp7713, shp7714, shp7715, shp7716, shp7717, shp7718, shp7719, shp7720, shp7721, shp7722, shp7723, shp7724, shp7725, shp7726, shp7727, shp7728, shp7729, shp7730, shp7731, shp7732, shp7733, shp7734, shp7735, shp7736, shp7737, shp7738, shp7739, shp7740, shp7741, shp7742, shp7743, shp7744, shp7745, shp7746, shp7747, shp7748, shp7749, shp7750, shp7751, shp7752, shp7753, shp7754, shp7755, shp7756, shp7757, shp7758, shp7759, shp7760, shp7761, shp7762, shp7763, shp7764, shp7765, shp7766, shp7767, shp7768, shp7769, shp7770, shp7771, shp7772, shp7773, shp7774, shp7775, shp7776, shp7777, shp7778, shp7779, shp7780, shp7781, shp7782, shp7783, shp7784, shp7785, shp7786, shp7787, shp7788, shp7789, shp7790, shp7791, shp7792, shp7793, shp7794, shp7795, shp7796, shp7797, shp7798, shp7799, shp7800, shp7801, shp7802, shp7803, shp7804, shp7805, shp7806, shp7807, shp7808, shp7809, shp7810, shp7811, shp7812, shp7813, shp7814, shp7815, shp7816, shp7817, shp7818, shp7819, shp7820, shp7821, shp7822, shp7823, shp7824, shp7825, shp7826, shp7827, shp7828, shp7829, shp7830, shp7831, shp7832, shp7833, shp7834, shp7835, shp7836, shp7837, shp7838, shp7839, shp7840, shp7841, shp7842, shp7843, shp7844, shp7845, shp7846, shp7847, shp7848, shp7849, shp7850, shp7851, shp7852, shp7853, shp7854, shp7855, shp7856, shp7857, shp7858, shp7859, shp7860, shp7861, shp7862, shp7863, shp7864, shp7865, shp7866, shp7867, shp7868, shp7869, shp7870, shp7871, shp7872, shp7873, shp7874, shp7875, shp7876, shp7877, shp7878, shp7879, shp7880, shp7881, shp7882, shp7883, shp7884, shp7885, shp7886, shp7887, shp7888, shp7889, shp7890, shp7891, shp7892, shp7893, shp7894, shp7895, shp7896, shp7897, shp7898, shp7899, shp7900, shp7901, shp7902, shp7903, shp7904, shp7905, shp7906, shp7907, shp7908, shp7909, shp7910, shp7911, shp7912, shp7913, shp7914, shp7915, shp7916, shp7917, shp7918, shp7919, shp7920, shp7921, shp7922, shp7923, shp7924, shp7925, shp7926, shp7927, shp7928, shp7929, shp7930, shp7931, shp7932, shp7933, shp7934, shp7935, shp7936, shp7937, shp7938, shp7939, shp7940, shp7941, shp7942, shp7943, shp7944, shp7945, shp7946, shp7947, shp7948, shp7949, shp7950, shp7951, shp7952, shp7953, shp7954, shp7955, shp7956, shp7957, shp7958, shp7959, shp7960, shp7961, shp7962, shp7963, shp7964, shp7965, shp7966, shp7967, shp7968, shp7969, shp7970, shp7971, shp7972, shp7973, shp7974, shp7975, shp7976, shp7977, shp7978, shp7979, shp7980, shp7981, shp7982, shp7983, shp7984, shp7985, shp7986, shp7987, shp7988, shp7989, shp7990, shp7991, shp7992, shp7993, shp7994, shp7995, shp7996, shp7997, shp7998, shp7999, shp8000, shp8001, shp8002, shp8003, shp8004, shp8005, shp8006, shp8007, shp8008, shp8009, shp8010, shp8011, shp8012, shp8013, shp8014, shp8015, shp8016, shp8017, shp8018, shp8019, shp8020, shp8021, shp8022, shp8023, shp8024, shp8025, shp8026, shp8027, shp8028, shp8029, shp8030, shp8031, shp8032, shp8033, shp8034, shp8035, shp8036, shp8037, shp8038, shp8039, shp8040, shp8041, shp8042, shp8043, shp8044, shp8045, shp8046, shp8047, shp8048, shp8049, shp8050, shp8051, shp8052, shp8053, shp8054, shp8055, shp8056, shp8057, shp8058, shp8059, shp8060, shp8061, shp8062, shp8063, shp8064, shp8065, shp8066, shp8067, shp8068, shp8069, shp8070, shp8071, shp8072, shp8073, shp8074, shp8075, shp8076, shp8077, shp8078, shp8079, shp8080, shp8081, shp8082, shp8083, shp8084, shp8085, shp8086, shp8087, shp8088, shp8089, shp8090, shp8091, shp8092, shp8093, shp8094, shp8095, shp8096, shp8097, shp8098, shp8099, shp8100, shp8101, shp8102, shp8103, shp8104, shp8105, shp8106, shp8107, shp8108, shp8109, shp8110, shp8111, shp8112, shp8113, shp8114, shp8115, shp8116, shp8117, shp8118, shp8119, shp8120, shp8121, shp8122, shp8123, shp8124, shp8125, shp8126, shp8127, shp8128, shp8129, shp8130, shp8131, shp8132, shp8133, shp8134, shp8135, shp8136, shp8137, shp8138, shp8139, shp8140, shp8141, shp8142, shp8143, shp8144, shp8145, shp8146, shp8147, shp8148, shp8149, shp8150, shp8151, shp8152, shp8153, shp8154, shp8155, shp8156, shp8157, shp8158, shp8159, shp8160, shp8161, shp8162, shp8163, shp8164, shp8165, shp8166, shp8167, shp8168, shp8169, shp8170, shp8171, shp8172, shp8173, shp8174, shp8175, shp8176, shp8177, shp8178, shp8179, shp8180, shp8181, shp8182, shp8183, shp8184, shp8185, shp8186, shp8187, shp8188, shp8189, shp8190, shp8191, shp8192, shp8193, shp8194, shp8195, shp8196, shp8197, shp8198, shp8199, shp8200, shp8201, shp8202, shp8203, shp8204, shp8205, shp8206, shp8207, shp8208, shp8209, shp8210, shp8211, shp8212, shp8213, shp8214, shp8215, shp8216, shp8217, shp8218, shp8219, shp8220, shp8221, shp8222, shp8223, shp8224, shp8225, shp8226, shp8227, shp8228, shp8229, shp8230, shp8231, shp8232, shp8233, shp8234, shp8235, shp8236, shp8237, shp8238, shp8239, shp8240, shp8241, shp8242, shp8243, shp8244, shp8245, shp8246, shp8247, shp8248, shp8249, shp8250, shp8251, shp8252, shp8253, shp8254, shp8255, shp8256, shp8257, shp8258, shp8259, shp8260, shp8261, shp8262, shp8263, shp8264, shp8265, shp8266, shp8267, shp8268, shp8269, shp8270, shp8271, shp8272, shp8273, shp8274, shp8275, shp8276, shp8277, shp8278, shp8279, shp8280, shp8281, shp8282, shp8283, shp8284, shp8285, shp8286, shp8287, shp8288, shp8289, shp8290, shp8291, shp8292, shp8293, shp8294, shp8295, shp8296, shp8297, shp8298, shp8299, shp8300, shp8301, shp8302, shp8303, shp8304, shp8305, shp8306, shp8307, shp8308, shp8309, shp8310, shp8311, shp8312, shp8313, shp8314, shp8315, shp8316, shp8317, shp8318, shp8319, shp8320, shp8321, shp8322, shp8323, shp8324, shp8325, shp8326, shp8327, shp8328, shp8329, shp8330, shp8331, shp8332, shp8333, shp8334, shp8335, shp8336, shp8337, shp8338, shp8339, shp8340, shp8341, shp8342, shp8343, shp8344, shp8345, shp8346, shp8347, shp8348, shp8349, shp8350, shp8351, shp8352, shp8353, shp8354, shp8355, shp8356, shp8357, shp8358, shp8359, shp8360, shp8361, shp8362, shp8363, shp8364, shp8365, shp8366, shp8367, shp8368, shp8369, shp8370, shp8371, shp8372, shp8373, shp8374, shp8375, shp8376, shp8377, shp8378, shp8379, shp8380, shp8381, shp8382, shp8383, shp8384, shp8385, shp8386, shp8387, shp8388, shp8389, shp8390, shp8391, shp8392, shp8393, shp8394, shp8395, shp8396, shp8397, shp8398, shp8399, shp8400, shp8401, shp8402, shp8403, shp8404, shp8405, shp8406, shp8407, shp8408, shp8409, shp8410, shp8411, shp8412, shp8413, shp8414, shp8415, shp8416, shp8417, shp8418, shp8419, shp8420, shp8421, shp8422, shp8423, shp8424, shp8425, shp8426, shp8427, shp8428, shp8429, shp8430, shp8431, shp8432, shp8433, shp8434, shp8435, shp8436, shp8437, shp8438, shp8439, shp8440, shp8441, shp8442, shp8443, shp8444, shp8445, shp8446, shp8447, shp8448, shp8449, shp8450, shp8451, shp8452, shp8453, shp8454, shp8455, shp8456, shp8457, shp8458, shp8459, shp8460, shp8461, shp8462, shp8463, shp8464, shp8465, shp8466, shp8467, shp8468, shp8469, shp8470, shp8471, shp8472, shp8473, shp8474, shp8475, shp8476, shp8477, shp8478, shp8479, shp8480, shp8481, shp8482, shp8483, shp8484, shp8485, shp8486, shp8487, shp8488, shp8489, shp8490, shp8491, shp8492, shp8493, shp8494, shp8495, shp8496, shp8497, shp8498, shp8499, shp8500, shp8501, shp8502, shp8503, shp8504, shp8505, shp8506, shp8507, shp8508, shp8509, shp8510, shp8511, shp8512, shp8513, shp8514, shp8515, shp8516, shp8517, shp8518, shp8519, shp8520, shp8521, shp8522, shp8523, shp8524, shp8525, shp8526, shp8527, shp8528, shp8529, shp8530, shp8531, shp8532, shp8533, shp8534, shp8535, shp8536, shp8537, shp8538, shp8539, shp8540, shp8541, shp8542, shp8543, shp8544, shp8545, shp8546, shp8547, shp8548, shp8549, shp8550, shp8551, shp8552, shp8553, shp8554, shp8555, shp8556, shp8557, shp8558, shp8559, shp8560, shp8561, shp8562, shp8563, shp8564, shp8565, shp8566, shp8567, shp8568, shp8569, shp8570, shp8571, shp8572, shp8573, shp8574, shp8575, shp8576, shp8577, shp8578, shp8579, shp8580, shp8581, shp8582, shp8583, shp8584, shp8585, shp8586, shp8587, shp8588, shp8589, shp8590, shp8591, shp8592, shp8593, shp8594, shp8595, shp8596, shp8597, shp8598, shp8599, shp8600, shp8601, shp8602, shp8603, shp8604, shp8605, shp8606, shp8607, shp8608, shp8609, shp8610, shp8611, shp8612, shp8613, shp8614, shp8615, shp8616, shp8617, shp8618, shp8619, shp8620, shp8621, shp8622, shp8623, shp8624, shp8625, shp8626, shp8627, shp8628, shp8629, shp8630, shp8631, shp8632, shp8633, shp8634, shp8635, shp8636, shp8637, shp8638, shp8639, shp8640, shp8641, shp8642, shp8643, shp8644, shp8645, shp8646, shp8647, shp8648, shp8649, shp8650, shp8651, shp8652, shp8653, shp8654, shp8655, shp8656, shp8657, shp8658, shp8659, shp8660, shp8661, shp8662, shp8663, shp8664, shp8665, shp8666, shp8667, shp8668, shp8669, shp8670, shp8671, shp8672, shp8673, shp8674, shp8675, shp8676, shp8677, shp8678, shp8679, shp8680, shp8681, shp8682, shp8683, shp8684, shp8685, shp8686, shp8687, shp8688, shp8689, shp8690, shp8691, shp8692, shp8693, shp8694, shp8695, shp8696, shp8697, shp8698, shp8699, shp8700, shp8701, shp8702, shp8703, shp8704, shp8705, shp8706, shp8707, shp8708, shp8709, shp8710, shp8711, shp8712, shp8713, shp8714, shp8715, shp8716, shp8717, shp8718, shp8719, shp8720, shp8721, shp8722, shp8723, shp8724, shp8725, shp8726, shp8727, shp8728, shp8729, shp8730, shp8731, shp8732, shp8733, shp8734, shp8735, shp8736, shp8737, shp8738, shp8739, shp8740, shp8741, shp8742, shp8743, shp8744, shp8745, shp8746, shp8747, shp8748, shp8749, shp8750, shp8751, shp8752, shp8753, shp8754, shp8755, shp8756, shp8757, shp8758, shp8759, shp8760, shp8761, shp8762, shp8763, shp8764, shp8765, shp8766, shp8767, shp8768, shp8769, shp8770, shp8771, shp8772, shp8773, shp8774, shp8775, shp8776, shp8777, shp8778, shp8779, shp8780, shp8781, shp8782, shp8783, shp8784, shp8785, shp8786, shp8787, shp8788, shp8789, shp8790, shp8791, shp8792, shp8793, shp8794, shp8795, shp8796, shp8797, shp8798, shp8799, shp8800, shp8801, shp8802, shp8803, shp8804, shp8805, shp8806, shp8807, shp8808, shp8809, shp8810, shp8811, shp8812, shp8813, shp8814, shp8815, shp8816, shp8817, shp8818, shp8819, shp8820, shp8821, shp8822, shp8823, shp8824, shp8825, shp8826, shp8827, shp8828, shp8829, shp8830, shp8831, shp8832, shp8833, shp8834, shp8835, shp8836, shp8837, shp8838, shp8839, shp8840, shp8841, shp8842, shp8843, shp8844, shp8845, shp8846, shp8847, shp8848, shp8849, shp8850, shp8851, shp8852, shp8853, shp8854, shp8855, shp8856, shp8857, shp8858, shp8859, shp8860, shp8861, shp8862, shp8863, shp8864, shp8865, shp8866, shp8867, shp8868, shp8869, shp8870, shp8871, shp8872, shp8873, shp8874, shp8875, shp8876, shp8877, shp8878, shp8879, shp8880, shp8881, shp8882, shp8883, shp8884, shp8885, shp8886, shp8887, shp8888, shp8889, shp8890, shp8891, shp8892, shp8893, shp8894, shp8895, shp8896, shp8897, shp8898, shp8899, shp8900, shp8901, shp8902, shp8903, shp8904, shp8905, shp8906, shp8907, shp8908, shp8909, shp8910, shp8911, shp8912, shp8913, shp8914, shp8915, shp8916, shp8917, shp8918, shp8919, shp8920, shp8921, shp8922, shp8923, shp8924, shp8925, shp8926, shp8927, shp8928, shp8929, shp8930, shp8931, shp8932, shp8933, shp8934, shp8935, shp8936, shp8937, shp8938, shp8939, shp8940, shp8941, shp8942, shp8943, shp8944, shp8945, shp8946, shp8947, shp8948, shp8949, shp8950, shp8951, shp8952, shp8953, shp8954, shp8955, shp8956, shp8957, shp8958, shp8959, shp8960, shp8961, shp8962, shp8963, shp8964, shp8965, shp8966, shp8967, shp8968, shp8969, shp8970, shp8971, shp8972, shp8973, shp8974, shp8975, shp8976, shp8977, shp8978, shp8979, shp8980, shp8981, shp8982, shp8983, shp8984, shp8985, shp8986, shp8987, shp8988, shp8989, shp8990, shp8991, shp8992, shp8993, shp8994, shp8995, shp8996, shp8997, shp8998, shp8999, shp9000, shp9001, shp9002, shp9003, shp9004, shp9005, shp9006, shp9007, shp9008, shp9009, shp9010, shp9011, shp9012, shp9013, shp9014, shp9015, shp9016, shp9017, shp9018, shp9019, shp9020, shp9021, shp9022, shp9023, shp9024, shp9025, shp9026, shp9027, shp9028, shp9029, shp9030, shp9031, shp9032, shp9033, shp9034, shp9035, shp9036, shp9037, shp9038, shp9039, shp9040, shp9041, shp9042, shp9043, shp9044, shp9045, shp9046, shp9047, shp9048, shp9049, shp9050, shp9051, shp9052, shp9053, shp9054, shp9055, shp9056, shp9057, shp9058, shp9059, shp9060, shp9061, shp9062, shp9063, shp9064, shp9065, shp9066, shp9067, shp9068, shp9069, shp9070, shp9071, shp9072, shp9073, shp9074, shp9075, shp9076, shp9077, shp9078, shp9079, shp9080, shp9081, shp9082, shp9083, shp9084, shp9085, shp9086, shp9087, shp9088, shp9089, shp9090, shp9091, shp9092, shp9093, shp9094, shp9095, shp9096, shp9097, shp9098, shp9099, shp9100, shp9101, shp9102, shp9103, shp9104, shp9105, shp9106, shp9107, shp9108, shp9109, shp9110, shp9111, shp9112, shp9113, shp9114, shp9115, shp9116, shp9117, shp9118, shp9119, shp9120, shp9121, shp9122, shp9123, shp9124, shp9125, shp9126, shp9127, shp9128, shp9129, shp9130, shp9131, shp9132, shp9133, shp9134, shp9135, shp9136, shp9137, shp9138, shp9139, shp9140, shp9141, shp9142, shp9143, shp9144, shp9145, shp9146, shp9147, shp9148, shp9149, shp9150, shp9151, shp9152, shp9153, shp9154, shp9155, shp9156, shp9157, shp9158, shp9159, shp9160, shp9161, shp9162, shp9163, shp9164, shp9165, shp9166, shp9167, shp9168, shp9169, shp9170, shp9171, shp9172, shp9173, shp9174, shp9175, shp9176, shp9177, shp9178, shp9179, shp9180, shp9181, shp9182, shp9183, shp9184, shp9185, shp9186, shp9187, shp9188, shp9189, shp9190, shp9191, shp9192, shp9193, shp9194, shp9195, shp9196, shp9197, shp9198, shp9199, shp9200, shp9201, shp9202, shp9203, shp9204, shp9205, shp9206, shp9207, shp9208, shp9209, shp9210, shp9211, shp9212, shp9213, shp9214, shp9215, shp9216, shp9217, shp9218, shp9219, shp9220, shp9221, shp9222, shp9223, shp9224, shp9225, shp9226, shp9227, shp9228, shp9229, shp9230, shp9231, shp9232, shp9233, shp9234, shp9235, shp9236, shp9237, shp9238, shp9239, shp9240, shp9241, shp9242, shp9243, shp9244, shp9245, shp9246, shp9247, shp9248, shp9249, shp9250, shp9251, shp9252, shp9253, shp9254, shp9255, shp9256, shp9257, shp9258, shp9259, shp9260, shp9261, shp9262, shp9263, shp9264, shp9265, shp9266, shp9267, shp9268, shp9269, shp9270, shp9271, shp9272, shp9273, shp9274, shp9275, shp9276, shp9277, shp9278, shp9279, shp9280, shp9281, shp9282, shp9283, shp9284, shp9285, shp9286, shp9287, shp9288, shp9289, shp9290, shp9291, shp9292, shp9293, shp9294, shp9295, shp9296, shp9297, shp9298, shp9299, shp9300, shp9301, shp9302, shp9303, shp9304, shp9305, shp9306, shp9307, shp9308, shp9309, shp9310, shp9311, shp9312, shp9313, shp9314, shp9315, shp9316, shp9317, shp9318, shp9319, shp9320, shp9321, shp9322, shp9323, shp9324, shp9325, shp9326, shp9327, shp9328, shp9329, shp9330, shp9331, shp9332, shp9333, shp9334, shp9335, shp9336, shp9337, shp9338, shp9339, shp9340, shp9341, shp9342, shp9343, shp9344, shp9345, shp9346, shp9347, shp9348, shp9349, shp9350, shp9351, shp9352, shp9353, shp9354, shp9355, shp9356, shp9357, shp9358, shp9359, shp9360, shp9361, shp9362, shp9363, shp9364, shp9365, shp9366, shp9367, shp9368, shp9369, shp9370, shp9371, shp9372, shp9373, shp9374, shp9375, shp9376, shp9377, shp9378, shp9379, shp9380, shp9381, shp9382, shp9383, shp9384, shp9385, shp9386, shp9387, shp9388, shp9389, shp9390, shp9391, shp9392, shp9393, shp9394, shp9395, shp9396, shp9397, shp9398, shp9399, shp9400, shp9401, shp9402, shp9403, shp9404, shp9405, shp9406, shp9407, shp9408, shp9409, shp9410, shp9411, shp9412, shp9413, shp9414, shp9415, shp9416, shp9417, shp9418, shp9419, shp9420, shp9421, shp9422, shp9423, shp9424, shp9425, shp9426, shp9427, shp9428, shp9429, shp9430, shp9431, shp9432, shp9433, shp9434, shp9435, shp9436, shp9437, shp9438, shp9439, shp9440, shp9441, shp9442, shp9443, shp9444, shp9445, shp9446, shp9447, shp9448, shp9449, shp9450, shp9451, shp9452, shp9453, shp9454, shp9455, shp9456, shp9457, shp9458, shp9459, shp9460, shp9461, shp9462, shp9463, shp9464, shp9465, shp9466, shp9467, shp9468, shp9469, shp9470, shp9471, shp9472, shp9473, shp9474, shp9475, shp9476, shp9477, shp9478, shp9479, shp9480, shp9481, shp9482, shp9483, shp9484, shp9485, shp9486, shp9487, shp9488, shp9489, shp9490, shp9491, shp9492, shp9493, shp9494, shp9495, shp9496, shp9497, shp9498, shp9499, shp9500, shp9501, shp9502, shp9503, shp9504, shp9505, shp9506, shp9507, shp9508, shp9509, shp9510, shp9511, shp9512, shp9513, shp9514, shp9515, shp9516, shp9517, shp9518, shp9519, shp9520, shp9521, shp9522, shp9523, shp9524, shp9525, shp9526, shp9527, shp9528, shp9529, shp9530, shp9531, shp9532, shp9533, shp9534, shp9535, shp9536, shp9537, shp9538, shp9539, shp9540, shp9541, shp9542, shp9543, shp9544, shp9545, shp9546, shp9547, shp9548, shp9549, shp9550, shp9551, shp9552, shp9553, shp9554, shp9555, shp9556, shp9557, shp9558, shp9559, shp9560, shp9561, shp9562, shp9563, shp9564, shp9565, shp9566, shp9567, shp9568, shp9569, shp9570, shp9571, shp9572, shp9573, shp9574, shp9575, shp9576, shp9577, shp9578, shp9579, shp9580, shp9581, shp9582, shp9583, shp9584, shp9585, shp9586, shp9587, shp9588, shp9589, shp9590, shp9591, shp9592, shp9593, shp9594, shp9595, shp9596, shp9597, shp9598, shp9599, shp9600, shp9601, shp9602, shp9603, shp9604, shp9605, shp9606, shp9607, shp9608, shp9609, shp9610, shp9611, shp9612, shp9613, shp9614, shp9615, shp9616, shp9617, shp9618, shp9619, shp9620, shp9621, shp9622, shp9623, shp9624, shp9625, shp9626, shp9627, shp9628, shp9629, shp9630, shp9631, shp9632, shp9633, shp9634, shp9635, shp9636, shp9637, shp9638, shp9639, shp9640, shp9641, shp9642, shp9643, shp9644, shp9645, shp9646, shp9647, shp9648, shp9649, shp9650, shp9651, shp9652, shp9653, shp9654, shp9655, shp9656, shp9657, shp9658, shp9659, shp9660, shp9661, shp9662, shp9663, shp9664, shp9665, shp9666, shp9667, shp9668, shp9669, shp9670, shp9671, shp9672, shp9673, shp9674, shp9675, shp9676, shp9677, shp9678, shp9679, shp9680, shp9681, shp9682, shp9683, shp9684, shp9685, shp9686, shp9687, shp9688, shp9689, shp9690, shp9691, shp9692, shp9693, shp9694, shp9695, shp9696, shp9697, shp9698, shp9699, shp9700, shp9701, shp9702, shp9703, shp9704, shp9705, shp9706, shp9707, shp9708, shp9709, shp9710, shp9711, shp9712, shp9713, shp9714, shp9715, shp9716, shp9717, shp9718, shp9719, shp9720, shp9721, shp9722, shp9723, shp9724, shp9725, shp9726, shp9727, shp9728, shp9729, shp9730, shp9731, shp9732, shp9733, shp9734, shp9735, shp9736, shp9737, shp9738, shp9739, shp9740, shp9741, shp9742, shp9743, shp9744, shp9745, shp9746, shp9747, shp9748, shp9749, shp9750, shp9751, shp9752, shp9753, shp9754, shp9755, shp9756, shp9757, shp9758, shp9759, shp9760, shp9761, shp9762, shp9763, shp9764, shp9765, shp9766, shp9767, shp9768, shp9769, shp9770, shp9771, shp9772, shp9773, shp9774, shp9775, shp9776, shp9777, shp9778, shp9779, shp9780, shp9781, shp9782, shp9783, shp9784, shp9785, shp9786, shp9787, shp9788, shp9789, shp9790, shp9791, shp9792, shp9793, shp9794, shp9795, shp9796, shp9797, shp9798, shp9799, shp9800, shp9801, shp9802, shp9803, shp9804, shp9805, shp9806, shp9807, shp9808, shp9809, shp9810, shp9811, shp9812, shp9813, shp9814, shp9815, shp9816, shp9817, shp9818, shp9819, shp9820, shp9821, shp9822, shp9823, shp9824, shp9825, shp9826, shp9827, shp9828, shp9829, shp9830, shp9831, shp9832, shp9833, shp9834, shp9835, shp9836, shp9837, shp9838, shp9839, shp9840, shp9841, shp9842, shp9843, shp9844, shp9845, shp9846, shp9847, shp9848, shp9849, shp9850, shp9851, shp9852, shp9853, shp9854, shp9855, shp9856, shp9857, shp9858, shp9859, shp9860, shp9861, shp9862, shp9863, shp9864, shp9865, shp9866, shp9867, shp9868, shp9869, shp9870, shp9871, shp9872, shp9873, shp9874, shp9875, shp9876, shp9877, shp9878, shp9879, shp9880, shp9881, shp9882, shp9883, shp9884, shp9885, shp9886, shp9887, shp9888, shp9889, shp9890, shp9891, shp9892, shp9893, shp9894, shp9895, shp9896, shp9897, shp9898, shp9899, shp9900, shp9901, shp9902, shp9903, shp9904, shp9905, shp9906, shp9907, shp9908, shp9909, shp9910, shp9911, shp9912, shp9913, shp9914, shp9915, shp9916, shp9917, shp9918, shp9919, shp9920, shp9921, shp9922, shp9923, shp9924, shp9925, shp9926, shp9927, shp9928, shp9929, shp9930, shp9931, shp9932, shp9933, shp9934, shp9935, shp9936, shp9937, shp9938, shp9939, shp9940, shp9941, shp9942, shp9943, shp9944, shp9945, shp9946, shp9947, shp9948, shp9949, shp9950, shp9951, shp9952, shp9953, shp9954, shp9955, shp9956, shp9957, shp9958, shp9959, shp9960, shp9961, shp9962, shp9963, shp9964, shp9965, shp9966, shp9967, shp9968, shp9969, shp9970, shp9971, shp9972, shp9973, shp9974, shp9975, shp9976, shp9977, shp9978, shp9979, shp9980, shp9981, shp9982, shp9983, shp9984, shp9985, shp9986, shp9987, shp9988, shp9989, shp9990, shp9991, shp9992, shp9993, shp9994, shp9995, shp9996, shp9997, shp9998, shp9999: TShape;
   frmSmlInvoker: TTimer;

    procedure FormClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Show;
    procedure RenderShapes;
    procedure ResetShapes;
    procedure RestoreNodes;
    function InfectRandom: Integer;
    procedure InfectNode(NodeToBeInfected: TNode; InfectorNodeId: Word);
    procedure InfectNeighbors(Sender: TObject);
    procedure InfectNeighborsSIR(Sender: TObject);
    function GetNodeById(AId: Word): TNode;
  private

  public
    TShapePtrArray: TShapePointerList;
    appender: TAppenderType;
    appenderTAppenderArrayOfWordType: TAppenderArrayOfWordType;

  end;

const
  InfectionProbability = 20;

var
  frmSimulation: TfrmSimulation;

implementation

{$R *.lfm}

uses
  { Forms }
  frmMain_u;

{ TfrmSimulation }

procedure TfrmSimulation.FormCreate(Sender: TObject);
{ During the initial simulation, gather all pointers of the TShape objects
  to the relative list that will hold those pointers during each simulation. }

var
  i: Integer;

begin
  if not Assigned(TShapePtrArray[0]) then begin
    for i := 0 to self.ComponentCount - 1 do begin
        TShapePtrArray[i] := self.FieldAddress('shp' + IntToStr(i));
    end;
  end;
end;

procedure TfrmSimulation.FormClose(Sender: TObject);
begin
  { Make sure all Nodes and their Shapes are restored to their original state. }
  self.RestoreNodes;
end;

procedure TfrmSimulation.Show;
begin
  inherited;

  //frmSimulation.frmSmlInvoker.OnTimer := @self.InfectNeighbors;
  frmSimulation.frmSmlInvoker.OnTimer := @self.InfectNeighborsSIR;
  frmSimulation.frmSmlInvoker.Enabled := True;
end;

procedure TfrmSimulation.RenderShapes;
var
  i: Integer;
  ShapeWidth: Integer;
  ShapeHeight: Integer;
  ShapeTopPossition: Integer = 0;
  ShapeLeftPossition: Integer = 0;
  HorizontalObjectCount: Integer;
  VerticalObjectCount: Integer;
begin
  { Define the width and height of each TShape object given the 2d dimensions of
    the simulation window. }

  { ************************************************************************** }
  ShapeWidth := Floor(Sqrt(self.Width * self.Height / frmMain.Nodes.Count));
  HorizontalObjectCount := Floor(self.Width / ShapeWidth);
  VerticalObjectCount := Floor(self.Height / ShapeWidth);

  while HorizontalObjectCount * VerticalObjectCount < frmMain.Nodes.Count do
  begin
      Dec(ShapeWidth);
      HorizontalObjectCount := Floor(self.Width / ShapeWidth);
      VerticalObjectCount := Floor(self.Height / ShapeWidth);
  end;

  ShapeHeight := ShapeWidth;
  { ************************************************************************** }

  { Render all the TShape objects needed for the simulation, using the
    dimensions that were calculated above. A small padding is used to the right
    of the simulation window in order to ensure that all TShape objects will
    gracefully appear inside the simulation window. }

  if Assigned(frmMain.Nodes) and (frmMain.Nodes.Count > 0) then begin

    for i := 0 to frmMain.Nodes.Count - 1 do begin

        if ShapeLeftPossition >= (self.Width - ShapeWidth + 1) then
        begin
          ShapeTopPossition := ShapeTopPossition + ShapeHeight;
          ShapeLeftPossition := 0;
        end;

        self.TShapePtrArray[i]^.Height := ShapeHeight;
        self.TShapePtrArray[i]^.Width := ShapeWidth;
        self.TShapePtrArray[i]^.Left := ShapeLeftPossition;
        self.TShapePtrArray[i]^.Top := ShapeTopPossition;
        self.TShapePtrArray[i]^.Visible := true;

        frmMain.Nodes[i].PtrShape := self.TShapePtrArray[i];

        ShapeLeftPossition := ShapeLeftPossition + ShapeWidth;
    end;

  end;

end;

procedure TfrmSimulation.ResetShapes;
{ Make sure that every TShape object that became visible during the simulation
  is now again not visible. }

var
  i: Integer;

begin
  for i := 0 to frmMain.Nodes.Count - 1 do begin
    self.TShapePtrArray[i]^.Visible := false;
    self.TShapePtrArray[i]^.Brush.Color := clMedGray;
  end;
  frmMain.Nodes.Clear;
end;

function TfrmSimulation.InfectRandom: Integer;
var
  NodeToBeInfected: Word;

begin
  NodeToBeInfected := Random(frmMain.Nodes.Count);
  frmMain.Nodes[NodeToBeInfected].Infect(NodeToBeInfected);
  result := NodeToBeInfected;
end;

procedure TfrmSimulation.InfectNode(NodeToBeInfected: TNode; InfectorNodeId: Word);
begin
  NodeToBeInfected.Infect(InfectorNodeId);
end;

function TfrmSimulation.GetNodeById(AId: Word): TNode;
var
  i: Integer;
begin
  for i := 0 to frmMain.Nodes.Count - 1 do
  begin
    if frmMain.Nodes[i].Id = AId then Result := frmMain.Nodes[i];
  end;
end;

procedure TfrmSimulation.InfectNeighbors(Sender: TObject);
var
  i, j: Word;
  pos: Integer;
  Neighbors: TWordList;
  temp: TNode;
  firstInfected: Word;
  numberOfInfected: Word;
  exitedWhileSimulating: Boolean;

begin
  frmSimulation.frmSmlInvoker.Enabled := False;
  exitedWhileSimulating := False;

  firstInfected := self.InfectRandom;
  temp := frmMain.Nodes[0];
  frmMain.Nodes[0] := frmMain.Nodes[firstInfected];
  frmMain.Nodes[firstInfected] := temp;
  numberOfInfected := 1;

  for i := 0 to frmMain.Nodes.Count - 1 do begin

    if frmMain.Nodes[i].IsInfected then begin

      Neighbors := frmMain.Nodes[i].Neighbors;
      for j := 0 to Neighbors.Count - 1 do begin
          pos := Random(100);
          if (pos <= InfectionProbability) and
            (not (frmMain.Nodes[j].IsInfected)) then
          begin
            //self.InfectNode(j, i);
            Inc(numberOfInfected);
          end;

          if j mod (frmMain.Nodes.Count div 5) = 0 then begin
            frmMain.RefreshGUI;
            Application.Processmessages;
          end;
      end;
    end;

    { In case the simulation was forced closed before finishing set the
      exitedWhileSimulating flag to true. }
    if not frmSimulation.Showing then begin
      exitedWhileSimulating := True;
      break;
    end;

    { If all nodes are infected stop the simulation. }
    if numberOfInfected = frmMain.Nodes.Count then break;
  end;

  { If the exitedWhileSimulating is set to true invoke the FormClose action. }
  if exitedWhileSimulating then self.FormClose(self);

  { Enable the file close functionality }
  frmMain.mnuFileClose.Enabled := True;
end;

procedure TfrmSimulation.InfectNeighborsSIR(Sender: TObject);
var
  i, j, k, day, days, TestingNode, NodeToBeRecovered: Word;
  pos: Integer;
  Neighbors: TWordList;
  firstInfected: Word;
  numberOfInfected: Word;
  exitedWhileSimulating: Boolean;

  ProbabilityOfInfection: Byte;
  Susceptible: TWordList;
  Infected: TWordList;
  Recovered: TWordList;
  SamplingResult: TArrayOfArrayOfWord;

  beta, gamma: Double;
  NodesInfectedByNodePerDay, NumberOfNodesInfectedPerDay, NumOfMaxNeighborsToTest, NumOfMaxNodesPerDay: Word;

  NodesToBeRecovered: TWordList;

begin
  {
            <>======================================================<>
            ||                                                      ||
            ||   Simulation algorithm for the SIR epidemic model.   ||
            ||                                                      ||
            <>======================================================<>

    [ Algorithm ]
    [**************************************************************************]
      The algorithm is constructed with the following steps:
      1) (Pseudo) Randomize the system.

      2) Initialize the Susceptible, Infected, Recovered and Sampling lists.

      3) Add all nodes to the Susceptible list.

      4) Infect an initial random node.

      5) For each day of the simulation.

      6) For each node pick a random number of neighbors and infect them with
         probability pos. If the maximum number of nodes that can be infected
         in one day is reached, go to the next day.

      7) At the end of each day make sure that γ*I nodes recover from the
         decease.

    [**************************************************************************]

    [ Variables ]
    [**************************************************************************]
        i, j, k, day: Counters.

        days: Number of days that the simulation lasts.
        firstInfected: Index of the first infected node.
        TestingNode: Index of node to be tested.
        NodeToBeRecovered: Index of node to be recovered.

        ProbabilityOfInfection: The probability of infection specified
                                by the user.
        pos: Probability of Infection.

        Neighbors: List with the contact indexes of each node.
        Susceptible: List that holds the indexes of the susceptible nodes.
        Infected: List that holds the indexes of the infected nodes.
        Recovered: List that holds the indexes of the recovered nodes.

        SamplingResult: List that holds the samplings taken from the Susceptible,
                        Infected, Recovered lists, at the end of each day.

        beta: The average number of contacts per person per time.
              (Infection rate)
        gamma: The recovery rate.

        NodesInfectedByNodePerDay: Number of nodes that were infected by a node
                                   in one day.
        NumberOfNodesInfectedPerDay: Number of nodes that were infected
                                     in one day.

        NumOfMaxNeighborsToTest: Number of maximum neighbors to be tested
                                 for each node.
        NumOfMaxNodesPerDay: Number of maximum nodes that is allowed to
                             be infected per day.

    [**************************************************************************]

    [ Notes ]
    [**************************************************************************]
      .
      ..
      ...
    [**************************************************************************]
  }

  frmSimulation.frmSmlInvoker.Enabled := False;
  exitedWhileSimulating := False;

  { Randomize System }
  if frmMain.ckbUseSystemSeed.Checked then begin
    Randomize;
    frmMain.edtSeed.Text := IntToStr(RandSeed);
  end
  else begin
    if frmMain.edtSeed.Text <> '' then begin
      RandSeed := StrToInt(frmMain.edtSeed.Text);
    end
    else
      RandSeed := 0;
      frmMain.edtSeed.Text := IntToStr(RandSeed);
  end;

  { Initialize Variable Lists }
  Susceptible := TWordList.Create;
  Infected := TWordList.Create;
  Recovered := TWordList.Create;
  SamplingResult := TArrayOfArrayOfWord.Create;

  beta := StrToFloat(frmMain.edtBeta.Text);
  gamma := StrToFloat(frmMain.edtGamma.Text);
  ProbabilityOfInfection := StrToInt(frmMain.edtProbabilityOfInfection.Text);

  { Append all nodes to initial Susceptible state }
  for i := 0 to frmMain.Nodes.Count - 1 do begin
    Susceptible.Add(i);
  end;

  { Infect the first node/s }
  firstInfected := self.InfectRandom;
  //writeln('First Infected: ' + IntToStr(firstInfected));
  Susceptible.Remove(firstInfected);
  Infected.Add(firstInfected);
  numberOfInfected := 1;

  Days := StrToInt(frmMain.edtDays.Text);

  { Take an initial sampling }
  SamplingResult.Add(ArrayOfWord.Create(Susceptible.Count, Infected.Count, Recovered.Count));

  for Day := 0 to Days do begin

    if not (Susceptible.Count = 0) and not (Infected.Count = 0) then begin
      NumberOfNodesInfectedPerDay := 0;

      //writeln('Day: ' + IntToStr(Day));

      for i := 0 to frmMain.Nodes.Count - 1 do begin
        //writeln('Node: ' + IntToStr(i));

        NodesInfectedByNodePerDay := 0;

        Neighbors := frmMain.Nodes[i].Neighbors;

        { Print the Neighbors }
        //for k := 0 to Neighbors.Count - 1 do write(IntToStr(Neighbors[k]) + ' ,');
        //writeln();

        //NumOfMaxNodesPerDay := Random(Round(frmMain.AvgNumberOfNeighbors * beta));
        //NumOfMaxNeighborsToTest := NumOfMaxNodesPerDay div 2 div 2 div 2 div 2;

        NumOfMaxNodesPerDay := Random(Round(Neighbors.Count * beta));
        NumOfMaxNeighborsToTest := NumOfMaxNodesPerDay div 2 div 2 div 2 div 2;
        if NumOfMaxNeighborsToTest = 0 then NumOfMaxNeighborsToTest := 1;

        //writeln('Number of neighbors to be tested by node ' + IntToStr(i) + ' at day ' + IntToStr(day) + ' are ' + IntToStr(zz));

        for j := 0 to NumOfMaxNeighborsToTest do begin
            if j <= Neighbors.Count - 1 then begin
              pos := Random(100);
              if pos <= ProbabilityOfInfection then
              begin

                { Pick a random Neighbor }
                TestingNode := Neighbors[Random(Neighbors.Count)];

                if not frmMain.Nodes[TestingNode].IsInfected and
                   not frmMain.Nodes[TestingNode].IsRecovered and
                   frmMain.Nodes[i].IsInfected then begin

                  self.InfectNode(frmMain.Nodes[TestingNode], frmMain.Nodes[i].Id);

                  Susceptible.Remove(TestingNode);
                  Infected.Add(TestingNode);

                  Inc(NodesInfectedByNodePerDay);
                  //writeln('Node ' + IntToStr(frmMain.Nodes[TestingNode].Id) + ' has been infected by node ' + IntToStr(frmMain.Nodes[i].Id));

                  //Inc(numberOfInfected);

                end;

              end;

            end
            else break;

        end; { End j }

        //{ In case the simulation was forced closed before finishing set the
        //  exitedWhileSimulating flag to true. }
        //if not frmSimulation.Showing then begin
        //  exitedWhileSimulating := True;
        //  break;
        //end;

        //{ If all nodes are infected stop the simulation. }
        //if numberOfInfected = frmMain.Nodes.Count then break;

        { If all nodes are recovered stop the simulation. }
        if Infected.Count = 0 then break;

        //{ If the sampling is satisfied stop the simulation. }
        //if SamplingResult.Count = 160 then break;

        NumberOfNodesInfectedPerDay += NodesInfectedByNodePerDay;
        //writeln('Node: ' + IntToStr(i) + ' infected: ' + IntToStr(NodesInfectedByNodePerDay) + ' nodes, at day: ' + IntToStr(day));

        if NumberOfNodesInfectedPerDay >= NumOfMaxNodesPerDay then break;

        end; { End i }

      end;

    //writeln('At Day: ' + IntToStr(day) + ', { ' + IntToStr(NumberOfNodesInfectedPerDay) + ' } where infected.');

    //{ Recover FIFO (First In First Out) Style }
    //for k := 0 to Round(Infected.Count * gamma) do begin
    //  try
    //     NodeToBeRecovered := Infected[0];
    //     frmMain.Nodes[NodeToBeRecovered].Recover;
    //
    //     Infected.Remove(NodeToBeRecovered);
    //     Recovered.Add(NodeToBeRecovered);
    //  except
    //    on e: EListError do begin end;
    //  end;
    //end;

    { Recover FIFO (First In First Out) Style }
    NodesToBeRecovered := TWordList.Create;
    for k := 0 to Round(Infected.Count * gamma * 75 / 100) do begin
      try
         NodeToBeRecovered := Infected[k];

         if Random(100) <= 75 then begin
           NodesToBeRecovered.Add(NodeToBeRecovered);
         end;
      except
        on e: EListError do begin end;
      end;
    end;

    for k := 0 to NodesToBeRecovered.Count do begin
      try
        frmMain.Nodes[NodesToBeRecovered[k]].Recover;

        Infected.Remove(NodesToBeRecovered[k]);
        Recovered.Add(NodesToBeRecovered[k]);
      except
        on e: EListError do begin end;
      end;
    end;

    SamplingResult.Add(ArrayOfWord.Create(Susceptible.Count, Infected.Count, Recovered.Count));

  end; { End Day }

  { Repeat the simulation if needed }
  if (Recovered.Count = 1) and frmMain.ckbUseSystemSeed.Checked then begin
    self.RestoreNodes; // Restore the Nodes
    self.InfectNeighborsSIR(self);
  end
  else begin

    { Take missing samplings }
    for i := 0 to days - SamplingResult.Count do
      SamplingResult.Add(ArrayOfWord.Create(Susceptible.Count, Infected.Count, Recovered.Count));

    { Take a final sampling }
    SamplingResult.Add(ArrayOfWord.Create(Susceptible.Count, Infected.Count, Recovered.Count));

    //{ If the exitedWhileSimulating is set to true invoke the FormClose action. }
    //if exitedWhileSimulating then self.FormClose(self);

    { Enable the file close functionality }
    frmMain.mnuFileClose.Enabled := True;

    { Print the calculated differential equations }
    for i:=0 to SamplingResult.Count - 1 do begin
      write(IntToStr(i) + ': ');
      for j := 0 to 3 - 1 do begin
        write(SamplingResult[i][j]:2);
        write(', ');
      end;
      writeln();
    end;

    self.RestoreNodes; // Restore the Nodes

    { Prepare Charts }
    frmMain.preparePreSimulationChart;
    frmMain.prepareSimulationChart(SamplingResult);

  end;
end;

procedure TfrmSimulation.RestoreNodes;
var
  i: Integer;
begin
  for i := 0 to frmMain.Nodes.Count - 1 do frmMain.Nodes[i].Restore;
end;

end.

